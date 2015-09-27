##########################################################################################################

## Getting and Cleaning Data Course Project
## Rathna Lingamaneni
## 09/27/2015

# runAnalysis.r File Description:

# This script will perform the following steps on the UCI HAR Dataset downloaded from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

##########################################################################################################

library(reshape2)
# Clean up workspace
rm(list=ls())

#set working directory to the location where the UCI HAR Dataset was unzipped
setwd('C:/DataTools/CleaningData/Week3/UCI_HAR_Dataset/');

# Load activity labels + features
activityLabels <- read.table('./activity_labels.txt',header=FALSE)
activityLabels[,2] <- as.character(activityLabels[,2])
features <- read.table('./features.txt',header=FALSE)
features[,2] <- as.character(features[,2])

# Extract only the data on mean and standard deviation
featuresWanted <- grep(".*mean.*|.*std.*", features[,2])
featuresWanted.names <- features[featuresWanted,2]
featuresWanted.names = gsub('-mean', 'Mean', featuresWanted.names)
featuresWanted.names = gsub('-std', 'Std', featuresWanted.names)
featuresWanted.names <- gsub('[-()]', '', featuresWanted.names)


# Load the datasets
train <- read.table('./train/X_train.txt',header = FALSE)[featuresWanted]
trainActivities <- read.table('./train/Y_train.txt',header = FALSE)
trainSubjects <- read.table('./train/subject_train.txt',header = FALSE)
train <- cbind(trainSubjects, trainActivities, train)

test <- read.table('./test/X_test.txt',header = FALSE)[featuresWanted]
testActivities <- read.table('./test/Y_test.txt',header = FALSE)
testSubjects <- read.table('./test/subject_test.txt',header = FALSE)
test <- cbind(testSubjects, testActivities, test)

# merge datasets and add labels
allData <- rbind(train, test)
colnames(allData) <- c("subject", "activity", featuresWanted.names)

# turn activities & subjects into factors
allData$activity <- factor(allData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
allData$subject <- as.factor(allData$subject)

allData.melted <- melt(allData, id = c("subject", "activity"))
allData.mean <- dcast(allData.melted, subject + activity ~ variable, mean)

write.table(allData.mean, "tidyData.txt", row.names = FALSE, quote = FALSE)