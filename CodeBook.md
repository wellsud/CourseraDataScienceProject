# Course Project Data Dictionary

This document describes the variables and part of the process to obtain the final data set of project assignment.
## Overview

The function run_analisys return a txt file which allows to create a dataset with 180 observatios of 81 variables. The variables represent the mean of the results from an experiment that was applied on 30 people that have six activities monitored by their smarthphones. The first column represents the subjects, the second column are the activities and the other columns are the mean of many measurements.
These variables were obtained by the following function applied over the full dataset:
```sh
select(full_dataset, subject, activity, matches(".mean().|.std().",ignore.case = FALSE), -starts_with("angle", ignore.case = T))  
```
## Variables
#### Subject
 [Integer]
 
 Numbers from 1 to 30 that represents each of the 30 experiment volunteers. Extracted of the merge of subject_train.txt and subject_teste.txt respectively.

#### Activity
[String as Factor]

The six measured activities. That is a factor column. These data are obtained applying the factor function over the sequential combination of y_train.txt and y_test.txt, followed by the use of the levels() function, with the activity labels as parameter. The values are:
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

## Mean and Standard Deviation Considerations
 All values from here are obtained applying a regular expression that filter all columns which have "mean" in the name, with the exception of the last , that begins with "angle" word. The values of all following columns are the means of all measures for each activity per subject. According to the original documentation the variables are divided between time domain ( prefix 't') and Frequency domain (prefix 'f'). The features are also normalized and bounded within [-1,1]. The column are:

#### tBodyAcc.mean...X
Time Domain: Body Acceleration mean in the X axis
#### tBodyAcc.mean...Y
Time Domain: Body Acceleration mean in the Y axis
#### tBodyAcc.mean...Z
Time Domain: Body Acceleration mean in the Z axis
#### tBodyAcc.std...X
Time Domain: Body Acceleration standard deviation in the X axis
#### tBodyAcc.std...Y
Time Domain: Body Acceleration standard seviation in the Y axis
#### tBodyAcc.std...Z
Time Domain: Body Acceleration Standard Deviation in the Z axis
#### tGravityAcc.mean...X
Time Domain: Gravity Acceleration mean in the X axis
#### tGravityAcc.mean...Y
Time Domain: Gravity Acceleration mean in the Y axis
#### tGravityAcc.mean...Z
Time Domain: Gravity Acceleration mean in the Z axis
#### tGravityAcc.std...X
Time Domain: Body Acceleration standard deviation in the X axis
#### tGravityAcc.std...Y
Time Domain: Body Acceleration standard deviation in the Y axis
#### tGravityAcc.std...Z
Time Domain: Body Acceleration standard deviation in the Z axis
#### tBodyAccJerk.mean...X
Time Domain: Jerk Acceleration mean in the X axis
#### tBodyAccJerk.mean...Y
Time Domain: Jerk Acceleration mean in the Y axis
#### tBodyAccJerk.mean...Z
Time Domain: Jerk Acceleration mean in the Z axis
#### tBodyAccJerk.std...X
Time Domain: Jerk Acceleration standard deviation in the X axis
#### tBodyAccJerk.std...Y
Time Domain: Jerk Acceleration standard deviation in the Y axis
#### tBodyAccJerk.std...Z
Time Domain: Jerk Acceleration standard deviation in the Z axis
#### tBodyGyro.mean...X
Time Domain: Body Gyroscope Angular Velocity mean in the X axis
#### tBodyGyro.mean...Y
Time Domain: Body Gyroscope Angular Velocity mean in the Y axis
#### tBodyGyro.mean...Z
Time Domain: Body Gyroscope Angular Velocity mean in the Z axis
#### tBodyGyro.std...X
Time Domain: Body Gyroscope Angular Velocity standard deviation in the X axis
#### tBodyGyro.std...Y
Time Domain: Body Gyroscope Angular Velocity standard deviation in the Y axis
#### tBodyGyro.std...Z
Time Domain: Body Gyroscope Angular Velocity standard deviation in the Z axis
#### tBodyGyroJerk.mean...X
Time Domain: Jerk Gyroscope Angular Velocity mean in the X axis
#### tBodyGyroJerk.mean...Y
Time Domain: Body Gyroscope Angular Velocity mean in the Y axis
#### tBodyGyroJerk.mean...Z
Time Domain: Body Gyroscope Angular Velocity mean in the Z axis
#### tBodyGyroJerk.std...X
Time Domain: Body Gyroscope Angular Velocity standard deviation in the X axis
#### tBodyGyroJerk.std...Y
Time Domain: Body Gyroscope Angular Velocity standard deviation in the Y axis
#### tBodyGyroJerk.std...Z
Time Domain: Body Gyroscope Angular Velocity standard deviation in the Z axis
#### tBodyAccMag.mean..
Time Domain: Body Acceleration Magnitude mean
#### tBodyAccMag.std..
Time Domain: Body Acceleration Magnitude standard deviation
#### tGravityAccMag.mean..
Time Domain: Gravity Acceleration Magnitude mean
#### tGravityAccMag.std..
Time Domain: Gravity Acceleration Magnitude standard deviation
#### tBodyAccJerkMag.mean..
Time Domain: Jerk Acceleration Magnitude mean
#### tBodyAccJerkMag.std..
Time Domain: Jerk Acceleration Magnitude standard deviation
#### tBodyGyroMag.mean..
Time Domain: Body Gyroscope Angular Velocity Magnitude mean
#### tBodyGyroMag.std..
Time Domain: Body Gyroscope Angular Velocity Magnitude standars deviation
#### tBodyGyroJerkMag.mean..
Time Domain: Jerk Gyroscope Angular Velocity Magnitude mean
#### tBodyGyroJerkMag.std..
Time Domain: Jerk Gyroscope Angular Velocity Magnitude standars deviation
#### fBodyAcc.mean...X
Frequency Domain: Body Acceleration mean in the X axis
#### fBodyAcc.mean...Y
Frequency Domain: Body Acceleration mean in the Y axis
Frequency Domain: Body Acceleration mean in the Y axis
#### fBodyAcc.mean...Z
Frequency Domain: Body Acceleration mean in the Z axis
#### fBodyAcc.std...X
Frequency Domain: Body Acceleration standard deviation in the X axis
Frequency Domain: Body Acceleration standard deviation in the X axis
#### fBodyAcc.std...Y
Frequency Domain: Body Acceleration standard deviation in the Y axis
#### fBodyAcc.std...Z
Frequency Domain: Body Acceleration standard deviation in the Z axis
#### fBodyAcc.meanFreq...X
Means of Frequency Domain: Body Acceleration mean Frequency in X axis
#### fBodyAcc.meanFreq...Y
Means of Frequency Domain: Body Acceleration mean Frequency in Y axis
#### fBodyAcc.meanFreq...Z
Means of Frequency Domain: Body Acceleration mean Frequency in Z axis
#### fBodyAccJerk.mean...X
Frequency Domain: Jerk Acceleration mean in the X axis
#### fBodyAccJerk.mean...Y
Frequency Domain: Jerk Acceleration mean in the Y axis
#### fBodyAccJerk.mean...Z
Frequency Domain: Jerk Acceleration mean in the Z axis
#### fBodyAccJerk.std...X
Frequency Domain: Jerk Acceleration standard deviation in the X axis
#### fBodyAccJerk.std...Y
Frequency Domain: Jerk Acceleration standard deviation in the Y axis
#### fBodyAccJerk.std...Z
Frequency Domain: Jerk Acceleration standard deviation in the Z axis
#### fBodyAccJerk.meanFreq...X
Frequency Domain: Body Acceleration Jeark mean Frequency in the X axis
#### fBodyAccJerk.meanFreq...Y
Frequency Domain: Body Acceleration Jeark mean Frequency in the Y axis
#### fBodyAccJerk.meanFreq...Z
Frequency Domain: Body Acceleration Jeark mean Frequency in the Z axis
#### fBodyGyro.mean...X
Frequency Domain: Body Gyroscope Angular Velocity mean in the X axis
#### fBodyGyro.mean...Y
Frequency Domain: Body Gyroscope Angular Velocity mean in the Y axis
#### fBodyGyro.mean...Z
Frequency Domain: Body Gyroscope Angular Velocity mean in the Z axis
#### fBodyGyro.std...X
Frequency Domain: Body Gyroscope Angular Velocity standard deviation in the X axis
#### fBodyGyro.std...Y
Frequency Domain: Body Gyroscope Angular Velocity standard deviation in the Y axis
#### fBodyGyro.std...Z
Frequency Domain: Body Gyroscope Angular Velocity standard deviation in the Z axis
#### fBodyGyro.meanFreq...X
Frequency Domain: Body Gyroscope Angular Velocity mean in the X axis
#### fBodyGyro.meanFreq...Y
Frequency Domain: Body Gyroscope Angular Velocity mean in the Y axis
#### fBodyGyro.meanFreq...Z
Frequency Domain: Body Gyroscope Angular Velocity mean in the Z axis
#### fBodyAccMag.mean..
Frequency Domain: Body Acceleration Magnitude mean
#### fBodyAccMag.std..
Frequency Domain: Body Acceleration Magnitude standard deviation
#### fBodyAccMag.meanFreq..
Frequency Domain: Body Acceleration Magnitude mean Frequency
#### fBodyBodyAccJerkMag.mean..          
Frequency Domain: Body Acceleration Jerk Magnitude mean 
#### fBodyBodyAccJerkMag.std..
Frequency Domain: Body Acceleration Linear Magnitude standard deviation 
#### fBodyBodyAccJerkMag.meanFreq..
Frequency Domain: Body Acceleration Jerk Magnitude mean Frequency 
#### fBodyBodyGyroMag.mean..
Frequency Domain: Body by Body Gyroscope Magnitude mean 
#### fBodyBodyGyroMag.std..
Frequency Domain: Body by Body Gyroscope Magnitude  standard deviation
#### fBodyBodyGyroMag.meanFreq..
Frequency Domain: Body by Body Gyroscope Magnitude mean Frequency 
#### fBodyBodyGyroJerkMag.mean..
Frequency Domain: Body Angular Jerk Magnitude mean Frequency 
#### fBodyBodyGyroJerkMag.std..
Frequency Domain: Body by Body Angular Magnitude  standard deviation
#### fBodyBodyGyroJerkMag.meanFreq..     
Frequency Domain: Body by Body Angular Jerk Magnitude mean Frequency