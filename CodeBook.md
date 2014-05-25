#Code Book

The description of the original dataset is written in the last section (Feature Selection for the original dataset). 

##Variables and format of the generated dataset

###Variables
There is only a subset of the original features in the generated dataset. Only the features that represent mean or standard deviation are selected, i.e. the ones 
that contain mean(), meanFreq() or std(), total 79 features. The variables representing the angle between mean vector and other vector are not present in the generated dataset. 

The generated data contains the averages of each feature for each combination of person - activity. 

All the variables are listed in the file "features.txt"
For description of the variables see the last section (Feature Selection for the original dataset). 

###Format
Each record of the generated dataset has the form     
`person activity Feature1 ... Feature79`

Types of the fields are as follows
* person - a number from 1 to 30 (for each of the 30 participants of the measurements)
* activity - factor with values walking, walkingUpstairs, walkingDownstairs, sitting, standing, laying
* FeatureI - a numeric value within [-1,1]

###Naming conventions
The names of the features were renamed to form consistent naming conventions. The names of the averages hold the same base name as the original features 
but were converted to lowerCamelCase. All special characters such as "-", "_" or "()" were omitted. Also the activity names were changed to comply with this convention. 

##Transformations of the data
Following files are used from the original dataset
* activity_labels.txt - used for label the activities with descriptive names
* features.txt - names of measured features that is used to name the columns in the generated data
* train/subject_train.txt, test/subject_test.txt - people that took part in the observations
* train/X_train.txt, test/X_test.txt - the data
* train/y_train.txt, test/y_test.txt - the activities performed
* the script does not use data from the train/Inertial Signals and test/Inertial Signals subfolders

The script does the following transformations
* appends test data after train data separatedly for measurements (X_train, X_test), people (subject_train, subject_test) and activities (y_train, y_test)
* renames activity labels to lowerCamelCase
* names the columns with their respective feature names from features.txt
* adds people list as the first column of the data
* adds activities as the second column of the data
* extracts columns with selected features (see previous section)
* renames the columns according to naming conventions (see previous section)
* summarizes the data in the desired format with `ddply(data, .(person, activity), numcolwise(mean))` (see previous section)
* saves the data into "tidydata.txt" in tab separated format with header

The names of all the columns is taken from the data and saved into file "features.txt"

##Feature Selection for the original dataset (cited from the description of the [original dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones))

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:     
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

###The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

###Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean
