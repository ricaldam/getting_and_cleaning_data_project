# package dplyr must be already installed 
library(dplyr)


# 1. Merges the training and the test sets to create one data set.
# Raw data must be in the working directory 

train.subject <- read.table("./raw_data/train/subject_train.txt")
test.subject <- read.table("./raw_data/test/subject_test.txt")
merged.subject<- rbind(train.subject, test.subject)


train.label <- read.table("./raw_data/train/y_train.txt")
test.label <- read.table("./raw_data/test/y_test.txt")
merged.label <- rbind(train.label, test.label)


train.set <- read.table("./raw_data/train/X_train.txt")
test.set <- read.table("./raw_data/test/X_test.txt")
merged.set <- rbind(train.set, test.set)



# 2. Extracts only the measurements on the mean and standard deviation for each 
# measurement. 

features <- read.table("./raw_data/features.txt")
indexes.mean.std <- grep("mean\\(\\)|std\\(\\)", features[,2])
merged.set <- select(merged.set, indexes.mean.std)


# 3. Uses descriptive activity names to name the activities in the data set

activity.names <-read.table(("./raw_data/activity_labels.txt"))
# function for capitalizing first letter in each word (serated by "_")
capitalize <- function(x){
  y <- tolower(x)
  s <- strsplit(y, "_")[[1]]
  paste(toupper(substring(s,1,1)), substring(s,2), sep ="", collapse = " ")  
}
activity.names[,2] <- as.character(lapply(activity.names[,2], capitalize))
merged.activity <- data.frame(activity.names[merged.label[, 1], 2])


# 4. Appropriately labels the data set with descriptive variable names.

names(merged.subject) <- "subject"
names(merged.activity) <- "activity"
raw.feature.names <- features[indexes.mean.std, 2]
# function for cleaning variable names corresponding to features
renameFeatures <- function(x){
  x <- gsub("mean\\(\\)", "mean", x)
  x <- gsub("std\\(\\)", "std", x)
  x <- gsub("-", ".", x)
  x <- gsub("^t", "time", x)
  x <- gsub("^f", "frequency", x)
  x <- gsub("BodyBody", ".body", x)
  x <- gsub("Body", ".body", x) 
  x<- gsub("Gravity", ".gravity", x)
  x<- gsub("Acc", ".accelerometer", x)
  x<- gsub("Gyro", ".gyroscope", x)
  x<- gsub("Mag", ".magnitude", x)
  x<- gsub("Jerk", ".jerk", x)
  x
}
feature.names <- as.character(lapply(raw.feature.names, renameFeatures))
names(merged.set) <- feature.names

merged.data <- cbind(merged.subject, merged.activity, merged.set)


# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

groups <- group_by(merged.data, subject, activity)
summary <- summarise_each(groups, funs(mean))

#write.table(summary, "data_summary.txt", row.name=FALSE)


