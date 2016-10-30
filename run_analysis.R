# Points 1 et 2
# POINT 1 Merge training and test sets in a unique data set 
# POINT 2 Extrats ONLY measurements on the mean and STD Deviation for each measurement

r_Data = function (fname, folder) {
  path = file.path(folder, paste0("y_", fname, ".txt"))
  y_data = read.table(path, header=FALSE, col.names = c("ActiviytID"))
  
  path = file.path(folder, paste0("subject_", fname, ".txt"))
  subject_data = read.table(path, header=FALSE, col.names=c("SubjectID"))
  
  data_columns = read.table("features.txt", header=FALSE, as.is=TRUE, col.names=c("MeasureID", "MeasureName"))
  
  path = file.path(folder, paste0("X_", fname, ".txt"))
  dataset = read.table(path, header=FALSE, col.names=data_columns$MeasureName)
  
  subset_data_columns = grep(".*mean\\(\\)|.*std\\(\\)", data_columns$MeasureName)
  
  dataset = dataset[, subset_data_columns]
  
  dataset$ActivityID = y_data$ActivityID
  dataset$SubjectID = subject_data$SubjectID
  
  dataset
}

# reads test data
read_test_data = function() {
  r_Data("test", "test")
}

# reads train data
read_train_data = function () {
  r_Data("train", "train")
}

# merge data
mergeDataset = function () {
  dataset = rbind(read_test_data(), read_train_data())
  cnames = colnames(dataset)
  cnames = gsub("\\.+mean\\.+", cnames, replacement = "Mean")
  cnames = gsub("\\.+std\\.+", cnames, replacement = "Std")
  colnames(dataset) = cnames
  dataset
}

# POINT 3 
# Uses descriptive activity names to name the activities in the data set 
# POINT 4 Appropriately labels the data set with descriptive variable names

activityLabels = function (dataset) {
  activity_labels = read.table("activity_labels.txt", header = FALSE, as.is=TRUE, col.names = c("ActivityID", "ActivityName"))
  activity_labels$ActivityName = as.factor(activity_labels$ActivityName)
  data_labels = merge(dataset, activity_labels)
  data_labels
}

merge_label_data = function () {
  activityLabels(mergeDataset())
}

# POINT 5
# creates a second, independent tidy data set with the average of each variable for each activity and each subject 
tidyData = function(merge_label_data) {
  library(reshape2)
  
  vars = c("ActivityID", "ActivityName", "SubjectID")
  measure_vars = setdiff(colnames(merge_label_data), vars)
  melted_data <- melt(merge_label_data, id=vars, measure.vars=measure_vars)
  
  dcast(melted_data, ActivityName + SubjectID ~ variable, mean)
}

tidy_datafile =function(fname){
  tidy_data = tidyData(merge_label_data())
  write.table(tidy_data, fname)
}

tidy_datafile("tidy.txt")

