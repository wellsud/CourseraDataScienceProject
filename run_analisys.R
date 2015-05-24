#run_analisys<-function(){
  
  require("dplyr")
  
  #Verifying the existence of files
  
  #activity_labels.txt
  if (file.exists("./activity_labels.txt")) 
  {
    activity_labels<-read.table(file = "./activity_labels.txt",colClasses = c("NULL",NA))
  } else  message("activity_labels.txt was not found")
  
  #features.txt
  
  
  if (file.exists("./features.txt")) 
  {
    features<-read.table(file = "./features.txt", colClasses = c("NULL", NA))
  } else  message("features.txt was not found")  
   
  
  #subject_train.txt
  
  if (file.exists("./train/subject_train.txt")) 
  {
    subject_train<-read.table(file = "./train/subject_train.txt")
  } else  message("subject_train.txt was not found")
  
  #subject_test.txt
    
  if (file.exists("./test/subject_test.txt")) 
  {
    subject_test<-read.table(file = "./test/subject_test.txt")
  } else  message("subject_test.txt was not found")
  
  
  #y_train.txt
  
  if (file.exists("./train/y_train.txt")) 
  {
    y_train<-read.table(file = "./train/y_train.txt",)
  } else  message("y_train.txt was not found")
  
  
  #y_test.txt
  
  if (file.exists("./test/y_test.txt")) 
  {
    y_test<-read.table(file = "./test/y_test.txt")
  } else  message("y_test.txt was not found")
  
  
  #x_train.txt
  
  if (file.exists("./train/x_train.txt")) 
  {
    x_train<-read.table(file = "./train/x_train.txt", col.names = features$V2 )
  } else  message("x_train.txt was not found")
  
  
  #x_test.txt
  
  if (file.exists("./test/x_test.txt")) 
  {
    x_test<-read.table(file = "./test/x_test.txt", col.names = features$V2 )
  } else  message("x_test.txt was not found")
  
  
  #Merging subjects
  
  subject<-c(subject_train$V1, subject_test$V1)
  
  #Merging activitys and assignments the activity label as factor
  
  activity_data<- c(y_train$V1, y_test$V1)
  activity<-factor(activity_data)
  levels(activity)<-activity_labels$V2
  
  
  #Merging Train set and test sets with x_train and x_text
  
  tests<-rbind(x_train, x_test)
  
  #Merging tests with subject and activity column
  
  full_df<-cbind(subject, activity, tests)
  
  #Extracting just the subject and activity columns and columns that name contain mean and std
  #tidy_df is created with tbl_dffor using of dplyr tools
  
  full_df<-tbl_df(select(full_df, subject, activity, matches(".mean().|.std().",ignore.case = FALSE), -starts_with("angle", ignore.case = T)))
  
  
  #Creating the independent tidy dataset with means for all measurements grouped by subject and activity
  tydi_df<-full_df %>% group_by(activity, subject) %>% summarise_each(funs(mean))
  
  #Returning result
  if (file.exists("./tidyData.txt")) 
  {
    file.remove("./tidyData.txt")
    write.table(tydi_df, file = "tidyData.txt")
  }else write.table(tydi_df, file = "tidyData.txt")
  
  
#}

