#Function to run analysis on the files in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# The function downloads the zip file from the url in the current directory then it will unzip the file and run the analysis to create a tidy data set.
# The tidy data set will be saved in a text file called tidy_data.txt in the same directory

run_analysis <- function()
{
library(sqldf)
curr_dir<-getwd()
############ Download data and unzip ############################
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","coursera3_data.zip")
unzip("coursera3_data.zip",exdir="./")

setwd(paste0(curr_dir,"/UCI HAR Dataset"))

####### Read Features ############
features<- as.character(read.table("features.txt")$V2)

####### Select only mean and std features ############
selected_features_index <- c(grep("mean\\(\\)",features),grep("std\\(\\)",features))

######## Read and Merge Training and test data set #############

test<-read.table("test/X_test.txt")
train<-read.table("train/X_train.txt")
final_data <- rbind(train,test)

##### Extract only the measurements on the mean and standard deviation columns #

final_data<-final_data[,selected_features_index]

###### Rename columns with feature names ##########

colnames(final_data)<- features[selected_features_index]

###### Read activity  data #############

train_activity_index<-as.numeric(read.table("train/y_train.txt")$V1)
test_activity_index<-as.numeric(read.table("test/y_test.txt")$V1)
activity_labels<-as.character(read.table("activity_labels.txt")$V2)

######## Set Activity names #################
final_data$activity <- activity_labels[c(train_activity_index,test_activity_index)]

####### Read subject data #############
test_subject<-as.numeric(read.table("test/subject_test.txt")$V1)
train_subject<-as.numeric(read.table("train/subject_train.txt")$V1)

########## Tag subject in final data
final_data$subject<-c(train_subject,test_subject)


###### Prepare column names for calculating average
colnames(final_data)<-gsub("-","_",gsub("\\)","",gsub("\\(","",colnames(final_data))))
collist<-unlist(lapply(colnames(final_data),function(var) {paste0("avg(",var,") ",var,",")}))
collist<-paste(collist[1:(length(collist)-2)],collapse=" ")

########### Get average of the measures by subject and activity ######
SQLCMD=paste0("select ",collist," activity,subject from final_data group by activity,subject")
final_data<-sqldf(SQLCMD)
############ Write the tidy data in a text file
write.table(final_data,paste0(curr_dir,"/tidy_data.txt"),row.names=FALSE)
}

run_analysis()
