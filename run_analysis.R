## This script was developed as the Course Project for Getting and Cleaning Data (Course Id: getdata-011)
## The scope of this script is to get the data on Human Activity Recognition on Smartphones and tidy the data
## for further analysis
## This script assumes the following datasets have beend downloaded and available in the working directory
## The following datasets were downloaded and made available in the working directory:
## 1. activity_labels.txt - Contains the names of the 6 activities tracked
## 2. features.txt - Lists all the features
## 3. X_train.txt - First partition of the data collecfted for 70% of the 30 volunteers participated
## 4. y_train.txt - Contains Training labels
## 5. subject_train.txt - Contains the ids of the train subjects
## 6. X_test.txt - First partition of the data collected for 70% of the 30 volunteers participated
## 7. y_test.txt - Contains Training labels
## 8. subject_test.txt - Contains the ids of the test subjects

## Following are the basic tasks performed by this script
## * Reads all the .txt files and creates data frames for training data, test data, activity ids, subjects, activity labels and features
## * Assigns descriptive column names to the data frame columns
## * Adds subject id and activit id for the training data and test data (using cbind)
## * Merges both the training data and test data to create one cons_data (using rbind)
## * Extracts required mean and std deviation columns of each measurement (using grep)
## * Assigns labels of descriptive activity names from the activity_labels.txt to the above data (using merge)
## * Reshapes the above data to include mean of each variable for each activity by subject (using melt and dcast)
## * Creates a new tidy data set with the above data

## This script requires "reshape2" package. Please ensure this package has already been installed;


library(reshape2)
  
## Reading all 8 .txt files needed for this exercise
  
## Read all activities and their names and label the aproppriate columns 

trainset <- read.table("X_train.txt")
testset <- read.table("X_test.txt")

trainsub <- read.table("subject_train.txt", col.names=c("subid"))
testsub <- read.table("subject_test.txt", col.names=c("subid"))

trainact <- read.table("y_train.txt", col.names=c("actid"))
testact <- read.table("y_test.txt", col.names=c("actid"))

actlabels <- read.table("activity_labels.txt",col.names=c("actid","actname"))
features <- read.table("features.txt")  

## assign column names to the trainset and testsit data frames with the features read

featlist <-  features[,2]
colnames(trainset) <- featlist
colnames(testset) <- featlist

## add subid (from trainsub/testsub) and actid (from trainact/testact) columns to trainset/testset data frames

trainset <- cbind(trainact, trainsub, trainset)
testset <- cbind(testact, testsub, testset)

## Consolidate trainset and testset into one single data frame

fullset <- rbind(trainset,testset)
  
## Extract only measurement variables that are mean or standard deviations - use grep to extract the column names

meancols <- names(fullset)[grep("-mean\\(",names(fullset), ignore.case=TRUE)]
stdcols <- names(fullset)[grep("-std\\(", names(fullset), ignore.case=TRUE)]

extrdata <- fullset[,c("actid", "subid", meancols, stdcols)]
  
## Merge the consolidated data containing means and standard deviations with activity names from actlabels df

mergedata <- merge(actlabels, extrdata, by.x="actid", by.y="actid", all=TRUE)
  
## Identify the variables and measures then cast the data to capture the average of each measure for each variable,
## each activity and each subject and write the result to text file - suppress row numbers getting written

meltdata <- melt(mergedata, id=c("actid","actname","subid"))
tidydata <- dcast(meltdata, actid + actname + subid ~ variable, mean)
## nrow(tidydata)
## ncol(tidydata)
write.table(tidydata,"tidy_measures.txt", row.names=FALSE)

