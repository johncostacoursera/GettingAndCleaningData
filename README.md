#   Coursera Course - Getting and CLeaning Data - Course Assignment
#   By: John Costa
#   Date: July 23, 2020
Source data provided by Davide Anguita, Alessandro Ghio, Luca Oneto, 
Xavier Parra and Jorge L. Reyes-Ortiz [1]

## Study Design:

> The experiments have been carried out with a group of 30 volunteers within an 
 ago ago bracket of 19-48 years. Each person performed six activities (WALKING, 
 WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
 smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer 
 and gyroscope, we captured 3-axial linear acceleration and 3-axial angular 
 velocity at a constant rate of 50Hz. The experiments have been video-recorded  
 to label the data manually. The obtained dataset has been randomly partitioned
 into two sets, where 70% of the volunteers was selected for generating the 
 training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying 
 noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 
 50% overlap (128 readings/window). The sensor acceleration signal, which has 
 gravitational and body motion components, was separated using a Butterworth 
 low-pass filter into body acceleration and gravity. The gravitational force 
 is assumed to have only low frequency components, therefore a filter with 0.3 
 Hz cutoff frequency was used. From each window, a vector of features was 
 obtained by calculating variables from the time and frequency domain. See 
 'features_info.txt' for more details. 


    The output file (Ordered_MeanSubjectActivity.csv) consists of the following:
      - An identifier of the subject who participated in the experiment.
      - Its activity label. 
      - A 180 - feature vector with means and STD of measurements from the 
      gyroscope and accelerometer. 

    ****Notes:*** 
    - Each row represents the averaged measurement of each activity for each 
    subject over multiple observations.


## Measurement (column) description: 

>  The measuremnts are average of the mean and standard deviation from from 
   various meansurments of a 3 axis the accelerometer and gyroscope. These 
   time domain signals were captured at a constant rate of 50 Hz. and filtered 
   using a median filter and a 3rd order low pass Butterworth filter with a 
   corner frequency of 20 Hz to remove noise. Similarly, the acceleration 
   signal was then separated into body and gravity acceleration signals 
   (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth 
   filter with a corner frequency of 0.3 Hz. 

>  Subsequently, the body linear acceleration and angular velocity were derived
   in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
   Also the magnitude of these three-dimensional signals were calculated using 
   the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, 
   tBodyGyroMag, tBodyGyroJerkMag). 

>  Finally a Fast Fourier Transform (FFT) was applied to some of these signals 
   producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, 
   fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain 
   signals). 

    These signals were used to estimate variables of the feature vector for 
    each pattern:  

    '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

    These measurements were then averaged for each subject over a given activity.


    Units:
      Frequency is measured in Hz
      Accelerometer is measured in g (m/s^2)
      Gyroscope is measured in radians/second
      
    Each column was labeled accordingly:

    Subject [integer]:
      1-30

    Activity [character]:
      walking
      walking upstairs
      walking downstairs
      sitting
      standing
      laying
    
    Means and STD of each of the following measurements (68 total) [numeric]:
      MeanOfSubjectActivity-TimeBodyAccelerometer.mean.X
      MeanOfSubjectActivity-TimeBodyAccelerometer.mean.Y
      MeanOfSubjectActivity-TimeBodyAccelerometer.mean.Z
      MeanOfSubjectActivity-TimeBodyAccelerometer.std.X
      MeanOfSubjectActivity-TimeBodyAccelerometer.std.Y
      MeanOfSubjectActivity-TimeBodyAccelerometer.std.Z
      MeanOfSubjectActivity-TimeGravityAccelerometer.mean.X
      MeanOfSubjectActivity-TimeGravityAccelerometer.mean.Y
      MeanOfSubjectActivity-TimeGravityAccelerometer.mean.Z
      MeanOfSubjectActivity-TimeGravityAccelerometer.std.X
      MeanOfSubjectActivity-TimeGravityAccelerometer.std.Y
      MeanOfSubjectActivity-TimeGravityAccelerometer.std.Z
      MeanOfSubjectActivity-TimeBodyAccelerometerJerk.mean.X
      MeanOfSubjectActivity-TimeBodyAccelerometerJerk.mean.Y
      MeanOfSubjectActivity-TimeBodyAccelerometerJerk.mean.Z
      MeanOfSubjectActivity-TimeBodyAccelerometerJerk.std.X
      MeanOfSubjectActivity-TimeBodyAccelerometerJerk.std.Y
      MeanOfSubjectActivity-TimeBodyAccelerometerJerk.std.Z
      MeanOfSubjectActivity-TimeBodyGyroscope.mean.X
      MeanOfSubjectActivity-TimeBodyGyroscope.mean.Y
      MeanOfSubjectActivity-TimeBodyGyroscope.mean.Z
      MeanOfSubjectActivity-TimeBodyGyroscope.std.X
      MeanOfSubjectActivity-TimeBodyGyroscope.std.Y
      MeanOfSubjectActivity-TimeBodyGyroscope.std.Z
      MeanOfSubjectActivity-TimeBodyGyroscopeJerk.mean.X
      MeanOfSubjectActivity-TimeBodyGyroscopeJerk.mean.Y
      MeanOfSubjectActivity-TimeBodyGyroscopeJerk.mean.Z
      MeanOfSubjectActivity-TimeBodyGyroscopeJerk.std.X
      MeanOfSubjectActivity-TimeBodyGyroscopeJerk.std.Y
      MeanOfSubjectActivity-TimeBodyGyroscopeJerk.std.Z
      MeanOfSubjectActivity-TimeBodyAccelerometerMag.mean
      MeanOfSubjectActivity-TimeBodyAccelerometerMag.std
      MeanOfSubjectActivity-TimeGravityAccelerometerMag.mean
      MeanOfSubjectActivity-TimeGravityAccelerometerMag.std
      MeanOfSubjectActivity-TimeBodyAccelerometerJerkMag.mean
      MeanOfSubjectActivity-TimeBodyAccelerometerJerkMag.std
      MeanOfSubjectActivity-TimeBodyGyroscopeMag.mean
      MeanOfSubjectActivity-TimeBodyGyroscopeMag.std
      MeanOfSubjectActivity-TimeBodyGyroscopeJerkMag.mean
      MeanOfSubjectActivity-TimeBodyGyroscopeJerkMag.std
      MeanOfSubjectActivity-FrequencyBodyAccelerometer.mean.X
      MeanOfSubjectActivity-FrequencyBodyAccelerometer.mean.Y
      MeanOfSubjectActivity-FrequencyBodyAccelerometer.mean.Z
      MeanOfSubjectActivity-FrequencyBodyAccelerometer.std.X
      MeanOfSubjectActivity-FrequencyBodyAccelerometer.std.Y
      MeanOfSubjectActivity-FrequencyBodyAccelerometer.std.Z
      MeanOfSubjectActivity-FrequencyBodyAccelerometerJerk.mean.X
      MeanOfSubjectActivity-FrequencyBodyAccelerometerJerk.mean.Y
      MeanOfSubjectActivity-FrequencyBodyAccelerometerJerk.mean.Z
      MeanOfSubjectActivity-FrequencyBodyAccelerometerJerk.std.X
      MeanOfSubjectActivity-FrequencyBodyAccelerometerJerk.std.Y
      MeanOfSubjectActivity-FrequencyBodyAccelerometerJerk.std.Z
      MeanOfSubjectActivity-FrequencyBodyGyroscope.mean.X
      MeanOfSubjectActivity-FrequencyBodyGyroscope.mean.Y
      MeanOfSubjectActivity-FrequencyBodyGyroscope.mean.Z
      MeanOfSubjectActivity-FrequencyBodyGyroscope.std.X
      MeanOfSubjectActivity-FrequencyBodyGyroscope.std.Y
      MeanOfSubjectActivity-FrequencyBodyGyroscope.std.Z
      MeanOfSubjectActivity-FrequencyBodyAccelerometerMag.mean
      MeanOfSubjectActivity-FrequencyBodyAccelerometerMag.std
      MeanOfSubjectActivity-FrequencyBodyBodyAccelerometerJerkMag.mean
      MeanOfSubjectActivity-FrequencyBodyBodyAccelerometerJerkMag.std
      MeanOfSubjectActivity-FrequencyBodyBodyGyroscopeMag.mean
      MeanOfSubjectActivity-FrequencyBodyBodyGyroscopeMag.std
      MeanOfSubjectActivity-FrequencyBodyBodyGyroscopeJerkMag.mean
      MeanOfSubjectActivity-FrequencyBodyBodyGyroscopeJerkMag.std
  

### Units:

      Frequency is measured in Hz
      Accelerometer is measured in g (m/s^2)
      Gyroscope is measured in radians/second
      

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. 
Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass 
Hardware-Friendly Support Vector Machine. International Workshop of Ambient 
Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
