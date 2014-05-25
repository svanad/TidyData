library(plyr)

#creates a tidy dataset from the UCI HAR Dataset
#saves the tidy dataset to file "tidydata.txt" in the working directory
run_analysis <- function() {
    #read data
    data.dir <- "UCI HAR Dataset"
    activity.labels <- read.table(paste0(data.dir, "/activity_labels.txt"))
    features <- read.table(paste0(data.dir, "/features.txt"))
    person.train <- read.table(paste0(data.dir, "/train/subject_train.txt"))
    person.test <- read.table(paste0(data.dir, "/test/subject_test.txt"))
    activity.train <- read.table(paste0(data.dir, "/train/y_train.txt"), 
                                 colClasses = "factor")
    activity.test <- read.table(paste0(data.dir, "/test/y_test.txt"), 
                                colClasses = "factor")
    data.train <- read.table(paste0(data.dir, "/train/X_train.txt"))
    data.test <- read.table(paste0(data.dir, "/test/X_test.txt"))
    
    #merge train and test data
    person <- rbind(person.train, person.test)
    activity <- rbind(activity.train, activity.test)
    data <- rbind(data.train, data.test)
    
    #add person and activity data and column names
    activity.labels[,2] <- tolower(activity.labels[,2])
    #convert activity labels to lowerCamelCase
    activity.labels[,2] <- gsub("_(.)", "\\U\\1", activity.labels[,2], perl = TRUE)
    levels(activity[,1]) <- activity.labels[,2]
    names(data) <- features[,2]
    names(person) <- "person"
    names(activity) <- "activity"
    data <- cbind(person, activity, data)
    
    #extract columns with mean or std only
    #in the following reg. exp.: mean[^,\\)] -- don't choose "angle" features
    chosen.cols <- grep("mean[^,\\)]|std", names(data), ignore.case = TRUE)
    chosen.cols <- c(1, 2, chosen.cols)
    data <- data[, chosen.cols]
    
    #rename feature columns
    names(data) <- gsub("-mean\\(\\)-?", "Mean", names(data))
    names(data) <- gsub("-meanFreq\\(\\)-?", "MeanFreq", names(data))
    names(data) <- gsub("-std\\(\\)-?", "Std", names(data))
    
    #create summary
    tidy.data <- ddply(data, .(person, activity), numcolwise(mean))
    
    #save the created tidy data
    write.table(tidy.data, "tidydata.txt", 
                quote = FALSE, sep = "\t", 
                row.names = FALSE, col.names = TRUE)
}
