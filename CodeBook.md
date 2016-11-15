## Codebook for Tidy Data Set
### Coursera Getting and Cleaning Data, Course Project

## Project Description
This assignment uses data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
<a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</a>

The <b>objectives</b> of the project are to create an R script that:
<ol><li>Merges the training and the test sets to create one data set.
<li>Extracts only the measurements on the mean and standard deviation for each measurement.
<li>Uses descriptive activity names to name the activities in the data set
<li>Appropriately labels the data set with descriptive variable names.
<li>From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
</ol>

##Data Source
The data for the project is available here: <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</a>

###Collection of the raw data
Data was collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
<a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</a>

##Creating the tidy datafile

###Guide to create the tidy data file UCIoutputData.csv
The tidy data file is created using the script run_analysis.R. The script includes the sourcing the data from the site, joining data tables and transforms. 
Two formats are available within the script - "wide", or "long and skinny". 
The "long and skinny format" has been chosen as "tidy" data and has been output to the UCIoutputData.csv file.

##Description of the variables in the UCIoutputData.csv
The file UCIoutputData.csv is a comma-separated variable file.

 - 11880 obs. of 4 variables
 - Variables: subjectID, activity, feature, average

###subjectID
 - An identifier of the subject who carried out the experiment.
 - Integer [1:30]

###activity
 - An factor with 6 levels, indicating the activity the subject was involved with when observation was conducted
 
1.  walking
2.  walking_upstairs
3.  walking_downstairs
4.  sitting
5.  standing
6.  laying

###feature
 - An factor with 66 levels, indicating the observation type. 
 - The features in the tidy data set are a subset of the original dataset, based on returning just those features that are a *standard deviaion* (std()) or *mean* (mean())
 - A full description of the "features" are available in the file "Feature Selection.txt" downloaded as part of the data set.
 
<table align="center"><tr><td>
fBodyAcc-mean()-X           
fBodyAcc-mean()-Y           
fBodyAcc-mean()-Z           
fBodyAcc-std()-X            
fBodyAcc-std()-Y            
fBodyAcc-std()-Z            
fBodyAccJerk-mean()-X       
fBodyAccJerk-mean()-Y       
fBodyAccJerk-mean()-Z       
fBodyAccJerk-std()-X        
fBodyAccJerk-std()-Y        
fBodyAccJerk-std()-Z        
fBodyAccMag-mean()          
fBodyAccMag-std()           
fBodyBodyAccJerkMag-mean()     
fBodyBodyAccJerkMag-std()     
fBodyBodyGyroJerkMag-mean()   
fBodyBodyGyroJerkMag-std()    
fBodyBodyGyroMag-mean()     
fBodyBodyGyroMag-std()   
fBodyGyro-mean()-X          
fBodyGyro-mean()-Y  
 </td><td>
fBodyGyro-std()-X           
fBodyGyro-std()-Y           
fBodyGyro-std()-Z           
tBodyAcc-mean()-X           
tBodyAcc-mean()-Y           
tBodyAcc-mean()-Z           
tBodyAcc-std()-X            
tBodyAcc-std()-Y            
tBodyAcc-std()-Z            
tBodyAccJerk-mean()-X       
tBodyAccJerk-mean()-Y       
tBodyAccJerk-mean()-Z       
tBodyAccJerk-std()-X        
tBodyAccJerk-std()-Y        
tBodyAccJerk-std()-Z        
tBodyAccJerkMag-mean()     
tBodyAccJerkMag-std()       
tBodyAccMag-mean()          
tBodyAccMag-std()           
tBodyGyro-mean()-X          
tBodyGyro-mean()-Y          
tBodyGyro-mean()-Z 
</td><td> 
tBodyGyro-std()-X           
tBodyGyro-std()-Y           
tBodyGyro-std()-Z  
tBodyGyroJerk-mean()-X      
tBodyGyroJerk-mean()-Y      
tBodyGyroJerk-mean()-Z      
tBodyGyroJerk-std()-X       
tBodyGyroJerk-std()-Y       
tBodyGyroJerk-std()-Z         
tBodyGyroJerkMag-mean()     
tBodyGyroJerkMag-std()      
tBodyGyroMag-mean()         
tBodyGyroMag-std()          
tGravityAcc-mean()-X        
tGravityAcc-mean()-Y        
tGravityAcc-mean()-Z        
tGravityAcc-std()-X         
tGravityAcc-std()-Y         
tGravityAcc-std()-Z         
tGravityAccMag-mean()      
tGravityAccMag-std()     
</td></tr></table>  


###average
 - A numeric value
 - Calculated average of the values associated with each feature, for each subject and activity.
 
 
 
