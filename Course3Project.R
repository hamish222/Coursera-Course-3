## Use source("C:\\Users\\Hamish\\Documents\\Educational Materials\\Coursera Data Science\\Course 3\\Course3Project.R") at the command line to run this script.

## Part 1
# Load test data.
testdata <- read.table("C:\\Users\\Hamish\\Documents\\Educational Materials\\Coursera Data Science\\Course 3\\UCI HAR Dataset\\test\\X_test.txt",header=TRUE)
# Load training data.
traindata <- read.table("C:\\Users\\Hamish\\Documents\\Educational Materials\\Coursera Data Science\\Course 3\\UCI HAR Dataset\\train\\X_train.txt",header=TRUE)
# Load and extract the variable names for the columns in testdata and traindata.
variableNames <- read.table("C:\\Users\\Hamish\\Documents\\Educational Materials\\Coursera Data Science\\Course 3\\UCI HAR Dataset\\features.txt",header=FALSE)
variableNames <- variableNames[,2]
# Limit attention to those variables that are means or standard deviations.
variableIndices <- c(grep("mean",variableNames),grep("std",variableNames))
variableNames  <-  variableNames[variableIndices]
# Extract the corresponding data from testdata and traindata.
testdata <- testdata[,variableIndices]
traindata <- traindata[,variableIndices]
# Re-name the variables for the test and training data sets.
names(testdata) <- variableNames
names(traindata) <- variableNames
# Combine the avg/std data from the test and training data.
alldata <- rbind(testdata,traindata)
# Load and combine the activity data for the test and training data.
testactivities <- read.table("C:\\Users\\Hamish\\Documents\\Educational Materials\\Coursera Data Science\\Course 3\\UCI HAR Dataset\\test\\y_test.txt",header=TRUE)
trainactivities <- read.table("C:\\Users\\Hamish\\Documents\\Educational Materials\\Coursera Data Science\\Course 3\\UCI HAR Dataset\\train\\y_train.txt",header=TRUE)
names(testactivities) <- "activity"
names(trainactivities) <- "activity"
activities <- rbind(testactivities ,trainactivities)
# Load and combine the subject data for the test and training data.
testsubjects <- read.table("C:\\Users\\Hamish\\Documents\\Educational Materials\\Coursera Data Science\\Course 3\\UCI HAR Dataset\\test\\subject_test.txt",header=TRUE)
trainsubjects <- read.table("C:\\Users\\Hamish\\Documents\\Educational Materials\\Coursera Data Science\\Course 3\\UCI HAR Dataset\\train\\subject_train.txt",header=TRUE)
names(testsubjects ) <- "subject"
names(trainsubjects ) <- "subject"
subjects <- rbind(testsubjects,trainsubjects)
# Prepend the subject and activity columns to alldata.
alldata <- cbind(subjects, activities, alldata) 
# Write the new data to a file.
write.table(alldata,"C:\\Users\\Hamish\\Documents\\Educational Materials\\Coursera Data Science\\Course 3\\Course3ProjectCombinedData.txt", row.names=FALSE)


## Part 2
# Use aggregate to compute the means for each activity and subject.
summary <- aggregate(alldata, by=list(alldata$activity,alldata$subject), FUN=mean,na.rm=TRUE)
# Remove the two columns that aggregate introduces.
summary$Group.1 <- NULL
summary$Group.2 <- NULL
# Write the summary means to a file.
write.table(summary,"C:\\Users\\Hamish\\Documents\\Educational Materials\\Coursera Data Science\\Course 3\\Course3ProjectSummaryData.txt", row.names=FALSE)


