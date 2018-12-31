# Getting and Cleaning Data- Course Project

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Files
This repository contains the following files:
- `README.md` provides an overview of the data set and how it was created.
- `CodeBook.md` describes the variables, the data, and any transformations or work that you performed to clean up the data
- `run_analysis.R` contains all the code to perform in getting and cleaning data. These are the outcomes of the project: 
1. Merge training and test sets to create one data set
2. Extract only the mean and standard deviation measurements
3. Extract only the mean and standard deviation measurements
4. Label data set with descriptive variable names
5. From the outcome of 4, create an independent data set with average of each variabe for each activity and subject  
  Import and run this file in RStudio.
- `tidy.txt` Output of the file, <code>run_analysis.R<code>. 
