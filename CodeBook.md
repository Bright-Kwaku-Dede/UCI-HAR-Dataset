\# CodeBook for Human Activity Recognition Dataset



\## Study Design

This dataset contains sensor measurements collected from 30 volunteers (aged 19-48) performing 6 different activities while wearing Samsung Galaxy S II smartphones. The smartphones' accelerometers and gyroscopes captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50 Hz.



\## Data Collection

\- \*\*Subjects\*\*: 30 volunteers

\- \*\*Activities\*\*: 6 (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING)

\- \*\*Sensors\*\*: Accelerometer and Gyroscope

\- \*\*Sampling rate\*\*: 50 Hz

\- \*\*Window size\*\*: 2.56 seconds with 50% overlap (128 readings per window)



\## Variables



\### Identifiers

\- \*\*subject\*\*: Identifier of the subject who performed the activity (1-30)

\- \*\*activity\*\*: Name of the activity performed

&nbsp; - WALKING

&nbsp; - WALKING\_UPSTAIRS

&nbsp; - WALKING\_DOWNSTAIRS

&nbsp; - SITTING

&nbsp; - STANDING

&nbsp; - LAYING



\### Measurement Variables (66 features)

All measurements are normalized to \[-1, 1] range and represent the average value for each subject-activity combination.



\#### Naming Convention

\- \*\*t\*\* prefix = time domain signals

\- \*\*f\*\* prefix = frequency domain signals (FFT applied)

\- \*\*Body\*\* = body acceleration signal

\- \*\*Gravity\*\* = gravitational acceleration signal

\- \*\*Acc\*\* = accelerometer measurement

\- \*\*Gyro\*\* = gyroscope measurement

\- \*\*Jerk\*\* = derived jerk signals

\- \*\*Mag\*\* = magnitude of signals (Euclidean norm)

\- \*\*mean\*\* = mean value

\- \*\*std\*\* = standard deviation

\- \*\*X, Y, Z\*\* = axial directions



\#### Time Domain Variables (prefix 't')

\- tBodyAcc\_mean\_X, tBodyAcc\_mean\_Y, tBodyAcc\_mean\_Z

\- tBodyAcc\_std\_X, tBodyAcc\_std\_Y, tBodyAcc\_std\_Z

\- tGravityAcc\_mean\_X, tGravityAcc\_mean\_Y, tGravityAcc\_mean\_Z

\- tGravityAcc\_std\_X, tGravityAcc\_std\_Y, tGravityAcc\_std\_Z

\- tBodyAccJerk\_mean\_X, tBodyAccJerk\_mean\_Y, tBodyAccJerk\_mean\_Z

\- tBodyAccJerk\_std\_X, tBodyAccJerk\_std\_Y, tBodyAccJerk\_std\_Z

\- tBodyGyro\_mean\_X, tBodyGyro\_mean\_Y, tBodyGyro\_mean\_Z

\- tBodyGyro\_std\_X, tBodyGyro\_std\_Y, tBodyGyro\_std\_Z

\- tBodyGyroJerk\_mean\_X, tBodyGyroJerk\_mean\_Y, tBodyGyroJerk\_mean\_Z

\- tBodyGyroJerk\_std\_X, tBodyGyroJerk\_std\_Y, tBodyGyroJerk\_std\_Z

\- tBodyAccMag\_mean, tBodyAccMag\_std

\- tGravityAccMag\_mean, tGravityAccMag\_std

\- tBodyAccJerkMag\_mean, tBodyAccJerkMag\_std

\- tBodyGyroMag\_mean, tBodyGyroMag\_std

\- tBodyGyroJerkMag\_mean, tBodyGyroJerkMag\_std



\#### Frequency Domain Variables (prefix 'f')

\- fBodyAcc\_mean\_X, fBodyAcc\_mean\_Y, fBodyAcc\_mean\_Z

\- fBodyAcc\_std\_X, fBodyAcc\_std\_Y, fBodyAcc\_std\_Z

\- fBodyAccJerk\_mean\_X, fBodyAccJerk\_mean\_Y, fBodyAccJerk\_mean\_Z

\- fBodyAccJerk\_std\_X, fBodyAccJerk\_std\_Y, fBodyAccJerk\_std\_Z

\- fBodyGyro\_mean\_X, fBodyGyro\_mean\_Y, fBodyGyro\_mean\_Z

\- fBodyGyro\_std\_X, fBodyGyro\_std\_Y, fBodyGyro\_std\_Z

\- fBodyAccMag\_mean, fBodyAccMag\_std

\- fBodyBodyAccJerkMag\_mean, fBodyBodyAccJerkMag\_std

\- fBodyBodyGyroMag\_mean, fBodyBodyGyroMag\_std

\- fBodyBodyGyroJerkMag\_mean, fBodyBodyGyroJerkMag\_std



\## Data Transformations



\### Step 1: Merge Training and Test Sets

\- Training data: 7,352 observations (70% of 30 subjects)

\- Test data: 2,947 observations (30% of 30 subjects)

\- \*\*Combined\*\*: 10,299 observations



\### Step 2: Extract Mean and Standard Deviation

\- Selected only features containing `mean()` and `std()` in their names

\- Excluded meanFreq() (weighted frequency average)

\- \*\*Result\*\*: 66 measurements extracted



\### Step 3: Apply Descriptive Activity Names

\- Replaced numeric activity codes (1-6) with descriptive labels

\- Activity mapping applied to all observations



\### Step 4: Label Variables Descriptively

\- Applied feature names to all measurement columns

\- Cleaned variable names:

&nbsp; - Removed parentheses: `()` → removed

&nbsp; - Replaced hyphens with underscores: `-` → `\_`

&nbsp; - Converted to lowercase for consistency



\### Step 5: Create Independent Tidy Dataset

\- Grouped data by subject and activity

\- Calculated mean of each measurement for each group

\- \*\*Final dimensions\*\*: 180 rows (30 subjects × 6 activities) × 68 columns (subject, activity, 66 measurements)



\## Data Output

The final tidy dataset is saved in `tidy\_data.txt` with the following characteristics:

\- \*\*Format\*\*: Space-separated text file

\- \*\*Header\*\*: Yes (variable names in first row)

\- \*\*Rows\*\*: 180 (one per subject-activity combination)

\- \*\*Columns\*\*: 68 (subject + activity + 66 measurements)

\- \*\*Values\*\*: Normalized to \[-1, 1] range, averages for each subject-activity pair



\## Units

\- Accelerometer measurements: standard gravity units 'g'

\- Gyroscope measurements: radians/second

\- All values are normalized and centered



\## References

\- Original dataset: Human Activity Recognition Using Smartphones Dataset Version 1.0

\- Source: https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

\- Citation: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.

