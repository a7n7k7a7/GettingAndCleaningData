## Codebook

### Dataset
Human Activity Recognition Using Smartphones Dataset Version 1.0as obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


### Experimental design
The dataset contains the experimental data for a group of 30 volunteers, 18-48 years old. They performed six activities (walking, waling_upstairs, walking_downstairs, sitting, standing and laying) with a smartphone (Samsumg Galaxy II) attached to their waist. The smartpone recorded 3-axial linear acceleration and 3-axial angular velocity at a constant rate 50Hz. The experiments were also video-recorded in order to enalble the data manually.


### Raw data
The raw data consist of two data sets _ training data (70% of volunteers) and test data(30% of volunteers).The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

For each record there were provided following data:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* Its activity label. 
* An identifier of the subject who carried out the experiment.

Features were normalized and bounded within [-1,1]

The raw dataset contains couple of different statistics calculated for signals, the tidy_data.txt dataset containst only .mean, which means the mean of singnals and .std, which means the standard deviation of signals. 


### Processed data
While preparing the tidy dataset there were taken the following steps:
* Two datasets (training and testing) were merged.
* The labels for the activity names were used in the dataset.
* For each subject and each activity, the average of every variable were count.
* Only the measurements on the mean and standard deviation were picked.
* The data were approprietaly labelled.

The tidy_data.txt dataset consists of following variables:
*activations
*subject
*tBodyAcc.mean.X, tBodyAcc.mean.Y, tBodyAcc.mean.Z
*tBodyAcc.std.X, tBodyAcc.std.Y, tBodyAcc.std.Z           
*tGravityAcc.mean.X, tGravityAcc.mean.Y, tGravityAcc.mean.Z
*tGravityAcc.std.X, tGravityAcc.std.Y, tGravityAcc.std.Z
*tBodyAccJerk.mean.X, tBodyAccJerk.mean.Y, tBodyAccJerk.mean.Z
*tBodyAccJerk.std.X, tBodyAccJerk.std.Y, tBodyAccJerk.std.Z       
*tBodyGyro.mean.X, tBodyGyro.mean.Y, tBodyGyro.mean.Z
*tBodyGyro.std.X, tBodyGyro.std.Y, tBodyGyro.std.Z
*tBodyGyroJerk.mean.X, tBodyGyroJerk.mean.Y, tBodyGyroJerk.mean.Z
*tBodyGyroJerk.std.X, tBodyGyroJerk.std.Y, tBodyGyroJerk.std.Z      
*tBodyAccMag.mean
*tBodyAccMag.std
*tGravityAccMag.mean
*tGravityAccMag.std       
*tBodyAccJerkMag.mean
*tBodyAccJerkMag.std
*tBodyGyroMag.mean
*tBodyGyroMag.std         
*tBodyGyroJerkMag.mean
*tBodyGyroJerkMag.std
*fBodyAcc.mean.X, fBodyAcc.mean.Y, fBodyAcc.mean.Z
*fBodyAcc.std.X, fBodyAcc.std.Y, fBodyAcc.std.Z
*fBodyAccJerk.mean.X, fBodyAccJerk.mean.Y, fBodyAccJerk.mean.Z
*fBodyAccJerk.std.X, fBodyAccJerk.std.Y, fBodyAccJerk.std.Z
*fBodyGyro.mean.X, fBodyGyro.mean.Y, fBodyGyro.mean.Z
*fBodyGyro.std.X, fBodyGyro.std.Y, fBodyGyro.std.Z
*fBodyAccMag.mean
*fBodyAccMag.std
*fBodyBodyAccJerkMag.mean
*fBodyBodyAccJerkMag.std  
*fBodyBodyGyroMag.mean
*fBodyBodyGyroMag.std
*fBodyBodyGyroJerkMag.mean
*fBodyBodyGyroJerkMag.std

Activation is a label of performaed activation (string: walking, walking_upstairs, walking_downstairs, sitting, standing or laying). 
Subject is a number of the volunteer who performed the action (integer in range 1-30).

The rest of variables represent the mean of the measures from the raw dataset. The final variables represent mean of means, or mean of standard deviations (type: real number in range[-1, 1])