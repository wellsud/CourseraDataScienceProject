# Read Me

This document describes some important issues about the *run_analisys()* function.

## Requirements
 
 * The script uses dplyr 0.41 version package. It allows the execution of functions like select, group_by and summarise_each.
 * The script uses "UCI HAR Dataset" folder as Working directory.
 * The following files need to be present in their respective paths:
 
    * *./activity_labels.txt*
    * *./features.txt*
    * *./train/subject_train.txt"*
    * *./test/subject_test.txt*
    * *./train/y_train.txt*
    * *./test/y_test.txt*
    * *./train/x_train.txt*
    * *./test/x_test.txt*

## Script Execution

###Input

The function doesn't require any input

###Getting Data

The first lines verify the existence of all required txt files. If a file exists its content is automatically assigned for a variable with the same name via read.table() function. Otherwise, the script displays a message notifying the file missing.

Example:
    #Verifying the existence of files
  
    #activity_labels.txt
    if (file.exists("./activity_labels.txt")) 
    {
    activity_labels<-read.table(file = "./activity_labels.txt",colClasses = c("NULL",NA))
    } else  message("activity_labels.txt was not found")

### Joinning Data

After verifying all files, the script start to merge columns and lines of train and test datasets.

The first information to merge are the subjects.This information is present in subject_train and subject_test variables. It's a number from 1 to 30 that represents one of subjects in a specific observation. The value is assigned to **subject** variable:

        subject<-c(subject_train$V1, subject_test$V1)

The result is a vector of integers with **10299** positions that represents the column subject

The next information to merge is about the activities. This information is in *y_train* and *y_test* variables. A number from 1 to 6 representing the six basic activities:WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING. After merging information, we  convert them in factor names using the values of *activity_labels* variable:

    activity_data<- c(y_train$V1, y_test$V1)
    activity<-factor(activity_data)
    levels(activity)<-activity_labels$V2
The result is a factor vector with also **10299** position.

Next, we merge x_train and x_test data frames using rbind function. These variables contain all the measures. The result is assigned to a variable called *tests*.

    tests<-rbind(x_train, x_test)

The result is a data frame with **10299** observations and **561** columns

The following steps are the bind of all columns and dataframe conversion to tbl_df object to allow the use of dplyr tools:
    
    full_df<-cbind(subject, activity, tests)

    full_df<-tbl_df(select(full_dataset, subject, activity, matches(".mean().|.std().",ignore.case = FALSE), -starts_with("angle", ignore.case = T)))
    
###Extracting mean and standard Deviation columns

This step was made when we've created tbl_df using the select() function. Inside that the matches() function filter the columns with a regular expression:

    matches(".mean().|.std().",ignore.case = FALSE) 
        
The script also ingnores the last columns started with angle term:

    -starts_with("angle", ignore.case = T)
        
The final result is a data frame with **10299** observations and **81** columns

### Tidying Data

The last step is to generate the tidy dataset only with the means of all measures. This is made using *group_by()* and *summarise_each()* functions. The data are grouped first by activity followed by subject.

    tydi_df<-full_df %>% group_by(activity, subject) %>% summarise_each(funs(mean))

Now, tidy_df contains 180 (6 activities for 30 subjects) observations and 81 columns.

The final step is the creation of file with dataset. The code verifies if a file was created before:

    if (file.exists("./tidyData.txt")) 
    {
    file.remove("./tidyData.txt")
    write.table(tydi_df, file = "tidyData.txt")
    }else write.table(tydi_df, file = "tidyData.txt")

### Output
 
 A txt file called tidyData.txt
 
### Reading Output

The output can be read in R again using the following commands:

    df<- read.table(file = "./tidyData.txt", header = T)
    View(df)

