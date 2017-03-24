# Codebook

Human activity recognition experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). These signals were used to estimate variables of the feature vector for each pattern: '_XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

1) tBodyAcc_XYZ 
2) tGravityAcc_XYZ
3) tBodyAccJerk_XYZ
4) tBodyGyro_XYZ
5) tBodyGyroJerk_XYZ
6) tBodyAccMag
8) tGravityAccMag
9) tBodyAccJerkMag
10) tBodyGyroMag
11) tBodyGyroJerkMag
12) fBodyAcc_XYZ
13) fBodyAccJerk_XYZ
14) fBodyGyro_XYZ
15) fBodyAccMag
16) fBodyAccJerkMag
17) fBodyGyroMag
18) fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

19) mean(): Mean value
20) std(): Standard deviation

Each feature is then averaged by subject and activity.

21) subject: Integer denoting a specific Subject
22) activity: Activites by subjects (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
