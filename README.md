# Getting-and-Cleaning-Data_Course-Project

#Read original data sets and merger them to get one dataset

#First, manually download the data in the local disk 
#Read train and test activity datasets 
#Check the dimension of the train and test activity datasets

train<-read.table("./train/X_train.txt")

dim(train)
##[1] 7352  561

test<-read.table("./test/X_test.txt")

dim(test)
##[1] 2947  561

#Read subject identity column for the train activity dataset and test activity dataset and check their dimensions

subject_train<-read.table("./train/subject_train.txt")

dim(subject_train)
##[1] 7352    1

subject_test<-read.table("./test/subject_test.txt")

dim(subject_test)
##[1] 2947    1

#Change the column name of subject identity file to "ID"

colnames(subject_train)<-"ID"

colnames(subject_test)<-"ID"

#Read the activity labels for train and test datasets

y_train<-read.table("./train/y_train.txt")

y_test<-read.table("./test/y_test.txt")

#Change the column name of activity label to "activity"
colnames(y_train)<-"activity"

colnames(y_test)<-"activity"


#Combine the train activity dataset, train subject dataset and activity label dataset to get the train dataset
traindata<-cbind(train, subject_train,y_train)

dim(traindata)
## [1] 7352  563

#Combine the test activity dataset, test subject dataset and activity label dataset to get the test dataset
testdata<-cbind(test, subject_test, y_test)

dim(testdata)
##[1] 2947  563

#Read the features dataset and check its dimension
features<-read.table("./features.txt")

dim(features)
##[1] 561   2

#Add two variables to features dataset which are "ID" and "activity"
featuresID<-rbind(features,data.frame(V1=562,V2="ID"))

featuresID<-rbind(featuresID,data.frame(V1=563,V2="activity"))

#Rename columns of featuresID from "V1" to "varnum" and "V2" to "varname"
colnames(featuresID)<-c("varnum","varname")

dim(featuresID)
##[1] 563   2

#Install reshape2 package, dplyr package for later use
library(reshape2)

library(dplyr)

#Merge the training and the test sets to create one data set 
wholedata<-rbind(traindata,testdata)

dim(wholedata)
##[1] 10299   563


# Extracts only the measurements on the mean and standard deviation for each measurement

#Select the mean and std variables
featuresIDsub<-featuresID[grep("mean|std",featuresID$varname),]

#Select the meanFreq variables
featuresIDsub2<-featuresID[grep("meanFreq",featuresID$varname),]

#Delete the meanFreq variables from the data set which includes the mean and std variables 
#since the featuresIDsub dataset include all mean(meanFreq) and std variables
featuresIDsub3<-featuresIDsub[!featuresIDsub$varnum %in% featuresIDsub2$varnum,]

#Check the dimensions of the above files
dim(featuresIDsub3)
##[1] 66  2

dim(featuresIDsub2)
##[1] 13  2

dim(featuresIDsub)
##[1] 79  2

#Change the variable "varnum" from numeric to character
keepvar<-as.character(featuresIDsub3$varnum)

#Install stringr library
library(stringr)

#Create a string which inclues the names of all of the selected variables 
keepvar1<-str_c("V",keepvar)

keepvar1
##[1] "V1"   "V2"   "V3"   "V4"   "V5"   "V6"   "V41"  "V42"  "V43"  "V44"  "V45"  "V46"  "V81"  "V82"  "V83"  "V84"  "V85"  "V86"  "V121" "V122" "V123" "V124" "V125"
##[24] "V126" "V161" "V162" "V163" "V164" "V165" "V166" "V201" "V202" "V214" "V215" "V227" "V228" "V240" "V241" "V253" "V254" "V266" "V267" "V268" "V269" "V270" "V271"
##[47] "V345" "V346" "V347" "V348" "V349" "V350" "V424" "V425" "V426" "V427" "V428" "V429" "V503" "V504" "V516" "V517" "V529" "V530" "V542" "V543"


#Subset from the whole data which includes the variables of mean, std, ID and activity
mydata<-subset(wholedata,select=c(keepvar1,"ID","activity"))

#Check the dataset
head(mydata,6)


# Uses descriptive activity names to name the activities in the data set

#Create a new column to name the activities in the dataset. The name of the new column is "activityname"
attach(mydata)

mydata$activityname[mydata$activity=='1']<-"WALKING"

mydata$activityname[mydata$activity=='2']<-"WALKING_UPSTAIRS"

mydata$activityname[mydata$activity=='3']<-"WALKING_DOWNSTAIRS"

mydata$activityname[mydata$activity=='4']<-"SITTING"

mydata$activityname[mydata$activity=='5']<-"STANDING"

mydata$activityname[mydata$activity=='6']<-"LAYING"

detach(mydata)

#Check the new dataset
head(mydata,20)




# Appropriately labels the data set with descriptive variable names. 

#Rename the dataset with descriptive variable names

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

#Check the names of the dataset
names(tidydata)
## [1] "tBodyAccMeanX"        "tBodyAccMeanY"        "tBodyAccMeanZ"        "tBodyAccStdX"         "tBodyAccStdY"          "tBodyAccStdZ"         "tGravityAccMeanX"    
## [8] "tGravityAccMeanY"     "tGravityAccMeanZ"     "tGravityAccStdX"      "tGravityAccStdY"      "tGravityAccStdZ"      "tBodyAccJerkMeanX"    "tBodyAccJerkMeanY"   
##[15] "tBodyAccJerkMeanZ"    "tBodyAccJerkStdX"     "tBodyAccJerkStdY"     "tBodyAccJerkStdZ"     "tBodyGyroMeanX"       "tBodyGyroMeanY"       "tBodyGyroMeanZ"      
##[22] "tBodyGyroStdX"        "tBodyGyroStdY"        "tBodyGyroStdZ"        "tBodyGyroJerkMeanX"   "tBodyGyroJerkMeanY"   "tBodyGyroJerkMeanZ"   "tBodyGyroJerkStdX"   
##[29] "tBodyGyroJerkStdY"    "tBodyGyroJerkStdZ"    "tBodyAccMagMean"      "tBodyAccMagStd"       "tGravityAccMagMean"   "tGravityAccMagStd"    "tBodyAccJerkMagMean" 
##[36] "tBodyAccJerkMagStd"   "tBodyGyroMagMean"     "tBodyGyroMagStd"      "tBodyGyroJerkMagMean" "tBodyGyroJerkMagStd"  "fBodyAccMeanX"        "fBodyAccMeanY"       
##[43] "fBodyAccMeanZ"        "fBodyAccStdX"         "fBodyAccStdY"         "fBodyAccStdZ"         "fBodyAccJerkMeanX"    "fBodyAccJerkMeanY"    "fBodyAccJerkMeanZ"   
##[50] "fBodyAccJerkStdX"     "fBodyAccJerkStdY"     "fBodyAccJerkStdZ"     "fBodyGyroMeanX"       "fBodyGyroMeanY"       "fBodyGyroMeanZ"       "fBodyGyroStdX"       
##[57] "fBodyGyroStdY"        "fBodyGyroStdZ"        "fBodyAccMagMean"      "fBodyAccMagStd"       "fBodyAccJerkMagMean"  "fBodyAccJerkMagStd"   "fBodyGyroMagMean"    
##[64] "fBodyGyroMagStd"      "fBodyGyroJerkMagMean" "fBodyGyroJerkMagStd"  "SubjectID"            "activitySymbol"       "activityLabel"       


#Change the variable subjectID and activitySymbol from numeric to factor

tidydata$SubjectID<-factor(tidydata$SubjectID)

tidydata$activitySymbol<-factor(tidydata$activitySymbol)

#Check the levels of subjectID and activitySymbol
levels(tidydata$SubjectID)
## [1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25" "26" "27" "28" "29" "30"

levels(tidydata$activitySymbol)
##[1] "1" "2" "3" "4" "5" "6"


#Check the structure of the tidy dataset 
str(tidydata)

#Write the first tidy dataset to a txt data file
write.table(tidydata,"./tidydata.txt",quote = FALSE,row.name=FALSE)



# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

#Deleted the activitySymbol column from the tidy dataset and create a new dataset "aa"
aa<-tidydata[,!(names(tidydata) %in% "activitySymbol")]

# Set "SubjectID" and "activityLabel" as id variables and reshape the aa dataset. This step will create a combination of
# each activity and each subject
melted<-melt(aa,id.vars=c("SubjectID","activityLabel"))

#Check the structure of the melted dataset
str(melted)

#Group the dataset and summarize to get the mean value of each variable for each activity and subject 
tidydatatwo<-summarise(group_by(melted,SubjectID,activityLabel,variable),mean=mean(value))

#Check the summarized dataset
head(tidydatatwo)

#Write the dataset to a txt data file
write.table(tidydatatwo,"./tidydatatwo.txt",quote = FALSE,row.name=FALSE)


