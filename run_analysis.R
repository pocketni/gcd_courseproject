###SCRIPT PURPOSE
#run_analysis.R reads in test and training data from the UCI HAR 
#dataset. It merges training and test data into a single table

###README BEFORE RUNNING
#Working directory must be set to the "UCI HAR Dataset" directory.
#Check getwd() if you don't know where you are.
# You can 1. Place this R Script in the directory and then select
#Session->Set Working Directory->To Source File Location in RStudio
#or 2. launch this script and manually select the correct directory.

#########
#PROJECT REQUIREMENT 1: merge training and test sets
#########

#Begin working code and explanatory babble
library(foreign) #just in case it's not loaded already
library(dplyr) #can't let all of those swirl lessons go to waste!

#Read in activity_labels.txt data, description/predictions 
#of activities being measured
activityname <- read.table("activity_labels.txt", stringsAsFactors=F)         

#features.txt, providing feature name for sensor readings
#you get a 561 x 2 data frame.
features <- read.table("features.txt", stringsAsFactors=F)
#Really we only need the second column
featurenames <- list(features[,2])

#read in the subject train and test data from their respective directories
subject.train <- read.table("train/subject_train.txt")
subject.test <- read.table("test/subject_test.txt")

#read in y (predicted activity)
y.test <- read.table("test/y_test.txt")
y.train <- read.table("train/y_train.txt")

#read in x (all aspects measured by phone sensors)
x.test <- read.table("test/X_test.txt")
x.train <- read.table("train/X_train.txt")

#Merge into large, friendly datasets.
#First the test data
test <- cbind(y.test, x.test)
test <- cbind(subject.test, test)

#then the trainining data
train <- cbind(y.train, x.train)
train <- cbind(subject.train, train)

#merge the two together into a full set
phonedata.full <- rbind(test,train)

#Remember that the order of columns is 1. Subject Number 2. Activity 
#3-561. Sensor data. So let's label them (somewhat) intelligibly.

names(phonedata.full) <- c("subject.no", "activity", featurenames[[1]])

phonedata.full$activity <- gsub("1", activityname[1,2], phonedata.full$activity)
phonedata.full$activity <- gsub("2", activityname[2,2], phonedata.full$activity)
phonedata.full$activity <- gsub("3", activityname[3,2], phonedata.full$activity)
phonedata.full$activity <- gsub("4", activityname[4,2], phonedata.full$activity)
phonedata.full$activity <- gsub("5", activityname[5,2], phonedata.full$activity)
phonedata.full$activity <- gsub("6", activityname[6,2], phonedata.full$activity)


########
#PROJECT REQUIREMENT 2: extract mean and std dev data
########

#Now that we have "phonedata" as a complete and merged set, let's extract 
#the mean and std dev measurements. The first method uses pattern matching
#to find all variables that contained mean() (Mean) or std() (Standard Deviation)
#in the variable name.

phonedata.excerpt <- cbind(phonedata.full[,1:2], phonedata.full[,grep("mean|std",names(phonedata.full),ignore.case=T)])

#However, I did decide to delete all of the angle calculations
phonedata.excerpt <- phonedata.excerpt[,-grep("angle",names(phonedata.excerpt),ignore.case=T)]


#I decided not to delete variables that had labels "meanFreq".
#However, if you would like to delete them, simply include the following line in your script
#phonedata.excerpt <- phonedata.excerpt[,-grep("meanFreq",names(phonedata.excerpt),ignore.case=T)]

#Should you decide not to keep either measurements involving "angle" or "meanFreq", run the following line instead
#phonedata.excerpt <- phonedata.excerpt[,-grep("angle|meanFreq",names(phonedata.excerpt),ignore.case=T)]


#Result with base code is a dataframe of 10299 observations in 81 columns. 

########
#PROJECT REQUIREMENT 3: intelligible and even intelligent labels
########

#All names (except XYZ orientations) are in lower case. I have trouble with capitals when typing quickly

#According to the features_info.text, "t" stands for "time domain signals"
#and "f" for "frequency domain signals

names(phonedata.excerpt)<- gsub("^t", "time.", names(phonedata.excerpt))
names(phonedata.excerpt)<- gsub("^f", "frequency.", names(phonedata.excerpt))

#get rid of characters that make R barf
names(phonedata.excerpt)<-gsub("-mean",".mean", names(phonedata.excerpt))
names(phonedata.excerpt)<-gsub("-std",".stddev", names(phonedata.excerpt))
names(phonedata.excerpt)<-gsub("\\(\\)", "", names(phonedata.excerpt))

#and now for some badly labeled stuff
names(phonedata.excerpt)<-gsub("BodyBody|Body","body.", names(phonedata.excerpt))

#Elaborate on mystical abbreviations
names(phonedata.excerpt)<-gsub("Acc","accelerometer", names(phonedata.excerpt))
names(phonedata.excerpt)<-gsub("Gyro","gyrometer", names(phonedata.excerpt))
names(phonedata.excerpt)<-gsub("Mag","magnitude", names(phonedata.excerpt))
names(phonedata.excerpt)<-gsub("Jerk",".jerk", names(phonedata.excerpt))
names(phonedata.excerpt)<-gsub("Gravity","gravity.", names(phonedata.excerpt))
names(phonedata.excerpt)<-gsub("meanFreq","meanfreq", names(phonedata.excerpt))

#one last bit with hyphens to be replaced with periods. periods are fun!
names(phonedata.excerpt)<-gsub("-",".", names(phonedata.excerpt))


#Painlessly generate headers for the codebook file
#write.table(names(phonedata.excerpt), "CodeBook.md", row.names=F, col.names=F)

########
#PROJECT REQUIREMENT 5: make tidy data and write it to file
########

#Putting dplyr to work, sort of
#smushing things into a dplyr friendly wrapper
sorted.phonedata.excerpt <- tbl_df(phonedata.excerpt)

#Giant chain of doom, see side comments
sorted.phonedata.excerpt %>%
  group_by(subject.no, activity) %>% #group by Subject.no and then Activity, to give it some order
  summarise_each(funs(mean)) %>% #then calculate means by groups that had been created
  write.table(file="measurement_averages_by_subject_and_activity.txt", row.names=FALSE) 
    #write out to a tidy table in the working directory
  
#This was a bit of a mouthful. To read it back in, uncomment line below. Make sure you're in the same
#directory as the tidy data file!

#read.table(file="measurement_averages_by_subject_and_activity.txt", sep=" ", header=TRUE) 


#Thanks for reading.
