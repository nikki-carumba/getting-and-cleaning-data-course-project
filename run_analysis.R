# OVERVIEW
#   Using data collected from the accelerometers from the Samsung Galaxy S 
#   smartphone, clean the dataset and output the
#   resulting tidy data to a file named "tidy_data.txt".
#   Please see README.md for details.

filename <- "getdata_projectfiles_UCI HAR Dataset.zip"

## Check if file exists, if exists, download dataset
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}  
## Unzip dataset
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}
## Get all activities
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
activities[,2] <- as.character(activities[,2])

## Get all features
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

## Get only features that has measurements on mean and standard deviation
targetFeatures <- grep(".*mean.*|.*std.*", features[,2])
featureLabels <- features[targetFeatures,2]
featureLabels <- gsub('-mean', 'Mean', featureLabels)
featureLabels <- gsub('-std', 'Std', featureLabels)

# transform measurements: remove - ( )
featureLabels <- gsub('-|[()]', '', featureLabels)

# transform measurements: expand abbreviations
featureLabels <- gsub("^f", "frequencyDomain", featureLabels)
featureLabels <- gsub("^t", "timeDomain", featureLabels)
featureLabels <- gsub("Acc", "Accelerometer", featureLabels)
featureLabels <- gsub("Gyro", "Gyroscope", featureLabels)
featureLabels <- gsub("Mag", "Magnitude", featureLabels)
featureLabels <- gsub("Freq", "Frequency", featureLabels)
featureLabels <- gsub("mean", "Mean", featureLabels)
featureLabels <- gsub("std", "StandardDeviation", featureLabels)

# Load the datasets
train <- read.table("UCI HAR Dataset/train/X_train.txt")[targetFeatures]
trainActivities <- read.table("UCI HAR Dataset/train/y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)

test <- read.table("UCI HAR Dataset/test/X_test.txt")[targetFeatures]
testActivities <- read.table("UCI HAR Dataset/test/y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)

# merge datasets and add labels
allData <- rbind(train, test)
colnames(allData) <- c("subject", "activity", featureLabels)

# turn activities and subjects into factors
allData$activity <- factor(allData$activity, levels = activities[,1], labels = activities[,2])
allData$subject <- as.factor(allData$subject)

# get average of each measurement for each subject and activity
tidyData <- aggregate(allData[featureLabels], list(subject=allData$subject,activity=allData$activity), mean)
tidyData <- tidyData[order(tidyData$subject),]

# output to file "tidy_data.txt"
write.table(tidyData, "tidy_data.txt", row.names = FALSE, quote = FALSE)
