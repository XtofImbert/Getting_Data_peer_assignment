# Getting_Data_peer_assignment
Quiz 4 - Getting and Cleansed data Peer Assignment

Following data have been pulled in the work directory of R Studio for the purpose of this assignment: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The run_analysis.R script is composed of functions that processes each step of the assignment. 

1. Function r_Data : 2 variables (suffix of filename, and folder name where the file is stored). As data are stored in different folders (TRAIN,TEST, INERTIAL DATA), the script reads X,Y,Z files in each folder and generates a data.frame in R. the GREP function is finally applied to match columns wits MeasureName for mean and STD deviation. 

2. Function read_test_data : Reads the test data in R. 

3. Function read_train_data : Reads the train data in R. 

4. Function mergeDataset : Combines Train and Test data in R. 

5. Function activityLabels: Reads activity labels in R.

6. Function merge_label_data : Runs function 5(activityLabels) and gets dataset with labelled activity.

7. Function tidyData: Generates a tidy data set with average values.

8. Function tidy_datafile: Generates the results in a TXT file.
