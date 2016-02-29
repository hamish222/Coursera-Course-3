# Coursera-Course-3
This is a repository containing the files for the final project for the Coursera course titled "Getting and Cleaning Data".

The R script in run_analysis.R loads the test and training data in X_test.txt and X_train.txt.  It also reads the variable names in features.txt and reduces the list of variables to those that give either means or standard deviations.  The test and training data (for means and standard deviations) are then combined into a data frame named alldata.

The script then reads the activity information from y_test.txt and y_train.txt and the subject information from subject_test.txt and subject_train.txt.  These data (columns) are then prepended to the alldata data frame, and alldata is written to a file titled Course3ProjectCombinedData.txt.

Finally, the script computes the mean for each subject and each activity and writes the resulting data frame (named summary) to Course3ProjectSummaryData.txt.

