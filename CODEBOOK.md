Code Book for run_analysis.R script - Course Project for Getting and Cleaning Data
==================================================================================

Section 1: Background Information on the source data
----------------------------------------------------

## by Cimi Sivaneri Feb 21, 2015

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals(prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
(Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ  
* tGravityAcc-XYZ  
* tBodyAccJerk-XYZ  
* tBodyGyro-XYZ  
* tBodyGyroJerk-XYZ  
* tBodyAccMag  
* tGravityAccMag  
* tBodyAccJerkMag  
* tBodyGyroMag  
* tBodyGyroJerkMag  
* fBodyAcc-XYZ  
* fBodyAccJerk-XYZ  
* fBodyGyro-XYZ  
* fBodyAccMag  
* fBodyAccJerkMag  
* fBodyGyroMag  
* fBodyGyroJerkMag  

The set of variables that were estimated from these signals are: 

mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.   
iqr(): Interquartile range   
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal     
kurtosis(): kurtosis of the frequency domain signal     
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:  

gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean  

Section 2: List of source data sets
-----------------------------------

The following datasets were downloaded and made available in the working directory:

1. activity_labels.txt - Contains the names of the 6 activities tracked  
2. features.txt - Lists all the features  
3. X_train.txt - First partition of the data collecfted for 70% of the 30 volunteers participated  
4. y_train.txt - Contains Training labels  
5. subject_train.txt - Contains the ids of the train subjects  
6. X_test.txt - First partition of the data collected for 70% of the 30 volunteers participated  
7. y_test.txt - Contains Training labels  
8. subject_test.txt - Contains the ids of the test subjects  

Section 3: Processing to create resultant tidy data set
-------------------------------------------------------

1. All files were read into individul data frames  
2. Column Names were assigned to the Training Set DF and Test Set DF with the feature names from the features.txt file (#2 above)  
3. Activity Ids and Subject Id columns were appended from the subject files and the training label files(#5, #8, #4, and # 7)  
4. Both the training data and the test data were merged  
5. A subset data set created extracting measurement variables on the mean and the standard deviations  
6. Merged with activity labels data to include descriptive names of activities  
7. Average of each variable for each disctinct combination of activity and subject were calculated for the mean and the standard deviation measurments  
8. A new data set called "tidy_measures.txt" was created with the data in step 7.  

Section 4: Data Fields in tidy_measures.txt data set
-------------------------------------------------------

The first record of this file are the column headers.  Below are the descriptions of each of these fields

Variables prefixed with 't' are time domain signals and with 'f' are frequency domain signals

Field Name  |  Type |  Description  
---------------  | :------  | :---------------  
Actid  |  Integer  |  Activity Id used in the source data sets  
Actname  |  Char  |  Activity Name  
subid   |  Integer   |  Id of the Subject  
tBodyAcc-mean()-X   |  Number  | Average of Mean of Accelerometer signals - Body Acceleration in Y direction  
tBodyAcc-mean()-Y  |  Number  |  Average of Mean of Accelerometer signals - Body Acceleration in X direction  
tBodyAcc-mean()-Z  |  Number  |  Average of Mean of Accelerometer signals - Body Acceleration in Z direction   
tGravityAcc-mean()-X  |  Number  |  Average of Mean of Accelerometer signals - Gravity Acceleration in Y direction  
tGravityAcc-mean()-Y  |  Number  |  Average of Mean of Accelerometer signals - Gravity Acceleration in X direction  
tGravityAcc-mean()-Z  |  Number  |  Average of Mean of Accelerometer signals - Gravity Acceleration in Z direction  
 tBodyAccJerk-mean()-X    | Number |  Average of Mean of Jerk signals - Body Acceleration in Y direction  
tBodyAccJerk-mean()-Y  |  Number  |  Average of Mean of Jerk signals - Body Acceleration in X direction  
tBodyAccJerk-mean()-Z  |  Number  |  Average of Mean of Jerk signals - Body Acceleration in Z direction  
tBodyGyro-mean()-X  |  Number  |  Average of Mean of Gyroscope signals - Gravity Acceleration in Y direction  
tBodyGyro-mean()-Y  |  Number  |  Average of Mean of Gyroscope signals - Gravity Acceleration in X direction  
tBodyGyro-mean()-Z  |  Number  |  Average of Mean of Gyroscope signals - Gravity Acceleration in Z direction  
tBodyGyroJerk-mean()-X  |  Number  |  Average of Mean of Gyroscope Jerk signals - Gravity Acceleration in Y direction  
tBodyGyroJerk-mean()-Y  |  Number  |  Average of Mean of Gyroscope Jerk signals - Gravity Acceleration in X direction  
tBodyGyroJerk-mean()-Z  |  Number  |  Average of Mean of Gyroscope Jerk signals - Gravity Acceleration in Z direction   
tBodyAccMag-mean()  |  Number  |  Average of Mean of Magnitude of three-dimensional signals - Body Acceleration  
tGravityAccMag-mean()	  |  Number  |  Average of Mean of Magnitude of three-dimensional signals - Gravity Acceleration  
tBodyAccJerkMag-mean()  |  Number  |  Average of Mean of Magnitude of three-dimensional signals - Jerk Signal  
tBodyGyroMag-mean()  |  Number  |  Average of Mean of Magnitude of three-dimensional signals - Gyroscope  
tBodyGyroJerkMag-mean()  |  Number  |  Average of Mean of Magnitude of three-dimensional signals - Gyroscope  
fBodyAcc-mean()-X  |  Number  |  Average of Mean of Accelerometer signals - Body Acceleration in Y direction  
fBodyAcc-mean()-Y  |  Number  |  Average of Mean of Accelerometer signals - Body Acceleration in X direction  
fBodyAcc-mean()-Z  |  Number  |  Average of Mean of Accelerometer signals - Body Acceleration in Z direction   
fBodyAccJerk-mean()-X  |  Number  |  Average of Mean of Jerk signals - Body Acceleration in Y direction  
fBodyAccJerk-mean()-Y  |  Number  |  Average of Mean of Jerk signals - Body Acceleration in X direction  
fBodyAccJerk-mean()-Z  |  Number  |  Average of Mean of Jerk signals - Body Acceleration in Z direction  
fBodyGyro-mean()-X  |  Number	  |  Average of Mean of Gyroscope signals - Gravity Acceleration in Y direction  
fBodyGyro-mean()-Y  |  Number	  |  Average of Mean of Gyroscope signals - Gravity Acceleration in X direction  
fBodyGyro-mean()-Z  |  Number	  |  Average of Mean of Gyroscope signals - Gravity Acceleration in Z direction  
fBodyAccMag-mean()  |  Number  |  Average of Mean of Magnitude of three-dimensional signals - Body Acceleration  
fBodyBodyAccJerkMag-mean()  |  Number  |  Average of Mean of Magnitude of three-dimensional signals - Jerk Signal  
fBodyBodyGyroMag-mean()  |  Number  |  Average of Mean of Magnitude of three-dimensional signals - Gyroscope  
fBodyBodyGyroJerkMag-mean()  |  Number  |Average of Mean of Magnitude of three-dimensional signals - Gyroscope  
tBodyAcc-std()-X   |  Number  | Average of Std. Dev. of Accelerometer signals - Body Acceleration in Y direction  
tBodyAcc-std()-Y  |  Number  |  Average of Std. Dev. of Accelerometer signals - Body Acceleration in X direction  
tBodyAcc-std()-Z  |  Number  |  Average of Std. Dev. of Accelerometer signals - Body Acceleration in Z direction   
tGravityAcc-std()-X  |  Number  |  Average of Std. Dev. of Accelerometer signals - Gravity Acceleration in Y direction  
tGravityAcc-std()-Y  |  Number  |  Average of Std. Dev. of Accelerometer signals - Gravity Acceleration in X direction  
tGravityAcc-std()-Z  |  Number  |  Average of Std. Dev. of Accelerometer signals - Gravity Acceleration in Z direction  
 tBodyAccJerk-std()-X	  | Number |  Average of Std. Dev. of Jerk signals - Body Acceleration in Y direction  
tBodyAccJerk-std()-Y  |  Number  |  Average of Std. Dev. of Jerk signals - Body Acceleration in X direction  
tBodyAccJerk-std()-Z  |  Number  |  Average of Std. Dev. of Jerk signals - Body Acceleration in Z direction  
tBodyGyro-std()-X  |  Number  |  Average of Std. Dev. of Gyroscope signals - Gravity Acceleration in Y direction  
tBodyGyro-std()-Y  |  Number  |  Average of Std. Dev. of Gyroscope signals - Gravity Acceleration in X direction   
tBodyGyro-std()-Z  |  Number  |  Average of Std. Dev. of Gyroscope signals - Gravity Acceleration in Z direction   
tBodyGyroJerk-std()-X  |  Number  |  Average of Std. Dev. of Gyroscope Jerk signals - Gravity Acceleration in Y direction  
tBodyGyroJerk-std()-Y  |  Number  |  Average of Std. Dev. of Gyroscope Jerk signals - Gravity Acceleration in X direction  
tBodyGyroJerk-std()-Z  |  Number  |  Average of Std. Dev. of Gyroscope Jerk signals - Gravity Acceleration in Z direction  
tBodyAccMag-std()  |  Number  |  Average of Std. Dev. of Magnitude of three-dimensional signals - Body Acceleration  
tGravityAccMag-std()	  |  Number  |  Average of Std. Dev. of Magnitude of three-dimensional signals - Gravity Acceleration  
tBodyAccJerkMag-std()  |  Number  |  Average of Std. Dev. of Magnitude of three-dimensional signals - Jerk Signal  
tBodyGyroMag-std()  |  Number  |  Average of Std. Dev. of Magnitude of three-dimensional signals - Gyroscope  
tBodyGyroJerkMag-std()  |  Number  |  Average of Std. Dev. of Magnitude of three-dimensional signals - Gyroscope  
fBodyAcc-std()-X  |  Number  |  Average of Std. Dev. of Accelerometer signals - Body Acceleration in Y direction   
fBodyAcc-std()-Y  |  Number  |  Average of Std. Dev. of Accelerometer signals - Body Acceleration in X direction  
fBodyAcc-std()-Z  |  Number  |  Average of Std. Dev. of Accelerometer signals - Body Acceleration in Z direction   
fBodyAccJerk-std()-X  |  Number  |  Average of Std. Dev. of Jerk signals - Body Acceleration in Y direction  
fBodyAccJerk-std()-Y  |  Number  |  Average of Std. Dev. of Jerk signals - Body Acceleration in X direction  
fBodyAccJerk-std()-Z  |  Number  |  Average of Std. Dev. of Jerk signals - Body Acceleration in Z direction  
fBodyGyro-std()-X  |  Number	  |  Average of Std. Dev. of Gyroscope signals - Gravity Acceleration in Y direction  
fBodyGyro-std()-Y  |  Number	  |  Average of Std. Dev. of Gyroscope signals - Gravity Acceleration in X direction  
fBodyGyro-std()-Z  |  Number	  |  Average of Std. Dev. of Gyroscope signals - Gravity Acceleration in Z direction  
fBodyAccMag-std()  |  Number  |  Average of Std. Dev. of Magnitude of three-dimensional signals - Body Acceleration  
fBodyBodyAccJerkMag-std()  |  Number  |  Average of Std. Dev. of Magnitude of three-dimensional signals - Jerk Signal  
fBodyBodyGyroMag-std()  |  Number  |  Average of Std. Dev. of Magnitude of three-dimensional signals - Gyroscope  
fBodyBodyGyroJerkMag-std()  |  Number  |Average of Std. Dev. of Magnitude of three-dimensional signals - Gyroscope  

