
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

run_analysis <- function() {
        
        # Perfrom setup
        # load the dplyr and data.table library
        library(dplyr)
        library(data.table)
        
        # check if raw dataset exists
        if (FALSE == file.exists("UCI HAR Dataset")) {
                stop("The raw data - UCI HAR Dataset - is not in the working directory")
        }
        
        # load and merge data
        # load train data set into R
        trainData <- read.table("UCI HAR Dataset/train/X_train.txt")
        # load test data set into R
        testData <- read.table("UCI HAR Dataset/test/X_test.txt")
        
        # merge the two datasets
        data <- rbind(trainData, testData)
        
        # Extract only the measurements on the mean and standard deviation for each measurement. 
        # get features from file
        features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)
        
        # label the variables and be sure to use valid, unique R names
        colnames(data) <- make.names(features[,2], unique=TRUE)
          
        # select mean and standard deviation measurements
        subData <- select(data, contains("mean",ignore.case=FALSE), contains("std",ignore.case=FALSE))
        # since I am used to working with tables I will convert my data frame
        # I tried loading the data directly as a table but R always crashed on me
        subData <- data.table(subData)
        
        # name the activities and add the subject data in the data set
        # get activities
        activityFactor <- getActivityFactor()
        # add activity
        subData[, "activity" := activityFactor]
        
        # get volunteer information in form of a vector 
        subjectVector <- getSubjectInfo();
        # add the volunteer column
        subData[, "volunteerNumber" := subjectVector]

        # average of each variable for each activity and each volunteer
        sumData <- subData %>% group_by(volunteerNumber,activity) %>% summarise_each(funs(mean))
        
        # create tidy data set
        # order the data
        sumData <- arrange(sumData,volunteerNumber,activity)
        # create new variable names
        varNames <- names(sumData)
        newVariableNames <- paste(varNames, "VolunteerMean", sep="_")
        # set the new variable names without copying the table and keeping the first two column names
        setnames(sumData, c("volunteerNumber", "activity", newVariableNames[3:length(newVariableNames)]))
        
        # write the tidy data to the disk
        write.table(sumData, "tidyDataSchindler.txt", row.name=FALSE)
}

getActivityFactor <- function() {
        # functions loads training and test activity data into R and returns a merged factor with 
        # descriptive labels
        
        # load training activty into R
        actTrainData <- read.table("UCI HAR Dataset/train/y_train.txt")
        # load test activty into R
        actTestData <- read.table("UCI HAR Dataset/test/y_test.txt")
        
        # merge training and test data
        actData <- rbind(actTrainData,actTestData)
        
        # load labels from file
        actLabels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)
        
        # convert to factor
        actFactor <- factor(actData[,1], levels=actLabels[,1], labels=actLabels[,2])
    
        return(actFactor)
}

getSubjectInfo <- function() {
        # functions loads training and test subject data into R and returns a merged vector
        
        # load files
        subjectTrainData <- read.table("UCI HAR Dataset/train/subject_train.txt")
        subjectTestData <- read.table("UCI HAR Dataset/test/subject_test.txt")
        
        # merge the two data sets
        subjectData <- rbind(subjectTrainData,subjectTestData)
        
        # return a vector
        return(subjectData[,1])

}