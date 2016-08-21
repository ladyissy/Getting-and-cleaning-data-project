  #1.Merge the training and the test sets to create one data set
#1.0,download the data and unzip dataset
if(!file.exists("./data")){dir.create("./data")}
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/dataset.zip",method="curl")
unzip(zipfile="./data/dataset.zip",exdir="./data")

#1.1,read the training and test data sets
##read the training data sets
x_train<-read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")
##read the test data sets
x_test<-read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")
##read the features vector
features<-read.table("./data/UCI HAR Dataset/features.txt")
##read activity labels
activitylabels<-read.table("./data/UCI HAR Dataset/activity_labels.txt")

#1.2,assign column names
colnames(x_train)<-features[,2]
colnames(y_train)<-"activityid"
colnames(subject_train)<-"subjectid"

colnames(x_test)<-features[,2]
colnames(y_test)<-"activityid"
colnames(subject_test)<-"subjectid"
colnames(activitylabels)<-c("activityid","activitytype")

#1.3, merge the training and test data sets
merge_train<-cbind(y_train,subject_train,x_train)
merge_test<-cbind(y_test,subject_test,x_test)
mergedata<-rbind(merge_train,merge_test)

  #2.Extract only the measurements on the mean and standard deviation for each measurement
##2.1,read all column names
colnames<-colnames(mergedata)

##2.2,create vector for IDs, mean and standard deviation
meanandstd<-(grepl("activityid",colnames)|grepl("subjectid",colnames)|grepl("mean..",colnames)|
                 grepl("std..",colnames))

##2.3,make subset from mergedata
mean_std_set<-mergedata[,meanandstd==TRUE]

  #3, Use descriptive activity names to name the activities in the data set
activitynames_set<-merge(mean_std_set,activitylabels,by="activityid",all.x=TRUE)

#4, Approriately labeling the data set with descriptive variable names.
## this step was made in previous steps (1.3,2.2,2.3)

  #5, Create a second, independent tidy data set with the average of each variable for each activity and each subject
##5.1, make a second tidy data set
tidyset<-aggregate(.~subjectid+activityid, activitynames_set,mean)
tidyset<-tidyset[order(tidyset$subjectid, tidyset$activityid),]
##5.2, write the second data set into txt file
write.table(tidyset,"tidyset.txt",row.name=FALSE)






