train<-read.table("./train/X_train.txt")
dim(train)
test<-read.table("./test/X_test.txt")
dim(test)



subject_train<-read.table("./train/subject_train.txt")
dim(subject_train)
subject_test<-read.table("./test/subject_test.txt")
dim(subject_test)


colnames(subject_train)<-"ID"
colnames(subject_test)<-"ID"


y_train<-read.table("./train/y_train.txt")
y_test<-read.table("./test/y_test.txt")

colnames(y_train)<-"activity"
colnames(y_test)<-"activity"



traindata<-cbind(train, subject_train,y_train)
dim(traindata)

testdata<-cbind(test, subject_test, y_test)
dim(testdata)


features<-read.table("./features.txt")
dim(features)


featuresID<-rbind(features,data.frame(V1=562,V2="ID"))
featuresID<-rbind(featuresID,data.frame(V1=563,V2="activity"))

colnames(featuresID)<-c("varnum","varname")
dim(featuresID)

library(reshape2)
library(dplyr)

wholedata<-rbind(traindata,testdata)
dim(wholedata)



featuresIDsub<-featuresID[grep("mean|std",featuresID$varname),]

featuresIDsub2<-featuresID[grep("meanFreq",featuresID$varname),]

featuresIDsub3<-featuresIDsub[!featuresIDsub$varnum %in% featuresIDsub2$varnum,]


dim(featuresIDsub3)
dim(featuresIDsub2)
dim(featuresIDsub)


keepvar<-as.character(featuresIDsub3$varnum)


library(stringr)


keepvar1<-str_c("V",keepvar)
keepvar1

mydata<-subset(wholedata,select=c(keepvar1,"ID","activity"))

head(mydata,6)




attach(mydata)
mydata$activityname[mydata$activity=='1']<-"WALKING"
mydata$activityname[mydata$activity=='2']<-"WALKING_UPSTAIRS"
mydata$activityname[mydata$activity=='3']<-"WALKING_DOWNSTAIRS"
mydata$activityname[mydata$activity=='4']<-"SITTING"
mydata$activityname[mydata$activity=='5']<-"STANDING"
mydata$activityname[mydata$activity=='6']<-"LAYING"
detach(mydata)

head(mydata,20)





tidydata<-rename(mydata,  tBodyAccMeanX=V1,
			  tBodyAccMeanY=V2,
			  tBodyAccMeanZ=V3,
			  tBodyAccStdX=V4,
			  tBodyAccStdY=V5,
			  tBodyAccStdZ=V6,
			  tGravityAccMeanX=V41,
			  tGravityAccMeanY=V42,
			  tGravityAccMeanZ=V43,
			  tGravityAccStdX=V44,
			  tGravityAccStdY=V45,
			  tGravityAccStdZ=V46,
			  tBodyAccJerkMeanX=V81,
			  tBodyAccJerkMeanY=V82,
			  tBodyAccJerkMeanZ=V83,
			  tBodyAccJerkStdX=V84,
			  tBodyAccJerkStdY=V85,
			  tBodyAccJerkStdZ=V86,
			  tBodyGyroMeanX=V121,
			  tBodyGyroMeanY=V122,
			  tBodyGyroMeanZ=V123,
			  tBodyGyroStdX=V124,
			  tBodyGyroStdY=V125,
			  tBodyGyroStdZ=V126,
			  tBodyGyroJerkMeanX=V161,
			  tBodyGyroJerkMeanY=V162,
			  tBodyGyroJerkMeanZ=V163,
			  tBodyGyroJerkStdX=V164,
			  tBodyGyroJerkStdY=V165,
			  tBodyGyroJerkStdZ=V166,
			  tBodyAccMagMean=V201,
			  tBodyAccMagStd=V202,
			  tGravityAccMagMean=V214,
			  tGravityAccMagStd=V215,
			  tBodyAccJerkMagMean=V227,
			  tBodyAccJerkMagStd=V228,
			  tBodyGyroMagMean=V240,
			  tBodyGyroMagStd=V241,
			  tBodyGyroJerkMagMean=V253,
			  tBodyGyroJerkMagStd=V254,
			  fBodyAccMeanX=V266,
			  fBodyAccMeanY=V267,
			  fBodyAccMeanZ=V268,
			  fBodyAccStdX=V269,
			  fBodyAccStdY=V270,
			  fBodyAccStdZ=V271,
			  fBodyAccJerkMeanX=V345,
			  fBodyAccJerkMeanY=V346,
			  fBodyAccJerkMeanZ=V347,
			  fBodyAccJerkStdX=V348,
			  fBodyAccJerkStdY=V349,
			  fBodyAccJerkStdZ=V350,
			  fBodyGyroMeanX=V424,
			  fBodyGyroMeanY=V425,
			  fBodyGyroMeanZ=V426,
			  fBodyGyroStdX=V427,
			  fBodyGyroStdY=V428,
			  fBodyGyroStdZ=V429,
 			  fBodyAccMagMean=V503,
			  fBodyAccMagStd=V504,
     			  fBodyAccJerkMagMean=V516,
			  fBodyAccJerkMagStd=V517,
 			  fBodyGyroMagMean=V529,
			  fBodyGyroMagStd=V530,
 			  fBodyGyroJerkMagMean=V542,
			  fBodyGyroJerkMagStd=V543,
			  SubjectID=ID,
			  activitySymbol=activity,
			  activityLabel=activityname


)

names(tidydata)

tidydata$SubjectID<-factor(tidydata$SubjectID)
tidydata$activitySymbol<-factor(tidydata$activitySymbol)

levels(tidydata$SubjectID)
levels(tidydata$activitySymbol)

str(tidydata)



aa<-tidydata[,!(names(tidydata) %in% "activitySymbol")]

melted<-melt(aa,id.vars=c("SubjectID","activityLabel"))

str(melted)

tidydatatwo<-summarise(group_by(melted,SubjectID,activityLabel,variable),mean=mean(value))

head(tidydatatwo)

write.table(tidydatatwo,"C:/JingLi/Learning material/R/Getting and cleaning data/project/tidydatatwo.txt",quote = FALSE,row.name=FALSE)

