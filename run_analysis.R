
trainSet <- read.table("UCIHARDataset/train/X_train.txt", sep = "")
trainAct <- read.table("UCIHARDataset/train/y_train.txt", sep = "", col.name = "activityCode")
trainSubject <- read.table("UCIHARDataset/train/subject_train.txt", sep = "", col.name = "Subject")
testSet <- read.table("UCIHARDataset/test/X_test.txt", sep = "")
testAct <- read.table("UCIHARDataset/test/y_test.txt", sep = "", col.name = "activityCode")
testSubject <- read.table("UCIHARDataset/test/subject_test.txt", sep = "", col.name = "Subject")
actName <- read.table("UCIHARDataset/activity_labels.txt", sep = "", col.name = c("activityCode", "activityName"))
variable <- read.table("UCIHARDataset/features.txt", sep = "")
# read data

colnames(trainSet) <- variable$V2
colnames(testSet) <- variable$V2
#column names
trainMain <- cbind2(trainSubject, trainSet)
testMain <- cbind2(testSubject, testSet)
#combine subject and act
trainMain <- cbind2(trainMain, trainAct)
testMain <- cbind2 (testMain, testAct)
#combine activity

rm(testAct, testSet, testSubject,trainAct, trainSet, trainSubject)
#remove

k <- 1
for (i in trainMain[,563]){
    trainMain[k, 564] <- actName[actName$activityCode == i, 2]
    k <- k+1
}
#combine activity code
q <- 1
for (i in testMain[,563]){
    testMain[q, 564] <- actName[actName$activityCode == i, 2]
    q <- q+1
}
#combine activity names
#----
colnames(trainMain)[564] <- "activityName"
colnames(testMain)[564] <- "activityName"
#names columns

complete <- rbind2(trainMain, testMain)
#merge triaining and testing data


meanStd <-complete[ ,grep("mean[()]|std[()]|Subject|activityName",colnames(complete))]
#subset the mean and standard deviation


empty <- data.frame()
ff <- data.frame()
www <- data.frame()
xx <- data.frame()
for (i in 1:30) {
#for each subject    
    for (k in c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")){
#for each activity        
        li <- meanStd[ which(meanStd$Subject==i & meanStd$activityName == k), ]
        qqq <- data.frame(colMeans(li[2:67]))
        ff[1:66,1] <- colnames(li)[2:67]
        
        qqqa <- cbind2(ff,qqq)
        #variable name and value
        www[1:66, 1] <- k
        qqqb <- cbind(www,qqqa)
        #activity
        xx[1:66, 1] <- i
        qqqc <- cbind(xx, qqqb)
        #subject
        
        empty <- rbind2(empty, qqqc)
    }
    
    
}
#compute the average of each subject, each activity and each measurement variable

colnames(empty)[1:4] <- c("Subject", "Activity", "MeasurementVariable", "averageValue")

library(reshape2)
tidyData <- dcast(empty, Subject + Activity ~ MeasurementVariable)
#reshape the data frame
names(tidyData) <- gsub("mean[(][])]", "mean", names(tidyData))
names(tidyData) <- gsub("std[(][])]", "std", names(tidyData))
#more legitimate column names.

write.table(tidyData, "tidy.txt", row.names=FALSE)