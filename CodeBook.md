## CODEBOOK

Human Activity Recognition Using Smartphones Dataset 
Version 1.0 
========================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory 
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws 
www.smartlab.ws 
======================================================================== 

The experiments have been carried out with a group of 30 volunteers 
within an age bracket of 19-48 years. Each person performed six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded 
accelerometer and gyroscope, we captured 3-axial linear acceleration and 
3-axial angular velocity at a constant rate of 50Hz. The experiments have 
been video-recorded to label the data manually. The obtained dataset has 
been aggregated into a dataset with means of data only.

## FEATURES

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ : Body acceleration signal
* tGravityAcc-XYZ : Gravity acceleration signal
* tBodyAccJerk-XYZ : Body linear acceleration Jerk signals
* tBodyGyro-XYZ : Angular velocity
* tBodyGyroJerk-XYZ : Angular velocity Jerk signals
* tBodyAccMag : Magnitude of body acceleration, calculated using the Euclidean norm
* tGravityAccMag : Magnitude of gravity acceleration, calculated using the Euclidean norm
* tBodyAccJerkMag : Magnitude of body linear acceleration Jerk signals, calculated using the Euclidean norm
* tBodyGyroMag : Magnitude of angular velocity, calculated using the Euclidean norm
* tBodyGyroJerkMag : Magnitude of angular velocity Jerk signals, calculated using the Euclidean norm
* fBodyAcc-XYZ : Fast Fourier Transform applied to tBodyAcc-XYZ
* fBodyAccJerk-XYZ : Fast Fourier Transform applied to tBodyAccJerk-XYZ
* fBodyGyro-XYZ : Fast Fourier Transform applied to tBodyGyro-XYZ
* fBodyAccMag : Fast Fourier Transform applied to tBodyAccMag
* fBodyAccJerkMag : Fast Fourier Transform applied to tBodyAccJerkMag
* fBodyGyroMag : Fast Fourier Transform applied to tBodyGyroMag
* fBodyGyroJerkMag : Fast Fourier Transform applied to tBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation

## TRANSFORMATIONS

Source code is documented, but these are the main blocks of the process

* Load Features 
  * From features.txt file
  * Filter Features to get only std and mean variables using grepl looking for "std()" or "mean()" text
* Load Activity Names
  * From activity_labels.txt file
* Load Subject Data 
  * Merge train (subject_train.txt) and test (subject_test.txt) data, with rbind
  * Rename column V1 to SUBJECT
* Load Activity Data 
  * Merge train (y_train.txt) and test (y_test.txt) data, with rbind
  * Join with Activity Names, using V1 as common field
  * Rename column V2 to ACTIVITY
* Load Main Data 
  * Merge train (X_train.txt) and test (X_test.txt) data, with rbind
  * Filter data to get only std and mean variables
  * Rename columns with descriptions
* Join all the data by common field (ID)
* Generate average table
  * Calculate mean for each clomun with colMean function (rows from 1 to 66)
  * Repeat this for every case of "ACTIVITY" and "SUBJECT" using ddply function
  * Write the data to file using write.table