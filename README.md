
Getting and Cleaning Data Course Project
==================================================================

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data from provided datasets that can be used for later analysis. 

The following files are from the original dataset and were used in the creation of the tidy dataset:
=========================================
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

In order to create the tidy data the following steps were taken.
=========================================
- Merge the X_test and X_train datasets to form a new set named data.
- Merge the Y_test and Y_train datasets to form a labels dataset.
- Merge the subject_test and subject_train datasets to form a subjects dataset.
- Merge the newly created sets to create one dataset - mergeddata.
- Extract only the measurements on the mean and standard deviation for each measurement. 
- Use descriptive activity names to name the activities in the data set. (Replaced the activity code with actual activity names from activities labels file.
- Add appropriate labels for activity, subject and features.
- Set all titles to be lowercase.
- Create an independent tidy data set with the average of each variable for each activity and each subject.

Produce tidydataset
=========================================
- The UCI HAR Dataset needs be saved to the users working directory.
- run_anlaysis.R will produce tidydataset.txt

Notes: 
======
- A list and definition of field names can be found in the codebook.