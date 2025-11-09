# Human Activity Recognition Data Analysis Script
# This script processes UCI HAR Dataset and creates a tidy dataset
# 
# Requirements:
# - Working directory should contain the UCI HAR Dataset folder
# - R package: dplyr (install.packages("dplyr"))
#
# Usage:
# setwd("path/to/UCI HAR Dataset")
# source("run_analysis.R")

library(dplyr)

# ============================================================================
# Read feature names and activity labels
# ============================================================================
features <- read.table("features.txt", stringsAsFactors = FALSE)
activity_labels <- read.table("activity_labels.txt", stringsAsFactors = FALSE)

colnames(activity_labels) <- c("activity_id", "activity_name")

# ============================================================================
# Read training data
# ============================================================================
train_x <- read.table("train/X_train.txt")
train_y <- read.table("train/y_train.txt")
train_subject <- read.table("train/subject_train.txt")

# ============================================================================
# Read test data
# ============================================================================
test_x <- read.table("test/X_test.txt")
test_y <- read.table("test/y_test.txt")
test_subject <- read.table("test/subject_test.txt")

print("All data files loaded successfully!")

# ============================================================================
# STEP 1: Merge training and test sets to create one data set
# ============================================================================
merged_x <- rbind(train_x, test_x)
merged_y <- rbind(train_y, test_y)
merged_subject <- rbind(train_subject, test_subject)

# Assign column names to features
colnames(merged_x) <- features$V2

print("Step 1: Merged training and test datasets")
print(paste("Combined data dimensions:", nrow(merged_x), "rows x", ncol(merged_x), "columns"))

# ============================================================================
# STEP 2: Extract only measurements on mean and standard deviation
# ============================================================================
mean_std_cols <- grep("mean\\(\\)|std\\(\\)", colnames(merged_x))
mean_std_data <- merged_x[, mean_std_cols]

print("Step 2: Extracted mean and standard deviation measurements")
print(paste("Extracted features:", ncol(mean_std_data)))

# ============================================================================
# STEP 3: Use descriptive activity names to name activities
# ============================================================================
colnames(merged_y) <- "activity_id"
activity_data <- left_join(data.frame(activity_id = merged_y$activity_id), 
                           activity_labels, by = "activity_id")
activity_names <- activity_data$activity_name

print("Step 3: Applied descriptive activity names")

# ============================================================================
# STEP 4: Appropriately label data set with descriptive variable names
# ============================================================================
colnames(merged_subject) <- "subject"
tidy_data_step4 <- cbind(merged_subject, 
                         activity = activity_names,
                         mean_std_data)

# Clean up variable names
# Remove parentheses
names(tidy_data_step4) <- gsub("\\(\\)", "", names(tidy_data_step4))
# Replace hyphens with underscores
names(tidy_data_step4) <- gsub("-", "_", names(tidy_data_step4))
# Convert to lowercase
names(tidy_data_step4) <- tolower(names(tidy_data_step4))

print("Step 4: Labeled data set with descriptive variable names")
print(paste("Current dataset dimensions:", nrow(tidy_data_step4), "rows x", ncol(tidy_data_step4), "columns"))

# ============================================================================
# STEP 5: Create independent tidy data set with average of each variable
#         for each activity and each subject
# ============================================================================
final_tidy_data <- tidy_data_step4 %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), \(x) mean(x, na.rm = TRUE)), .groups = "drop")

print("Step 5: Created tidy dataset with averages by subject and activity")
print(paste("Final tidy dataset dimensions:", nrow(final_tidy_data), "rows x", ncol(final_tidy_data), "columns"))

# ============================================================================
# Write the final tidy dataset to file
# ============================================================================
write.table(final_tidy_data, "tidy_data.txt", row.names = FALSE, quote = FALSE)

print("✓ Analysis complete!")
print("✓ Output file created: tidy_data.txt")
print("")
print("Dataset Summary:")
print(paste("- Subjects: 1-30"))
print(paste("- Activities: 6 (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)"))
print(paste("- Total observations: 180 (30 subjects × 6 activities)"))
print(paste("- Total variables: 68 (subject + activity + 66 measurements)"))
print("")
print("First few rows of tidy dataset:")
print(head(final_tidy_data))