## Getting and Cleaning Data - Course Project

## Objective: Merge Test and Training data sets to create one data set
## Requirement is tidy data:
## Each variable in a column, 
## each observation in a row, 
## one table for "type" of observation

# call required libraries
library(dplyr)
library(tidyr)


## ----------- Download files --------------------------------#
## Create a temporary file to download the data, then extract files to a data folder
## using unzip command with options to junkpaths. If the directory "UCI HAR Dataset"
## already exists .. we can skip this stage.
## This flattens unzipped folder structure for ease of reading data.
if(!file.exists("UCI HAR Dataset")){
        message("Downloading files ...")
        temp <- tempfile()
        zp <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(zp,temp)
        unzip(temp, exdir = "UCI HAR Dataset", junkpaths=TRUE)
        unlink(temp)} else {
        message("Files Exists")
}


## ----------Read Common data --------------------------------#
## features and activities (standing, walking etc.)
features <- read.table("UCI HAR Dataset/features.txt",
                        header=FALSE,
                        col.names = c("featureID","feature"))
activity <- read.table("UCI HAR Dataset/activity_labels.txt",
                       header=FALSE,
                       col.names = c("activityID","activity"))
str(features); str(activity)

# ---------- Read in Subject data ----------------------------#
## subject: 1 variable - corresponding to person ID [1:30]
## train: 7352 observations
subject_train <- read.table("UCI HAR Dataset/subject_train.txt", 
                            col.names = "subjectID")

## test: 2947 observations
subject_test <- read.table("UCI HAR Dataset/subject_test.txt", 
                            col.names = "subjectID")
## bind these two data sets using rbind: 10299 obs
subject <- bind_rows(subject_train, subject_test)

# -------- Read in Y data and rename activites -------#
## y_train ... 1 variable - corresponding to activity 1, 2, 3, 4, 5, 6. 
## read in test and train tables, then row bind.
y_train <- read.table("UCI HAR Dataset/y_Train.txt", 
                      col.names="activity")  
y_test <- read.table("UCI HAR Dataset/y_test.txt", 
                      col.names="activity")  
y <- bind_rows(y_train,y_test)

## Convert the activity to a factor, then apply labels as per "activity" table.
## use lower case ... no shouting, easier to read!
y$activity <- as.factor(y$activity)
levels(y$activity) <- tolower(activity$activity)
## (alternative would have been to `merge` with tables .. but factors is quick)
table(y$activity)  ## quick check of result

# -------- Read in X data and select Columns with required features-------#
## x: 561 variables - corresponding to the "features" data set
## read in test and train tables, then row bind.
x_train <- read.table("UCI HAR Dataset/X_Train.txt")
x_test <- read.table("UCI HAR Dataset/X_test.txt")
x <- bind_rows(x_train, x_test)
# rename the columns corresponding to the features
names(x) <- features$feature
# get rid of the columns we don't need, using grep function :)
x <- x[,names(x)[grep("mean\\(|std\\(",names(x))]]

#  ---- Create fully merged dataset ... normalise for "clean data" -----#
## Merge the data sets using colbind  ... 
merged <- bind_cols(subject,y,x)

## First way to create the averages based on "wide" tidy data
m1 <- merged %>% 
        group_by(subjectID,activity) %>% 
        summarise_each(funs=(average="mean")) %>%
        arrange(subjectID,activity)
View(m1)


## Second way to create the average based on "long-skinny" data set and 
## summarising. (personal preference) ## calculates 2310 averages
m2 <- merged %>% 
        gather(key = feature, value = measurement, 
               -subjectID, -activity) %>% 
        mutate(feature=as.factor(feature)) %>%
        group_by(subjectID, activity,feature) %>%
        summarise(average=mean(measurement))
View(m2)

## Can convert back to wide if necessary.
m3 <- spread(m2,feature,mean)

## --------------  Write to output table ---------------#
write.table(m2, file="UCIoutputData.csv", row.names=FALSE)

## Method for reading this file:
d <- read.table("UCIoutputData.csv",header=TRUE)
head(d)
str(d)


