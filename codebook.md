

# VARIABLE NAMES


## Subject and Activity


* subject

    This variable takes integer values ranging from 1 to 30, corresponding to the 
id associated to the subject under study


* activity

    This variable describes the activity of the subject being monitored



## Variables corresponding to features



These variables come from differemt  measurements performed by an accelerometer 
and a gyroscope. Their values have been normalized and bounded to the interval 
[-1, 1]. Then the mean and the standard deviation have been computed
(this processing is previous to the action of the script *run_analysys.R* , 
alredy integrated in the raw data mentioned in the *README.txt* file).

The present script *run_analysys.R* have processed the raw names of these 
variables for better readibility. The names generated are the following:


* 1 time.body.accelerometer.mean.X
* 2 time.body.accelerometer.mean.Y
* 3 time.body.accelerometer.mean.Z
* 4 time.body.accelerometer.std.X
* 5 time.body.accelerometer.std.Y
* 6 time.body.accelerometer.std.Z
* 7 time.gravity.accelerometer.mean.X
* 8 time.gravity.accelerometer.mean.Y
* 9 time.gravity.accelerometer.mean.Z
* 10 time.gravity.accelerometer.std.X
* 11 time.gravity.accelerometer.std.Y
* 12 time.gravity.accelerometer.std.Z
* 13 time.body.accelerometer.jerk.mean.X
* 14 time.body.accelerometer.jerk.mean.Y
* 15 time.body.accelerometer.jerk.mean.Z
* 16 time.body.accelerometer.jerk.std.X
* 17 time.body.accelerometer.jerk.std.Y
* 18 time.body.accelerometer.jerk.std.Z
* 19 time.body.gyroscope.mean.X
* 20 time.body.gyroscope.mean.Y
* 21 time.body.gyroscope.mean.Z
* 22 time.body.gyroscope.std.X
* 23 time.body.gyroscope.std.Y
* 24 time.body.gyroscope.std.Z
* 25 time.body.gyroscope.jerk.mean.X
* 26 time.body.gyroscope.jerk.mean.Y
* 27 time.body.gyroscope.jerk.mean.Z
* 28 time.body.gyroscope.jerk.std.X
* 29 time.body.gyroscope.jerk.std.Y
* 30 time.body.gyroscope.jerk.std.Z
* 31 time.body.accelerometer.magnitude.mean
* 32 time.body.accelerometer.magnitude.std
* 33 time.gravity.accelerometer.magnitude.mean
* 34 time.gravity.accelerometer.magnitude.std
* 35 time.body.accelerometer.jerk.magnitude.mean
* 36 time.body.accelerometer.jerk.magnitude.std
* 37 time.body.gyroscope.magnitude.mean
* 38 time.body.gyroscope.magnitude.std
* 39 time.body.gyroscope.jerk.magnitude.mean
* 40 time.body.gyroscope.jerk.magnitude.std
* 41 frequency.body.accelerometer.mean.X
* 42 frequency.body.accelerometer.mean.Y
* 43 frequency.body.accelerometer.mean.Z
* 44 frequency.body.accelerometer.std.X
* 45 frequency.body.accelerometer.std.Y
* 46 frequency.body.accelerometer.std.Z
* 47 frequency.body.accelerometer.jerk.mean.X
* 48 frequency.body.accelerometer.jerk.mean.Y
* 49 frequency.body.accelerometer.jerk.mean.Z
* 50 frequency.body.accelerometer.jerk.std.X
* 51 frequency.body.accelerometer.jerk.std.Y
* 52 frequency.body.accelerometer.jerk.std.Z
* 53 frequency.body.gyroscope.mean.X
* 54 frequency.body.gyroscope.mean.Y
* 55 frequency.body.gyroscope.mean.Z
* 56 frequency.body.gyroscope.std.X
* 57 frequency.body.gyroscope.std.Y
* 58 frequency.body.gyroscope.std.Z
* 59 frequency.body.accelerometer.magnitude.mean
* 60 frequency.body.accelerometer.magnitude.std
* 61 frequency.body.accelerometer.jerk.magnitude.mean
* 62 frequency.body.accelerometer.jerk.magnitude.std
* 63 frequency.body.gyroscope.magnitude.mean
* 64 frequency.body.gyroscope.magnitude.std
* 65 frequency.body.gyroscope.jerk.magnitude.mean
* 66 frequency.body.gyroscope.jerk.magnitude.std

The variables with names starting by the string "time" correspond to time domain 
signals. The variables with names starting by the string "frequency" correspond to 
frequency domain signals.

Being unable to provide more in-depth details, other than those already contained 
in the raw files, I content myself with citing literally the file 
"features_info.txt":

"
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
"


# DESCRIPTION OF THE FILE *data_summary.txt* 

As explained in *README.txt*, the file *data_summary.txt* has been generated by 
the script *run_analysis.R* from the object *summary*. This script performs 
several transformations of the raw data. The values that we observe in 
*data_summary.txt* correspond to the means of the values of the feature variables 
mentioned above, for each possible combination subject-activity 
(see *README.txt* and *run_analysis.R* for more details).








