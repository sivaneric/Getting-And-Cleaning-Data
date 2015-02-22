Course Project - Getting and Cleaning Data (course id: getdata-011)
===================================================================

Data Analysis of Human Activity Recognition Data using Smartphones
------------------------------------------------------------------

### Run Analysis Script by Cimi Sivaneri Feb 21, 2015

##### Dataset Version 1.0 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities wearubg a Samsubg Galaxy SII Smartphone on the waist:
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYI
Using its embedded accelerometer and gyroscope, the team captured 3-axial linear acceleration and 3-axial angular  velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, training data with 70% of the volunteers and the test data with 30% of the volunteers. 

The objective of this project is to develop an R script, called run_analysis.R, to prepare tidy data that can be used for further analysis.  Following are the major tasks performed by this script:

The following datasets were downloaded and made available in the working directory:

1. activity_labels.txt - Contains the names of the 6 activities tracked
2. features.txt - Lists all the features
3. X_train.txt - First partition of the data collecfted for 70% of the 30 volunteers participated
4. y_train.txt - Contains Training labels
5. subject_train.txt - Contains the ids of the train subjects
6. X_test.txt - First partition of the data collected for 70% of the 30 volunteers participated
7. y_test.txt - Contains Training labels
8. subject_test.txt - Contains the ids of the test subjects

* Reads all the .txt files and creates data frames for training data, test data, activity ids, subjects, activity labels and features
* Assigns descriptive column names to the data frame columns
* Adds subject id and activit id for the training data and test data (using cbind)
* Merges both the training data and test data to create one cons_data (using rbind)
* Extracts required mean and std deviation columns of each measurement (using grep)
* Assigns labels of descriptive activity names from the activity_labels.txt to the above data (using merge)
* Reshapes the above data to include mean of each variable for each activity by subject (using melt and dcast)
* Creates a new tidy data set with the above data

## Data Source

Data collection and Analysis Team: 
Human Activity Recognition Using Smartphones Dataset Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws

[Full Description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[Data Source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
