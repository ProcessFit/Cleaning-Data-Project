# Coursera - Getting and Cleaning Data
## Course Project

This assignment uses data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
<a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</a>

The data for the project is available here: <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</a>

The <b>objectives</b> of the project are to create an R script that:
<ol><li>Merges the training and the test sets to create one data set.
<li>Extracts only the measurements on the mean and standard deviation for each measurement.
<li>Uses descriptive activity names to name the activities in the data set
<li>Appropriately labels the data set with descriptive variable names.
<li>From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
</ol>

### Explanation of Script: run_analysis.R
**Download files**

* Create a temporary file to download the data, then extract files to a data folder using `unzip` command `junkpaths=TRUE`. 
* Flattens unzipped folder structure.
* If the directory "UCI HAR Dataset" already exists, this stage is skipped

**Read reference data**

* *Files: features.txt, activity_labels.txt*
* Reference data contains information on the "features" (561 Obs) and "activity" (6 obs)
* "features" are subsequently used to rename column headings for data in the "x" dataset.
* "activity" is subequently used to label factors associated with activity in the "y" dataset. 

**Read subject data**

* *Files: subject_Train.txt, subject_test.txt*
* Subject data is read from the "test" and "train" datasets, and then combined using row binding.
* The subject dataset contains a single variable, and is assigned the name "subjectID"

**Read "x" data**

* *Files: x_Train.txt, x_test.txt*
* "x" data is read from the "test" and "train" datasets, and then combined using row binding.
* The "x" dataset contains 561 variables (column names), corresponding to the "features" 
* Column names are reassigned the "features" names, based on position (there are some duplicate column names not impacting on this analysis)
* Required columns corresponding to the observations of mean and standard deviation are identified, and retained for further analysis. Other columns are dropped. 
* 66 variables (columns), corresponding to the mean and standard deviation measures are retained.

**Read "y" data**

* *Files: y_Train.txt, y_test.txt*
* "y" data is read from the "test" and "train" datasets, and then combined using row binding.
* The "y" dataset contains 1 variable, corresponding to the "activity" 
* Values are converted to readable format, by converting the activity measure to a factor (`as.factor`), then applying the activity names to the levels of the factor: `levels(y$activity) <- tolower(activity$activity)`

**Create fully merged 'clean' dataset**

* Merge the data sets using colbind to combine subject, x and y data frames.
  * Creates a "wide" data set, with columns for subject, activity, and each of the 66 measures.
* To product a "long-skinny" data set, the `gather` function of the `tidyr` R package is used
* A summary table for the "average" of mean and standard deviation measures is created using 'dplyr' functions to `group_by` and `summarise`
* This summarised data is output to the file "UCIoutputData.csv", using `write.table`.


## Output File "UCIoutputData.csv"
The output file has the following format

subject_ID | activity | feature |  mean 
------------- | ------------- | ------------- | -----------------
Integer [1:30] corresponding to the subject_ID as per original data | The activity corrseponding to the observations type: (walking/etc) | The measurement associated with the observation - either a mean, or standard deviation | The average value of the values associated with the subject-activity-feature

The file can be read using the following code:

    d <- read.table("UCIoutputData.csv",header=TRUE, sep=",")
    head(d)
   