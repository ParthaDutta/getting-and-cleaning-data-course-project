createTidyData <- function() {

    # load data
    activityLabels <- read.table("./extracted-data/activity_labels.txt")

    testActivities <- read.table("./extracted-data/test/y_test.txt")
    testVolunteers <- read.table("./extracted-data/test/subject_test.txt")
    testData       <- read.table("./extracted-data/test/X_test.txt")

    trainingActivities <- read.table("./extracted-data/train/y_train.txt")
    trainingVolunteers <- read.table("./extracted-data/train/subject_train.txt")
    trainingData       <- read.table("./extracted-data/train/X_train.txt")

    #combine test and training data
    allActivities <- rbind(testActivities, trainingActivities)
    allvolunteers <- rbind(testVolunteers, trainingVolunteers)
    allData       <- rbind(testData, trainingData)
    
    #add activity label
    allActivities[, 2] = activityLabels[allActivities[ ,1], 2]
    colnames(allActivities)[1] <- "activityID"
    colnames(allActivities)[2] <- "activityName"
    
    #merge data frames into one
    colnames(allvolunteers)[1] <- "volunteerID"
    combinedData <- cbind(allActivities, allvolunteers, allData)

    #give nice column names
    combinedDataSelectedColumns <- combinedData[, c("activityName","volunteerID", "V1","V2","V3","V4","V5","V6","V41","V42","V43","V44","V45","V46","V81","V82","V83","V84","V85","V86","V121","V122","V123","V124","V125","V126","V161","V162","V163","V164","V165","V166","V201","V202","V214","V215","V227","V228","V240","V241","V253","V254","V266","V267","V268","V269","V270","V271","V345","V346","V347","V348","V349","V350","V424","V425","V426","V427","V428","V429","V503","V504","V516","V517","V529","V530","V542","V543")]

    colnames(combinedDataSelectedColumns) <- c("activityName","volunteerID", "tBodyAccMeanAxisX","tBodyAccMeanAxisY","tBodyAccMeanAxisZ","tBodyAccStandardDeviationAxisX","tBodyAccStandardDeviationAxisY","tBodyAccStandardDeviationAxisZ","tGravityAccMeanAxisX","tGravityAccMeanAxisY","tGravityAccMeanAxisZ","tGravityAccStandardDeviationAxisX","tGravityAccStandardDeviationAxisY","tGravityAccStandardDeviationAxisZ","tBodyAccJerkMeanAxisX","tBodyAccJerkMeanAxisY","tBodyAccJerkMeanAxisZ","tBodyAccJerkStandardDeviationAxisX","tBodyAccJerkStandardDeviationAxisY","tBodyAccJerkStandardDeviationAxisZ","tBodyGyroMeanAxisX","tBodyGyroMeanAxisY","tBodyGyroMeanAxisZ","tBodyGyroStandardDeviationAxisX","tBodyGyroStandardDeviationAxisY","tBodyGyroStandardDeviationAxisZ","tBodyGyroJerkMeanAxisX","tBodyGyroJerkMeanAxisY","tBodyGyroJerkMeanAxisZ","tBodyGyroJerkStandardDeviationAxisX","tBodyGyroJerkStandardDeviationAxisY","tBodyGyroJerkStandardDeviationAxisZ","tBodyAccMagMean","tBodyAccMagStandardDeviation","tGravityAccMagMean","tGravityAccMagStandardDeviation","tBodyAccJerkMagMean","tBodyAccJerkMagStandardDeviation","tBodyGyroMagMean","tBodyGyroMagStandardDeviation","tBodyGyroJerkMagMean","tBodyGyroJerkMagStandardDeviation","fBodyAccMeanAxisX","fBodyAccMeanAxisY","fBodyAccMeanAxisZ","fBodyAccStandardDeviationAxisX","fBodyAccStandardDeviationAxisY","fBodyAccStandardDeviationAxisZ","fBodyAccJerkMeanAxisX","fBodyAccJerkMeanAxisY","fBodyAccJerkMeanAxisZ","fBodyAccJerkStandardDeviationAxisX","fBodyAccJerkStandardDeviationAxisY","fBodyAccJerkStandardDeviationAxisZ","fBodyGyroMeanAxisX","fBodyGyroMeanAxisY","fBodyGyroMeanAxisZ","fBodyGyroStandardDeviationAxisX","fBodyGyroStandardDeviationAxisY","fBodyGyroStandardDeviationAxisZ","fBodyAccMagMean","fBodyAccMagStandardDeviation","fBodyBodyAccJerkMagMean","fBodyBodyAccJerkMagStandardDeviation","fBodyBodyGyroMagMean","fBodyBodyGyroMagStandardDeviation","fBodyBodyGyroJerkMagMean","fBodyBodyGyroJerkMagStandardDeviation")
    
    #write tidy data to file
    write.csv(combinedDataSelectedColumns, file = "tidy-data.txt", row.names = FALSE)
    
}