  ##############################################################################
  ##
  ##
  # Getting and Cleaning Data Course Project
  #
  # There are two sets of data - Train and Test - that capture the same variables
  # Each set has different number of observations based on the same set of 
  # volunteer subjects. The Train and Test data sets were created from the  
  # same core data.
  #
  ##
  ##
  ##############################################################################
  
  # clear environment
  rm(list=ls())
  
  
  # ***************************************************************************
  # ***************************STEP 1******************************************
  # ***************************************************************************
  
  ##
  #  Read data
  ##
  
  # Set path to data
  
  PathRead = "D:/R Course/Getting and Cleaning Data/Course Project/Data/UCI HAR Dataset"
  PathWrite = "D:/R Course/Getting and Cleaning Data/Course Project/"
  
  ##
  # Load factor labels and field names  (Tidy Data principles)
  ##
  
  Features <- read.table(paste0(PathRead,"/features.txt"), colClasses = "factor") # load the col headings
  ActvityLabels <- read.table(paste0(PathRead,"/activity_labels.txt"), colClasses = "factor") # load the activity labels
  
  # Clean Feature labels for each variables - change to lower case and remove underscores from labels (Tidy Data principles)
  #   o remove brackets "()"
  #   o expand t -> time abbreviations
  #   o expand f -> frequency abbreviations
  #   o expand acc -> accelerometer abbreviations
  #   o expand Gyro -> Gyroscope abbreviations
  #
  levels(Features[,2]) <- gsub("\\(\\)","",levels(Features[,2]))
  levels(Features[,2]) <- gsub("^t","Time",levels(Features[,2]))
  levels(Features[,2]) <- gsub("^f","Frequency",levels(Features[,2]))
  levels(Features[,2]) <- gsub("Acc","Accelerometer",levels(Features[,2]))
  levels(Features[,2]) <- gsub("Gyro","Gyroscope",levels(Features[,2]))
  levels(Features[,2]) <- gsub("arCoef","AutorregresionCoefficients",levels(Features[,2]))
  
  # Clean Activity labels (Tidy Data principles)
  #   o change to lower case 
  #   o remove underscores
  levels(ActvityLabels[,2]) <- tolower(levels(ActvityLabels[,2]))
  levels(ActvityLabels[,2]) <- gsub("_"," ",levels(ActvityLabels[,2])) # Remove "_" or any other character
  
  
# *****************************************************************************
# **************************** STEP 2 *****************************************
# *****************************************************************************
  
  
  
  ##
  # Load TRAIN data and name columns according to Tidy Data principles
  ##
  
  Train_Subject <- read.table(paste0(PathRead,"/train/subject_train.txt"), colClasses = "factor", col.names = "Subject")
  Train_X <- read.table(paste0(PathRead,"/train/X_train.txt"), colClasses = "numeric", col.names = Features[,2])
  Train_Y <- read.table(paste0(PathRead,"/train/Y_train.txt"), colClasses = "factor", col.names = "Activity")
  
  
  
  ##
  # Load TEST data and name columns according to Tidy Data principles
  ##
  
  Test_Subject <- read.table(paste0(PathRead,"/test/subject_test.txt"), colClasses = "factor", col.names = "Subject")
  Test_X <- read.table(paste0(PathRead,"/test/X_test.txt"), colClasses = "numeric", col.names = Features[,2])
  Test_Y <- read.table(paste0(PathRead,"/test/Y_test.txt"), colClasses = "factor", col.names = "Activity")
  
  
  
  ##
  # Change out factor levels with actual values (Tidy Data principles)
  ##
  
  levels(Train_Y$Activity) <- ActvityLabels[,2] 
  levels(Test_Y$Activity) <- ActvityLabels[,2]
  
  # Display Train/test data
  #View(Train_Subject); View(Train_X);View(Train_Y);View(Test_Subject); View(Test_X);View(Test_Y)

  
  
  ##
  # Merge data sets
  ##
  
  # Make sure table sizes match
  
  if(!(length(Test_Subject[,1]) == length(Test_X[,1]) & (length(Test_X[,1]) == length(Test_Y[,1])))) { stop("*** Mismatched table size in TRAIN data ***") }
  if(!(length(Train_Subject[,1]) == length(Train_X[,1]) & (length(Train_X[,1]) == length(Train_Y[,1])))) { stop("*** Mismatched table size in TRAIN data ***") }
  
  Merge_train <- cbind(Train_Subject, Train_Y, Train_X)
  Merge_test <- cbind(Test_Subject, Test_Y, Test_X)
  Merged_df <- rbind(Merge_train, Merge_test)
  
  # Display merged data
  #View(merge_train); View(merge_test); View(merged_df)
  
# *****************************************************************************
# *************************** STEP 3 ******************************************
# *****************************************************************************
  
  
  ##
  #
  # Extract data
  #
  # All measurements that are "mean" and "std"
  #
  ##
  
  # Extract data from merged data set whose measurements have mean and std
  # create a DF that includes the first two cols and append those cols that grep for mean and std
  # Note - the mean and std have the following occurrences: ".mean." and ".mean"
  Extracted_df <- Merged_df[,append( names(Merged_df)[1:2], grep("(\\.mean(\\.|$))|(\\.std(\\.|$))",names(Merged_df), value = TRUE, ignore.case=TRUE))]
  
  # Display extracted_df
  #View(extracted_df)
 
  
   
  ##
  # Mean of each subject and activity of all observations for each measurement
  ##
  MeanSubjectActivity_df <- aggregate(Extracted_df, list(Extracted_df$Subject, Extracted_df$Activity), mean)
  # Creates two new cols and empties out the $Subject and $Activity cols
  
  # Tidy up the col labels
  drop <- c("Subject", "Activity") # remove old (empty) cols
  MeanSubjectActivity_df <- MeanSubjectActivity_df[,!(names(MeanSubjectActivity_df) %in% drop)]
  names(MeanSubjectActivity_df) <- sub("(^T|^F)","MeanOfSubjectActivity-\\1", names(MeanSubjectActivity_df))
  names(MeanSubjectActivity_df) <- sub("Group.1","Subject", names(MeanSubjectActivity_df))
  names(MeanSubjectActivity_df) <- sub("Group.2","Activity", names(MeanSubjectActivity_df))
  
  #View(MeanSubjectActivity_df)
  
  # Order data according to subject 
  Ordered_MeanSubjectActivity_df <- arrange(MeanSubjectActivity_df, as.integer(as.character(MeanSubjectActivity_df$Subject)))
  
  
# *****************************************************************************
# *************************** STEP 4 ******************************************
# *****************************************************************************
  
  View(Ordered_MeanSubjectActivity_df)
  
  write.table(Ordered_MeanSubjectActivity_df, paste0(PathWrite,"OrderedMeanSubjectActivity.csv"), sep = ",")
  