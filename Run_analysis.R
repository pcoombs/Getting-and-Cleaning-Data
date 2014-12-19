# step 1 Merges the training and the test sets to create one data set.

testxdata <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
testydata <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
testsubjdata <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
trainxdata <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
trainydata <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
trainsubjdata <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)
data <- rbind(testxdata,trainxdata)
labels <- rbind(testydata,trainydata)
subject <- rbind(testsubjdata,trainsubjdata)
mergeddata <- cbind(labels,subject,data)

# step 2 Extracts only the measurements on the mean and std deviation for each measurement.
## subset of features file by mean and std deviation

featuresnames <- read.table("./UCI HAR Dataset/features.txt",header=FALSE)
subfeatures <- featuresnames[grep("mean\\(\\)|std\\(\\)",featuresnames$V2),]
#subset mergeddata by mean and std deviation
mergeddata2 <- mergeddata[,c(1,2,subfeatures$V1+2)]

# step 3 uses descriptive activity names to name the activitys in the data set.

activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE)
#replace label id with description
names(mergeddata2)[1] <- "activity"
names(mergeddata2)[2] <- "subject"

mergeddata2$activity <- activitylabels[mergeddata2$activity,2]

# step 4 appropriately label the data set with descriptive variable names

colnames(mergeddata2) <- c("activity","subject",as.vector(subfeatures[,2]))
# change column headers to lower case
colnames(mergeddata2) <- tolower(colnames(mergeddata2))

# step 5 From step 4, create a second, independent tidy data set with the average of each variable
## for each activity and each subject

aggdata <- aggregate(mergeddata2 [,3:68], by=list(activity = mergeddata2$activity, subject=mergeddata2$subject), mean)


write.table(aggdata,file="tidydataset.txt",row.names=FALSE)
