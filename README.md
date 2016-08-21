# Read.me
# Getting and Cleaning Data - Course Project Week 4

This is the course project for the fourth week of the Getting and Cleaning Data Coursera course.
The R script, `run_analysis.R`, does the following:
1.  Setting the Library
    a.  Install the package for reshape2
b.  Load the library reshape2
2.  Set the working directory.
    a.  Set the working directory to the file where you saved the zip file.
3.  Loading the desired data sets (Activity).
    a.  Load the activity labels text into the Rstudio console to begin working with and organizing the data.
4.  Loading the desired data sets (Features).
    a.  Load the features text into the Rstudio console to begin working with and organizing the data.
        i.  Both Activity Labels and Features need to be properly loaded in order to keep data organized when creating the variables for the Mean(s) and Standard Deviations(s).
5.  Creating variables for mean and standard deviation.
    a.  Use the grep function to pull the mean and/or standard deviation from the Features text and then use the gsub command to name the Features ‘Mean’ and ‘Std’.
6.  Load the Training data sets keeping only those columns which reflect a mean or standard deviation that then are column bound (cbind) into a new data frame.
7.  Load the Test datasets keeping only those columns which reflect a mean or standard deviation that are then column bound (cbind) into a new data frame.
8.  Merging the new data sets together.
    a.  After cbinding the Train and Test factors into a new data frame, rbind the Test and Train factors into a new data table
    b.  Additionally, name the new data table columns to keep everything organized
9.  Changing the data into factors
    a.  Begin changing the data into factors by using the ‘factor’ command to convert the `activity` and `subject` columns into factors 
10.  Melting the data
    a.  Use the ‘melt’ function to stack the ID into a single column of data
11.  Getting the mean of the Combined data
    a.  Using the ‘dcast’ command the “molten” data can be reshaped into a data frame and then can be molded to the new format and get the mean of the data
12.  Writing new table
    a.  Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair. The end result is shown in the file `tidy.txt`.

