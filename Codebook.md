##Source data
This is a data set studying human activity recognition using smart phones,which can be obtained from UCI Machine Learning Repository website.
A full description can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data for the project can be downloaded here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##R script
The file "run_analysis.R" performs the following 5 steps:

    1,Merge the training and the test sets to create one data set
    1.0,download the data and unzip dataset
    1.1,read the training and test data sets
    1.2,assign column names
    1.3, merge the training and test data sets
    
    2,Extract only the measurements on the mean and standard deviation for each measurement
    2.1,read all column names
    2.2,create vector for IDs, mean and standard deviation
    2.3,make subset from mergedata
    
   3, Use descriptive activity names to name the activities in the data set
   
   4, Approriately labeling the data set with descriptive variable names
   
   5, Create a second, independent tidy data set with the average of each variable for each activity and each subject
    5.1, make a second tidy data set
    5.2, write the second data set into txt file
    
  
#Variables 
*`x_train`,`y_train`,`subject_train`,`x_test`,`y_test` and `subject_test` contain files from the downloadable dataset zip file.
*`merge_train'`merges the training data set. `merge_test` merges the test data set. `mergedata` merges `merge_train` and `merge_test`.

  
  
  

