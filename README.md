# Getting and Cleaning Data
Getting and Cleaning Data Course Project
The purpose of this project is to demonstrate skills to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.  The following reports submitted for this project.

1. a tidy data set as described below,
2. a link to a Github repository with R script for performing the analysis,
3. a code book that describes the variables, the data, and any transformations or work that performed to clean up the data called CodeBook.md.
4. also included a README.md in the repo with scripts (this file). This repo explains how all of the scripts work and how they are connected. 

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

The R script called run_analysis, does the following functions:

 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 3. Uses descriptive activity names to name the activities in the data set 
 4. Appropriately labels the data set with descriptive variable names. 

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

What you find in this repository
CodeBook.md: information about all the variables
README.md: this file (describing how the script works)
run_analysis.R: R script to transform raw data set in a tidy one

## How to create the tidy data set
1. download compressed raw data
2. unzip raw data and copy the directory UCI HAR Dataset to the working directory
3. open runAnalisys.R script in R Studio.
4. Update set working directory to your directory in line 24.

The end result is shown in the file tidyData.txt with the tidy data set located at current working directory.
