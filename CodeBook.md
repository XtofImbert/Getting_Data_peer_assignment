QUIZ 4 - Getting and Cleaning Data - peer assessment project

The zip file data have been transformed to apply the following changes _ Step by step: 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. rom the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

I focused mainly on accelerometer & gyroscope measurement data: tBodyAcc & tBodyGyro.

The result produces calculatd means and standard deviations of these sets of data for each of 3 dimensions (X,Y,Z): 

tBodyAcc-X
tBodyAcc-Y
tBodyAcc-Z
tBodyGyro-X
tBodyGyro-Y
tBodyGyro-Z

Each variable has a Mean and STD Deviation calculation. 
