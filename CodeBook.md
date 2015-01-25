This codebook describes the data set stored in the file tidyDataSchindler.txt. The data
set is called tidyData in this document.The raw data set was downloaded from:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip@ 20150118The data stems from an experiment where 30 volunteers/subjects performed various activities whilst carrying a Samsung smart phone. The original data and  a description of the experiment can be found here:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+SmartphonestidyData contains 81 variables and 180 observations. It is stored in a text file tidyDataSchindler.txt. 
The text file can be read into R using the following command:

data <- read.table(file_path, header = TRUE)

The text file is generated with the R script „run_analysis.R“. This script reads the raw data 
stored in a folder „UCI HAR Dataset“ and produces the tidyData. For more information on its usage please
read the README.RD file. It first merges two raw data sets (the volunteers in the experiment were  broken up into two groups train/test) into one data set.

This data set contains  561 variables (time and frequency domain) that were deduced from the original measurements of two sensors in the phone (accelerometer and gyroscope). All 561 variables/features
are normalized and bounded within [-1,1]. 

From this big data set, tidyData is generated with the following steps
- only the measurements on the mean and standard deviation for each measurement are extracted
- variables for the volunteer number (1-30) and activities (WALKING, WALKING_UPSTAIRS ,WALKING_DOWNSTAIRS
  SITTING, STANDING, LAYING are added
- the average of each variable for each activity and each volunteer/subject is calculated
- tidyData is ordered according to volunteer number and activity
- tidyData is written to tidyDataSchindler.txt

The variable names are as follows:
 [1] "volunteerNumber"                               "activity"                                     
 [3] "tBodyAcc.mean...X_VolunteerMean"               "tBodyAcc.mean...Y_VolunteerMean"              
 [5] "tBodyAcc.mean...Z_VolunteerMean"               "tGravityAcc.mean...X_VolunteerMean"           
 [7] "tGravityAcc.mean...Y_VolunteerMean"            "tGravityAcc.mean...Z_VolunteerMean"           
 [9] "tBodyAccJerk.mean...X_VolunteerMean"           "tBodyAccJerk.mean...Y_VolunteerMean"          
[11] "tBodyAccJerk.mean...Z_VolunteerMean"           "tBodyGyro.mean...X_VolunteerMean"             
[13] "tBodyGyro.mean...Y_VolunteerMean"              "tBodyGyro.mean...Z_VolunteerMean"             
[15] "tBodyGyroJerk.mean...X_VolunteerMean"          "tBodyGyroJerk.mean...Y_VolunteerMean"         
[17] "tBodyGyroJerk.mean...Z_VolunteerMean"          "tBodyAccMag.mean.._VolunteerMean"             
[19] "tGravityAccMag.mean.._VolunteerMean"           "tBodyAccJerkMag.mean.._VolunteerMean"         
[21] "tBodyGyroMag.mean.._VolunteerMean"             "tBodyGyroJerkMag.mean.._VolunteerMean"        
[23] "fBodyAcc.mean...X_VolunteerMean"               "fBodyAcc.mean...Y_VolunteerMean"              
[25] "fBodyAcc.mean...Z_VolunteerMean"               "fBodyAcc.meanFreq...X_VolunteerMean"          
[27] "fBodyAcc.meanFreq...Y_VolunteerMean"           "fBodyAcc.meanFreq...Z_VolunteerMean"          
[29] "fBodyAccJerk.mean...X_VolunteerMean"           "fBodyAccJerk.mean...Y_VolunteerMean"          
[31] "fBodyAccJerk.mean...Z_VolunteerMean"           "fBodyAccJerk.meanFreq...X_VolunteerMean"      
[33] "fBodyAccJerk.meanFreq...Y_VolunteerMean"       "fBodyAccJerk.meanFreq...Z_VolunteerMean"      
[35] "fBodyGyro.mean...X_VolunteerMean"              "fBodyGyro.mean...Y_VolunteerMean"             
[37] "fBodyGyro.mean...Z_VolunteerMean"              "fBodyGyro.meanFreq...X_VolunteerMean"         
[39] "fBodyGyro.meanFreq...Y_VolunteerMean"          "fBodyGyro.meanFreq...Z_VolunteerMean"         
[41] "fBodyAccMag.mean.._VolunteerMean"              "fBodyAccMag.meanFreq.._VolunteerMean"         
[43] "fBodyBodyAccJerkMag.mean.._VolunteerMean"      "fBodyBodyAccJerkMag.meanFreq.._VolunteerMean" 
[45] "fBodyBodyGyroMag.mean.._VolunteerMean"         "fBodyBodyGyroMag.meanFreq.._VolunteerMean"    
[47] "fBodyBodyGyroJerkMag.mean.._VolunteerMean"     "fBodyBodyGyroJerkMag.meanFreq.._VolunteerMean"
[49] "tBodyAcc.std...X_VolunteerMean"                "tBodyAcc.std...Y_VolunteerMean"               
[51] "tBodyAcc.std...Z_VolunteerMean"                "tGravityAcc.std...X_VolunteerMean"            
[53] "tGravityAcc.std...Y_VolunteerMean"             "tGravityAcc.std...Z_VolunteerMean"            
[55] "tBodyAccJerk.std...X_VolunteerMean"            "tBodyAccJerk.std...Y_VolunteerMean"           
[57] "tBodyAccJerk.std...Z_VolunteerMean"            "tBodyGyro.std...X_VolunteerMean"              
[59] "tBodyGyro.std...Y_VolunteerMean"               "tBodyGyro.std...Z_VolunteerMean"              
[61] "tBodyGyroJerk.std...X_VolunteerMean"           "tBodyGyroJerk.std...Y_VolunteerMean"          
[63] "tBodyGyroJerk.std...Z_VolunteerMean"           "tBodyAccMag.std.._VolunteerMean"              
[65] "tGravityAccMag.std.._VolunteerMean"            "tBodyAccJerkMag.std.._VolunteerMean"          
[67] "tBodyGyroMag.std.._VolunteerMean"              "tBodyGyroJerkMag.std.._VolunteerMean"         
[69] "fBodyAcc.std...X_VolunteerMean"                "fBodyAcc.std...Y_VolunteerMean"               
[71] "fBodyAcc.std...Z_VolunteerMean"                "fBodyAccJerk.std...X_VolunteerMean"           
[73] "fBodyAccJerk.std...Y_VolunteerMean"            "fBodyAccJerk.std...Z_VolunteerMean"           
[75] "fBodyGyro.std...X_VolunteerMean"               "fBodyGyro.std...Y_VolunteerMean"              
[77] "fBodyGyro.std...Z_VolunteerMean"               "fBodyAccMag.std.._VolunteerMean"              
[79] "fBodyBodyAccJerkMag.std.._VolunteerMean"       "fBodyBodyGyroMag.std.._VolunteerMean"         
[81] "fBodyBodyGyroJerkMag.std.._VolunteerMean"   