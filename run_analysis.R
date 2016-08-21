## Loading the applicable packages
#install.packages("reshape2")
library(reshape2)

## Set the Working Directory
#setwd("C:/Users/HAL/datasciencecoursera/Course3Week4Assignment")

## Load the Activity Label text file
act_lbls <- read.table("UCI HAR Dataset/activity_labels.txt") 
## Convert 2nd column to charcters
act_lbls[,2] <- as.character(act_lbls[,2])


## Load the Features text file
feat <- read.table("UCI HAR Dataset/features.txt")
## Convert 2nd column to characters
feat[,2] <- as.character(feat[,2])


## Clean up the Feat table - pull out Mean and Standard Deviations
feat_wanted <- grep(".*mean.*|.*std*.", feat[,2])
## Clean up the Feat data names
feat_names <- feat[feat_wanted,2]
feat_names = gsub('-mean', 'Mean', feat_names)
feat_names = gsub('-std', 'STD', feat_names)
## Remove any remaining dashes
feat_names <- gsub('[-()]', '', feat_names)

## Loading the training data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")[feat_wanted]
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
sub_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(sub_train, y_train, x_train)

## Loading the testing data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")[feat_wanted]
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
sub_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(sub_test, y_test, x_test)

## Merge training data with testing data
hwdata <- rbind(train, test)
colnames(hwdata) <- c("subject", "activity", feat_names)

## Change data into factors
hwdata$activity <- factor(hwdata$activity, levels = act_lbls[,1], labels = act_lbls[,2])
hwdata$subject <- as.factor(hwdata$subject)

## Melt the data 
melthwdata <- melt(hwdata, id = c("subject", "activity"))

## Get the averages/means of the hwdata
avghwdata <- dcast(melthwdata, subject + activity ~ variable, mean)

## Write the tidy data text file
write.table(avghwdata, "tidy.txt", row.names = FALSE, quote = FALSE)