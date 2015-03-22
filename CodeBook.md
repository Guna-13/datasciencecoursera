### Study design

The data for the analysis comes from an experiment done by other authors: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Brief description of the experiment:
* The experiment was made with 30 volunteers -subjects-.
* Each person performed 6 activities wearing a smart-phone on the waist.
* From the in the smart-phone embedded accelerometer and gyroscope measurements were taken.
* The measurements were processed and the results stored. 

For more detailed information about the experiment and the original data refer to: 
* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
* UCI HAR Dataset/README.txt
* UCI HAR Dataset/features_info.txt

Only these files are used for the analysis:
* UCI HAR Dataset/features.txt
* UCI HAR Dataset/activity_labels.txt
* UCI HAR Dataset/train/y_train.txt
* UCI HAR Dataset/test/y_test.txt
* UCI HAR Dataset/train/subject_train.txt
* UCI HAR Dataset/test/subject_test.txt
* UCI HAR Dataset/train/X_train.txt
* UCI HAR Dataset/test/X_test.txt

### Summary

The values(processed measurements) were averaged by activity and subject.
The results were stored in a file in table format.

### Code book

Variables of the resulting file:

* subject_id
Variable 1
Identification of the volunteers
Values: 1 to 30

* activity_labels
Variable 2
Activity the volunteers carried out. 
Values: 
WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

* Averages:
Variables 3 to 68
Values are normalized and bounded within [-1,1]
The names are compound of several parts:
t: time domain signal
f: frequency domain signal
Body: body acceleration: body component of the sensor acceleration signal
Gravity: gravity: gravitational component of the sensor acceleration signal
Acc: signal coming from the accelerometer
Gyro: signal coming from the gyroscope
Jerk: Jerk signal 
Mag: magnitude of the 3 dimensional signal
mean: mean of the processed measurement
std: standard deviation of the processed measurement
X: axe X of the signal
Y: axe Y of the signal
Z: axe Z of the signal



	
