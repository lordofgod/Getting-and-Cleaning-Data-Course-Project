#print("reading from activity_labels.txt...")
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
#print("reading from features.txt...")
features <- read.table("./data/UCI HAR Dataset/features.txt")
datacolnames <- c(as.character(features$V2),"activity_labels","subject")
#print("reading from subject_train.txt...")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
#print("reading from X_train.txt...")
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
#print("reading from y_train.txt...")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
training <- data.frame(X_train,y_train$V1,subject_train$V1)
colnames(training) <- datacolnames 
#print("reading from subject_test.txt...")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
#print("reading from X_test.txt...")
X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
#print("reading from y_test.txt...")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
test <- data.frame(X_test,y_test$V1,subject_test$V1)
colnames(test) <- datacolnames 
#print("merging data...")
mergedata <- rbind(training,test)
colnames(mergedata) <- datacolnames
#print("extracting data...")
extractsdata <- cbind(mergedata[,grepl("mean()",datacolnames) | grepl("std()",datacolnames)],mergedata[,"activity_labels"],mergedata[,"subject"])
newnames <- c(datacolnames[grepl("mean()",datacolnames) | grepl("std()",datacolnames)],"activity_labels","subject")
colnames(extractsdata) <- newnames
#print("naming activities...")
extractsdata$activity_labels <- activity_labels$V2[extractsdata$activity_labels]
#print("naming data...")
colnames(extractsdata) <- newnames
#print("calculating average...")
second <- aggregate(extractsdata[,1:(ncol(extractsdata)-2)],by=list(extractsdata$activity_labels,extractsdata$subject),FUN = mean)
colnames(second)[1:2] <- c("activity_labels","subject")
write.table(second,"average.txt",row.name=FALSE)
