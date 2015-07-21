The goal of this project is to prepare a tidy data set for later analysis. The tidy dataset only includes the measurements on the mean and standard deviation for each measurement. 

The data is collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for this project is here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

After downloading and unzipping the dataset, running the run_analysis.R script. For more information about the original dataset, see the activity_labels.txt, features_info.txt and README.txt files in the UCI HAR Dataset folder. 

Eight original data files were used. They are:
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample.
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample.

Features are normalized and bounded within [-1,1] and Each feature vector is a row on the text file.

Totally 66 measurement variables were included in the tidy data. These variables include time domain signals (prefix 't' to denote time) and frequency domain signals (prefix 'f' to denote frequency). These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Since only the mean and standard deviation are used for later analysis, only the variables whose name include mean() or std() were selected. The new name of the 66 selected variables follows the format of signaltypeMeasurementAxis.

The tidy dataset include 69 variables totally which are listed below:

VariableNumber	VariableName	Type	    Description 

1	        tBodyAccMeanX	Numeric	The mean value of the time domain signal of the body acceleration on the X axis

2			    tBodyAccMeanY	Numeric	The mean value of the time domain signal of the body acceleration on the Y axis

3				  tBodyAccMeanZ	Numeric	The mean value of the time domain signal of the body acceleration on the Z axis

4				  tBodyAccStdX	Numeric	The standard deviation value of the time domain signal of the body acceleration on the X axis

5				  tBodyAccStdY	Numeric	The standard deviation value of the time domain signal of the body acceleration on the Y axis

6				  tBodyAccStdZ	Numeric	The standard deviation value of the time domain signal of the body acceleration on the Z axis

7				  tGravityAccMeanX	Numeric	The mean value of the time domain signal of the gravity acceleration on the X axis

8				  tGravityAccMeanY	Numeric	The mean value of the time domain signal of the gravity acceleration on the Y axis

9				  tGravityAccMeanZ	Numeric	The mean value of the time domain signal of the gravity acceleration on the Z axis

10	tGravityAccStdX	Numeric	The standard deviation value of the time domain signal of the gravity acceleration on the X axis

11	tGravityAccStdY	Numeric	The standard deviation value of the time domain signal of the gravity acceleration on the Y axis

12	tGravityAccStdZ	Numeric	The standard deviation value of the time domain signal of the gravity acceleration on the Z axis

13				  tBodyAccJerkMeanX	Numeric	The mean value of the time domain Jerk signal of the body acceleration on the X axis

14				  tBodyAccJerkMeanY	Numeric	The mean value of the time domain Jerk signal of the body acceleration on the Y axis

15				  tBodyAccJerkMeanZ	Numeric	The mean value of the time domain Jerk signal of the body acceleration on the Z axis

16	tBodyAccJerkStdX	Numeric	The standard deviation value of the time domain Jerk signal of the body acceleration on the X axis

17	tBodyAccJerkStdY	Numeric	The standard deviation value of the time domain Jerk signal of the body acceleration on the Y axis

18	tBodyAccJerkStdZ	Numeric	The standard deviation value of the time domain Jerk signal of the body acceleration on the Z axis

19				  tBodyGyroMeanX	Numeric	The mean value of the time domain signal from the gyroscope on the X axis

20				  tBodyGyroMeanY	Numeric	The mean value of the time domain signal from the gyroscope on the Y axis

21				  tBodyGyroMeanZ	Numeric	The mean value of the time domain signal from the gyroscope on the Z axis

22				  tBodyGyroStdX	Numeric	The standard deviation value of the time domain signal from the gyroscope on the X axis

23				  tBodyGyroStdY	Numeric	The standard deviation value of the time domain signal from the gyroscope on the Y axis

24				  tBodyGyroStdZ	Numeric	The standard deviation value of the time domain signal from the gyroscope on the Z axis

25				  tBodyGyroJerkMeanX	Numeric	The mean value of the time domain Jerk signal from the gyroscope on the X axis

26				  tBodyGyroJerkMeanY	Numeric	The mean value of the time domain Jerk signal from the gyroscope on the Y axis

27				  tBodyGyroJerkMeanZ	Numeric	The mean value of the time domain Jerk signal from the gyroscope on the Z axis

28				  tBodyGyroJerkStdX	Numeric	The standard deviation value of the time domain Jerk signal from the gyroscope on the X axis

29				  tBodyGyroJerkStdY	Numeric	The standard deviation value of the time domain Jerk signal from the gyroscope on the Y axis

30				  tBodyGyroJerkStdZ	Numeric	The standard deviation value of the time domain Jerk signal from the gyroscope on the Z axis

31				  tBodyAccMagMean	Numeric	The mean value of the magnitude of the time domain signal of the body acceleration

32				  tBodyAccMagStd	Numeric	The standard deviation value of the magnitude of the time domain signal of the body acceleration

33				  tGravityAccMagMean	Numeric	The mean value of the magnitude of the time domain signal of the gravity acceleration

34				  tGravityAccMagStd	Numeric	The standard deviation value of the magnitude of the time domain signal of gravity acceleration

35			tBodyAccJerkMagMean	Numeric The mean value of the magnitude of the time domain Jerk signal of the body acceleration

36			tBodyAccJerkMagStd	Numeric	The standard deviation value of the magnitude of the time domain Jerk signal of the body acceleration

37				  tBodyGyroMagMean	Numeric	The mean value of the magnitude of the time domain signal from the gyroscope

38				  tBodyGyroMagStd	Numeric	The standard deviation value of the magnitude of the time domain signal from the gyroscope

39				  tBodyGyroJerkMagMean	Numeric	The mean value of the magnitude of the time domain Jerk signal from the gyroscope

40				  tBodyGyroJerkMagStd	Numeric	The standard deviation value of the magnitude of the time domain Jerk signal from the gyroscope

41	       fBodyAccMeanX	Numeric	The mean value of the frequency domain signal of the body acceleration on the X axis

42				  fBodyAccMeanY	Numeric	The mean value of the frequency domain signal of the body acceleration on the Y axis

43				  fBodyAccMeanZ	Numeric	The mean value of the frequency domain signal of the body acceleration on the Z axis

44	fBodyAccStdX	Numeric	The standard deviation value of the frequency domain signal of the body acceleration on the X axis

45	fBodyAccStdY	Numeric	The standard deviation value of the frequency domain signal of the body acceleration on the Y axis

46	fBodyAccStdZ	Numeric	The standard deviation value of the frequency domain signal of the body acceleration on the Z axis

47	fBodyAccJerkMeanX	Numeric	The mean value of the frequency domain Jerk signal of the body acceleration on the X axis

48	fBodyAccJerkMeanY	Numeric	The mean value of the frequency domain Jerk signal of the body acceleration on the Y axis 

49	fBodyAccJerkMeanZ	Numeric	The mean value of the frequency domain Jerk signal of the body acceleration on the Z axis

50				  fBodyAccJerkStdX	Numeric	The standard deviation value of the frequency domain Jerk signal of the body acceleration on the X axis

51				  fBodyAccJerkStdY	Numeric	The standard deviation value of the frequency domain Jerk signal of the body acceleration on the Y axis

52				  fBodyAccJerkStdZ	Numeric	The standard deviation value of the frequency domain Jerk signal of the body acceleration on the Z axis

53				  fBodyGyroMeanX	Numeric	The mean value of the frequency domain signal from the gyroscope on the X axis

54				  fBodyGyroMeanY	Numeric	The mean value of the frequency domain signal from the gyroscope on the Y axis

55				  fBodyGyroMeanZ	Numeric	The mean value of the frequency domain signal from the gyroscope on the Z axis

56		fBodyGyroStdX	Numeric	The standard deviation value of the frequency domain signal from the gyroscope on the X axis

57		fBodyGyroStdY	Numeric	The standard deviation value of the frequency domain signal from the gyroscope on the Y axis

58		fBodyGyroStdZ	Numeric	The standard deviation value of the frequency domain signal from the gyroscope on the Z axis

59	 			  fBodyAccMagMean	Numeric	The mean value of the magnitude of the frequency domain signal of the body acceleration

60				  fBodyAccMagStd	Numeric	The standard deviation value of the magnitude of the frequency domain signal of body acceleration

61	     			  fBodyAccJerkMagMean	Numeric	The mean value of the magnitude of the frequency domain Jerk signal of the body acceleration

62	fBodyAccJerkMagStd	Numeric	The standard deviation value of the magnitude of the frequency domain Jerk signal of the body acceleration

63	 			  fBodyGyroMagMean	Numeric	The mean value of the magnitude of the frequency domain signal from the gyroscope

64	fBodyGyroMagStd	Numeric	The standard deviation value of the magnitude of the frequency domain signal from the gyroscope

65	fBodyGyroJerkMagMean	Numeric	The mean value of the magnitude of the frequency domain Jerk signal from the gyroscope

66	fBodyGyroJerkMagStd	Numeric	The standard deviation value of the magnitude of the frequency domain Jerk signal from the gyroscope

67	SubjectID	Factor	The ID number of participating subject

68	activitySymbol	Factor	The numeric number of each activity 

69	activityLabel	Character	The text label of each activity
   
For detailed information of the variables, see features_info.txt and README.txt file in the UCI HAR Dataset folder. 
