##I missed my deadline by a couple of hours due to bad time management.
##You will need to make a judgement call as to whether to score work submitted after the deadline  


#How to tidy data

##Initial setup

* The source data was obtained from this link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* After downloading zip please extract to a temporary folder of your choice.
* After extraction copy the folder that holds the data to the working directory where the run_analysis.r script exists.
* To make sure the correct folder is chosen, it will contain two sub-folders called "test" and "train".
* After it is copied across please rename folder to "extracted-data".
* This is a requirement of being able to execute the script "run_analysis.R"

* So for example, unzipping to root will create the following folder structure
* c:\UCI HAR Dataset
* c:\UCI HAR Dataset\UCI HAR Dataset
* c:\UCI HAR Dataset\UCI HAR Dataset\test
* c:\UCI HAR Dataset\UCI HAR Dataset\train

* Copy the sub folder ..\UCI HAR Dataset (not c:\UCI HAR Dataset) to the working directory and rename to "extracted-data"

##Execute script

* After sourcing the R script run_analysis, execute the function createTidyData()
* This will process the data in the sub-folder "extracted-data"
* An output file called tidy-data.txt will be created in the same location as the R script

##Outline of how the script creates the tidy data

* Initially load the data for test. This is spread over 3 files "./test/y_test.txt", "./test/subject_test.txt"" and "./test/X_test.txt".
* Repeat again for training data.
* Load the lookup data form activities "./extracted-data/activity_labels.txt"

* Combine the test and training data for activities into single dataset
* Combine the test and training data for volunteers into single dataset
* Combine the test & training data for stuff created and calculated from the activities performed into single dataset

* Merge the 3 datasets together, adding a user friendly activity label variable
* Filter out all variables not required, and provide human friendly names to variables remaining
* Finally write to file

##Notes

* Processing could be done several different ways, but I tried to keep the code simple and readable


#Summarise tidy data for each activity and volunteer

##Execute script

* After sourcing the R script run_analysis, execute the function createSummary(). Assumes that the tidy dataset has already been created

##Outline of how the script creates the summary data

* Load tidy data from file
* Load and and utilise the grouping capabilities in the library package "reshape"
* Write back out to file - mean-data.txt



