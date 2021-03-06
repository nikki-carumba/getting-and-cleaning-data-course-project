# Getting and Cleaning Data- Course Project

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Files
This repository contains the following files:
- `README.md` provides an overview of the data set and how it was created.
- `Codebook.md` describes the variables, the data, and transformations performed to clean up the data
- `run_analysis.R` contains all the code to perform in getting and cleaning data. These are the expected outcomes of the project: 
  1. Merge training and test sets to create one data set
  1. Extract only the mean and standard deviation measurements
  1. Extract only the mean and standard deviation measurements
  1. Label data set with descriptive variable names
  1. From the outcome of 4, create an independent data set with average of each variabe for each activity and subject  
  Import and run this file in RStudio.
- `tidy.txt` output of the file, `run_analysis.R`. This is a text file containing space-separated values.
