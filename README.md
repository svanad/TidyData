#Human Activity Recognition Using Smartphones Rearranged Tidy Dataset and Arranging Script

##Description of the original dataset (cited from the description of the original dataset
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones))
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

###For each record it is provided:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

###Notes
* Features are normalized and bounded within [-1,1].
* Each feature vector is a row on the text file.

##The following files are included
* CodeBook.md - the Code book which contains the varibles and transformations of the dataset
* features.txt - the list of all the features in the generated dataset
* README.md - this README
* run_analysis.R - the script that transforms the original dataset to this new tidy dataset
* tidydata.txt - rearranged tidy dataset generated by run_analysis.R

##run_analysis.R
This R script transforms the original dataset to this new tidy dataset. The transformations and format of the tidy dataset are described in the Code Book. 

The script expects the original dataset is in the working directory in the directory called "UCI HAR Dataset". It generates the rearranged dataset to the file
"tidydata.txt" in the working directory. 

Following files are used from the original dataset
* activity_labels.txt - used for label the activities with descriptive names
* features.txt - names of measured features that is used to name the columns in the generated data
* train/subject_train.txt, test/subject_test.txt - people that took part in the observations
* train/X_train.txt, test/X_test.txt - the data
* train/y_train.txt, test/y_test.txt - the activities performed
* the script does not use data from the train/Inertial Signals and test/Inertial Signals subfolders

The data is generated in the tab separated format. Read the data into R with `read.table("tidydata.txt", header = TRUE)`

The script uses the plyr library. 

##References
* description and full original dataset   
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
* Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

##License
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
