setwd("~/Desktop/CourseEra_Data Science/Getting and Cleaning Data/Course Project"

## Read training data
training_x<-read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
training_y<-read.csv("UCI HAR Dataset/train/y_train.txt",sep="",header=FALSE)
training_sub<-read.csv("UCI HAR Dataset/train/subject_train.txt",sep="",header=FALSE)

## Read testing data
testing_x<-read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
testing_y<-read.csv("UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE)
testing_sub<-read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

activity<-read.csv("UCI HAR Dataset/activity_labels.txt", sep="",header=FALSE)
features<-read.csv("UCI HAR Dataset/features.txt",sep="",header=FALSE)

## Merge training and test data sets to create one data set.
data_x<-rbind(training_x,testing_x)
data_y<-rbind(training_y,testing_y)
data_sub<-rbind(training_sub, testing_sub)
MergedData<-cbind(data_x,data_y,data_sub)

## Set names to variables
names(data_sub)<-c("subject")

## Extract only the measurements on the mean and standard deviation for each measurement.
   ## Extract columns only with mean() or std() 
MeanSdFeatures<-grep("-(mean|std)\\(\\)", features[, 2])
   ## Subset columns
data_x<-data_x[,MeanSdFeatures]
names(data_x)<-features[MeanSdFeatures,2]

## Adjust the lable in data set with proper names
colnames(MergedData)<-c(features$V2,"Activity","Subject")
colnames(MergedData)<-tolower(colnames(MergedData))

features = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

currentActivity = 1
for (currentActivityLabel in activityLabels$V2) {
        MergedData$activity <- gsub(currentActivity, currentActivityLabel, MergedData$activity)
        currentActivity <- currentActivity + 1
}

MergedData$activity <- as.factor(MergedData$activity)
MergedData$subject <- as.factor(MergedData$subject)




## Create a second, independent tidy data set with the average of each variable for each activity and each subject.

tidydata = aggregate(MergedData, by=list(activity = MergedData$activity, subject=MergedData$subject), mean)

write.table(tidy, "tidy.txt", sep="\t")
