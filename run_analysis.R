# Working directory should be set to UCI HAR Dataset folder

# Remember path to working directory
wd <- getwd()

setwd(paste(wd, "/UCI HAR Dataset", sep = ""))
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

# Read test set
setwd(paste(wd, "/UCI HAR Dataset/test", sep = ""))
y_test <- read.table("y_test.txt")
x_test <- read.table("X_test.txt")
subject_test <- read.table("subject_test.txt")

# Read training set
setwd(paste(wd, "/UCI HAR Dataset/train", sep = ""))
y_train <- read.table("y_train.txt")
x_train <- read.table("X_train.txt")
subject_train <- read.table("subject_train.txt")

# Change back to original working directory
setwd(wd)

# Merge test and train data sets ang give appropriate column names
colnames(x_test) <- features$V2
test_data <- data.frame(y_test, subject_test, x_test)
colnames(test_data)[1:2] <- c("activity", "subject")

colnames(x_train) <- features$V2
train_data <- data.frame(y_train, subject_train, x_train)
colnames(train_data)[1:2] <- c("activity", "subject")

data <- rbind(test_data, train_data)

# Change activity numbers to labels
activity_labels$V2 <- tolower(activity_labels$V2) # in order to make it easier to type

currentActivity = 1
for (currentActivityLabel in activity_labels$V2) {
  data$activity <- gsub(currentActivity, currentActivityLabel, data$activity)
  currentActivity <- currentActivity + 1
}

data$activity <- as.factor(data$activity)
data$subject <- as.factor(data$subject)

# Create vector stating columns to pick
columns <- c(TRUE, TRUE)
for (i in 1:length(features$V2)) {
	m <- grepl("-mean()", features$V2[i])
	s <- grepl("-std()", features$V2[i])
	ms <- m | s
	if (grepl("-meanFreq()", features$V2[i]) == FALSE) {
		columns <- c(columns, ms)
	}
	else {columns <- c(columns, FALSE)}
}

# Pick columns with mean and std
data <- data[, columns]

# Create second tidy data set with the average of each variable for each activity and each subject
data2 <- data.frame()

activity <- data$activity
subject <- data$subject

data_without_activation_and_subject <- data[3:length(data)]
data2 <- aggregate(data, by = list(activity = data$activity, subject = data$subject), mean)
column_names <-colnames(data2)
for (k in 1:2) {
  for (i in 1:length(column_names)) {
    column_names[i] <- gsub("..", ".", column_names[i], fixed = TRUE)
    number_of_full_stops <- length(gregexpr(".", column_names[i], fixed = TRUE)[[1]])
    if (gregexpr(".", column_names[i], fixed = TRUE)[[1]][number_of_full_stops] == nchar(column_names[i])) {
      column_names[i] <- substr(column_names[i], 1, nchar(column_names[i])- 1)
    }
  }
}

colnames(data2) <- column_names

data2[, 4] <- NULL
data2[, 3] <- NULL

write.table(data2, "tidy_data.txt", sep = " ", row.names = FALSE)




