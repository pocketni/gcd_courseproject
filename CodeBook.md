*CodeBook for the cleaned UCI HAR Dataset*
----

Introduction
----

The dataset for this CodeBook contains the average of the mean and standard deviation measurements 
of movements captured by volunteers wearing Samsung Galaxy II smartphones.

This information is largely derived from the features_info.txt and activity_labels.txt 
provided by the original study team at the Non Linear Complex Systems Laboratory at
Università degli Studi di Genova. Please consult their README for more information about the 
original data collection effort.

Relevant Excerpts:
----

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.

>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally, a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). Please see "Frequency Domain Signals" section for more details.

Cleaning Procedure:
----

1. Combining test and training data into a complete set, including the addition of appending 
Subject No. and Activity to said set.
2. Extracting the means and std for each measurement (NB: I included meanFreq measurements 
but not angle calculations).
3. Substituted number in "Activity" with its equivalent word label.
4. Provided expanded (and more informative) measurement names.
5. Created a second data set ("measurement_averages_by_subject_and_activity.txt") that 
contains the mean of every variable by subject and activity. A mouthful, but self-explanatory. 
Code for reading said file back into R is provided at the bottom.

Please see run_analysis.R in this directory for all pertinent code relating to the above.



ID VARIABLES
-----

subject.no: Subject Number<br>
* Subject numbers range from 1-30<br>
* We do not know anything about them except that they were between 19-48 years old

activity: Activity Performed<br>
These labels indicate which activities the volunteers were performing at the time of measurements.<br>
These are labeled with words with no particular order implied. Meaning should be fairly self evident.<br>
Data in this variable consist of word labels:<br>
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING (actually "lying down")<br><br>
They can be easily converted to factors according to the wish of the researcher.
		

NB: Data for all remaining variables are normalized and bounded between [-1, 1]<br>
NB2: All data are *averages* of data from original data set for each subject<br>

TIME DOMAIN SIGNALS
----

* Variables with the prefix "time." are signals captured in time.<br>
* Jerk signals represent the body linear acceleration (accelerometer) OR angular velocity (gyrometer) with respect to time. In other words, the rate of change of acceleration<br><br>
	
time.body.accelerometer.mean.X<br>
	average of the mean linear acceleration of the body on the X axis
	
time.body.accelerometer.mean.Y<br>
	average of the mean linear acceleration of the body on the Y axis
	
time.body.accelerometer.mean.Z<br>
	average of the mean linear acceleration of the body on the Z axis
	
time.body.accelerometer.stddev.X<br>
	average of the standard deviation of the linear acceleration of the body on the X axis
	
time.body.accelerometer.stddev.Y<br>
	average of the standard deviation of the linear acceleration of the body on the y axis
	
time.body.accelerometer.stddev.Z<br>
	average of the standard deviation of the linear acceleration of the body on the Z axis
	
time.gravity.accelerometer.mean.X<br>
	average of the mean linear acceleration of gravity on the X axis
	
time.gravity.accelerometer.mean.Y<br>
	average of the mean linear acceleration of gravity on the Y axis
	
time.gravity.accelerometer.mean.Z<br>
	average of the mean linear acceleration of gravity on the Z axis
	
time.gravity.accelerometer.stddev.X<br>
	average of the standard deviation of the linear acceleration of gravity on the X axis
	
time.gravity.accelerometer.stddev.Y<br>
	average of the standard deviation of the linear acceleration of gravity on the Y axis
	
time.gravity.accelerometer.stddev.Z<br>
	average of the standard deviation of the linear acceleration of gravity on the Z axis
	
time.body.accelerometer.jerk.mean.X<br>
	average of the mean change in acceleration (thereafter: linear jerk) of the body on the X axis
	
time.body.accelerometer.jerk.mean.Y<br>
	average of the mean linear jerk of the body on the Y axis
	
time.body.accelerometer.jerk.mean.Z<br>
	average of the mean linear jerk of the body on the Z axis
	
time.body.accelerometer.jerk.stddev.X<br>
	average of the standard deviation of linear jerk of the body on the X axis
	
time.body.accelerometer.jerk.stddev.Y<br>
	average of the standard deviation of linear jerk of the body on the Y axis
	
time.body.accelerometer.jerk.stddev.Z<br>
	average of the standard deviation of linear jerk of the body on the Y axis
	
time.body.gyrometer.mean.X<br>
	average of the mean angular velocity of the body on the X axis
	
time.body.gyrometer.mean.Y<br>
	average of the mean angular velocity of the body on the Y axis
	
time.body.gyrometer.mean.Z<br>
	average of the mean angular velocity of the body on the Z axis
	
time.body.gyrometer.stddev.X<br>
	average of the standard deviation of the angular velocity of the body on the X axis
	
time.body.gyrometer.stddev.Y<br>
	average of the standard deviation of the angular velocity of the body on the Y axis
	
time.body.gyrometer.stddev.Z<br>
	average of the standard deviation of the angular velocity of the body on the Z axis
	
time.body.gyrometer.jerk.mean.X<br>
	average of the mean rate of change in angular acceleration (thereafter, angular jerk) of the body on the X axis
	
time.body.gyrometer.jerk.mean.Y<br>
	average of the mean angular jerk of the body on the Y axis
	
time.body.gyrometer.jerk.mean.Z<br>
	average of the mean angular jerk of the body on the Z axis
	
time.body.gyrometer.jerk.stddev.X<br>
	average of the standard deviation of angular  jerk of the body on the X axis
	
time.body.gyrometer.jerk.stddev.Y<br>
	average of the standard deviation of angular jerk of the body on the Y axis
	
time.body.gyrometer.jerk.stddev.Z<br>
	average of the standard deviation of angular jerk of the body on the Z axis
	
time.body.accelerometermagnitude.mean<br>
	average of the mean magnitude of acceleration of the body
	
time.body.accelerometermagnitude.stddev<br>
	average of the standard deviation on the mean magnitude of acceleration of the body
	
time.gravity.accelerometermagnitude.mean<br>
	average of the mean total magnitude of acceleration by gravity
	
time.gravity.accelerometermagnitude.stddev<br>
	average of the standard deviation of the magnitude of acceleration by gravity
	
time.body.accelerometer.jerkmagnitude.mean<br>
	average of the mean magnitude of linear jerk of the body
	
time.body.accelerometer.jerkmagnitude.stddev<br>
	average of the standard deviation of the magnitude of linear jerk of the body
	
time.body.gyrometermagnitude.mean<br>
	average of the magnitude of mean angular velocity of the body
	
time.body.gyrometermagnitude.stddev<br>
	average of the standard deviation of the magnitude of angular velocity of the body
	
time.body.gyrometer.jerkmagnitude.mean<br>
	average of the mean angular jerk magnitude of the body
	
time.body.gyrometer.jerkmagnitude.stddev<br>
	average of the standard deviation of the angular jerk magnitude of the body


FREQUENCY DOMAIN SIGNALS
-------

* Variables with the prefix frequency are time variables (see above) to which Fast Fourier Transform (FFT) have been applied.<br><br>

frequency.body.accelerometer.mean.X<br>
	average of the transformed mean linear acceleration of the body on the X axis
	
frequency.body.accelerometer.mean.Y<br>
	average of the transformed mean linear acceleration of the body on the Y axis
	
frequency.body.accelerometer.mean.Z<br>
	average of the transformed mean linear acceleration of the body on the Z axis
	
frequency.body.accelerometer.stddev.X<br>
	average of the transformed standard deviation of linear acceleration of the body on the X axis
	
frequency.body.accelerometer.stddev.Y<br>
	average of the transformed standard deviation of linear acceleration of the body on the Y axis
	
frequency.body.accelerometer.stddev.Z<br>
	average of the transformed standard deviation of linear acceleration of the body on the Z axis
	
frequency.body.accelerometer.meanfreq.X<br>
	average of the transformed mean frequency of the linear acceleration of the body on the X axis
	
frequency.body.accelerometer.meanfreq.Y<br>
	average of the transformed mean frequency of the linear acceleration of the body on the Y axis

frequency.body.accelerometer.meanfreq.Z<br>
	average of the transformed mean frequency of the linear acceleration of the body on the Z axis

frequency.body.accelerometer.jerk.mean.X<br>
	average of the transformed linear jerk mean of the body on the X axis
	
frequency.body.accelerometer.jerk.mean.Y<br>
	average of the transformed linear jerk mean of the body on the Y axis
	
frequency.body.accelerometer.jerk.mean.Z<br>
	average of the transformed linear jerk mean of the body on the Z axis
	
frequency.body.accelerometer.jerk.stddev.X<br>
	average of the transformed standard deviation of linear jerk of the body on the X axis
	
frequency.body.accelerometer.jerk.stddev.Y<br>
	average of the transformed standard deviation of linear jerk of the body on the Y axis

frequency.body.accelerometer.jerk.stddev.Z<br>
	average of the transformed standard deviation of linear jerk of the body on the Z axis

frequency.body.accelerometer.jerk.meanfreq.X<br>
	average of the transformed mean frequency of linear jerk of the body on the X axis

frequency.body.accelerometer.jerk.meanfreq.Y<br>
	average of the transformed mean frequency of linear jerk of the body on the Y axis
	
frequency.body.accelerometer.jerk.meanfreq.Z<br>
	average of the transformed mean frequency of linear jerk of the body on the Z axis
	
frequency.body.gyrometer.mean.X<br>
	average of the transformed mean angular acceleration of the body on the X axis

frequency.body.gyrometer.mean.Y<br>
	average of the transformed mean angular acceleration of the body on the Y axis
	
frequency.body.gyrometer.mean.Z<br>
	average of the transformed mean angular acceleration of the body on the Z axis
	
frequency.body.gyrometer.stddev.X<br>
	average of the transformed standard deviation of angular acceleration of the body on the X axis
	
frequency.body.gyrometer.stddev.Y<br>
	average of the transformed standard deviation of angular acceleration of the body on the Y axis
	
frequency.body.gyrometer.stddev.Z<br>
	average of the transformed standard deviation of angular acceleration of the body on the Z axis
	
frequency.body.gyrometer.meanfreq.X<br>
	average of the transformed mean frequency of angular acceleration of the body on the X axis
	
frequency.body.gyrometer.meanfreq.Y<br>
	average of the transformed mean frequency of angular acceleration of the body on the Y axis
	
frequency.body.gyrometer.meanfreq.Z<br>
	average of the transformed mean frequency of angular acceleration of the body on the Y axis
	
frequency.body.accelerometermagnitude.mean<br>
	average of the transformed magnitude of linear acceleration of the body
	
frequency.body.accelerometermagnitude.stddev<br>
	average of the transformed standard deviation of linear acceleration of the body
	
frequency.body.accelerometermagnitude.meanfreq<br>
	average of the transformed mean frequency of linear acceleration magnitude of the body
	
frequency.body.accelerometer.jerkmagnitude.mean<br>
	average of the transformed mean magnitude of linear jerk of the body
	
frequency.body.accelerometer.jerkmagnitude.stddev<br>
	average of the transformed standard deviation of linear jerk magnitude of the body
	
frequency.body.accelerometer.jerkmagnitude.meanfreq<br>
	average of the transformed mean frequency of linear jerk magnitude of the body
	
frequency.body.gyrometermagnitude.mean<br>
	average of the transformed mean magnitude of angular acceleration of the body
	
frequency.body.gyrometermagnitude.stddev<br>
	average of the transformed standard deviation of angular acceleration of the body
	
frequency.body.gyrometermagnitude.meanfreq<br>
	average of the transformed mean frequency of angular acceleration magnitude of the body
	
frequency.body.gyrometer.jerkmagnitude.mean<br>
	average of the transformed mean angular jerk magnitude of the body
	
frequency.body.gyrometer.jerkmagnitude.stddev<br>
	average of the transformed standard deviation of angular jerk magnitude of the body
	
frequency.body.gyrometer.jerkmagnitude.meanfreq<br>
	average of the transformed mean frequency of angular jerk magnitude of the body
