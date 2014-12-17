CodeBook
=======


###Subject:
str: integer
The ID of subject
from 1 to 30

###Activity:
str: character
The action a subject perform
There are 6 activities: LAYING, SITTING, STANDING, WALKING, WALK_DOWNSTAIRS, WALKING_UPSTAIRS.


###Measurement Variables:
str: numeric
The letter “t” or “f” in front of the variable means:
t: the body linear acceleration and angular velocity were derived in time to obtain Jerk signals
f: a Fast Fourier Transform (FFT) was applied to some of these signals

-mean-:the mean value
-std-: Standard deviation
These values are “average” values, please read the cleaning procedure for further detail.

* fBodyAccJerk-mean-X
*fBodyAccJerk-mean-Y
*fBodyAccJerk-mean-Z
*fBodyAccJerk-std-X
*fBodyAccJerk-std-Y
*fBodyAccJerk-std-Z
*fBodyAccMag-mean
*fBodyAccMag-std
*fBodyAcc-mean-X
*fBodyAcc-mean-Y
*fBodyAcc-mean-Z
*fBodyAcc-std-X
*fBodyAcc-std-Y
*fBodyAcc-std-Z
*fBodyBodyAccJerkMag-mean
*fBodyBodyAccJerkMag-std
*fBodyBodyGyroJerkMag-mean
*fBodyBodyGyroJerkMag-std
*fBodyBodyGyroMag-mean
*fBodyBodyGyroMag-std
*fBodyGyro-mean-X
*fBodyGyro-mean-Y
*fBodyGyro-mean-Z
*fBodyGyro-std-X
*fBodyGyro-std-Y
*fBodyGyro-std-Z
*tBodyAccJerkMag-mean
*tBodyAccJerkMag-std
*tBodyAccJerk-mean-X
*tBodyAccJerk-mean-Y
*tBodyAccJerk-mean-Z
*tBodyAccJerk-std-X
*tBodyAccJerk-std-Y
*tBodyAccJerk-std-Z
*tBodyAccMag-mean
*tBodyAccMag-std
*tBodyAcc-mean-X
*tBodyAcc-mean-Y
*tBodyAcc-mean-Z
*tBodyAcc-std-X
*tBodyAcc-std-Y
*tBodyAcc-std-Z
*tBodyGyroJerkMag-mean
*tBodyGyroJerkMag-std
*tBodyGyroJerk-mean-X
*tBodyGyroJerk-mean-Y
*tBodyGyroJerk-mean-Z
*tBodyGyroJerk-std-X
*tBodyGyroJerk-std-Y
*tBodyGyroJerk-std-Z
*tBodyGyroMag-mean
*tBodyGyroMag-std
*tBodyGyro-mean-X
*tBodyGyro-mean-Y
*tBodyGyro-mean-Z
*tBodyGyro-std-X
*tBodyGyro-std-Y
*tBodyGyro-std-Z
*tGravityAccMag-mean
*tGravityAccMag-std
*tGravityAcc-mean-X
*tGravityAcc-mean-Y
*tGravityAcc-mean-Z
*tGravityAcc-std-X
*tGravityAcc-std-Y
*tGravityAcc-std-Z



###Cleaning procedures:
1. Put subject ID, activities and measurement value in the same data frame.
2. Merges the training and the test sets to create one data set. 
3. Extracts only the measurements on the mean(-mean) and standard(-std) deviation for each measurement. 
4. Create a data set with the average of each variable for each activity and each subject. 
