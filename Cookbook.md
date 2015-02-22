# Introduction

 R Script `run_analysis.R`performs following data analysis based on project requirement.

* 1. All related data is merged using the `rbind()` function. 
* 2. Extract the columns only with the mean and standard deviation measures are taken from the dataset.
* 3. Uses descriptive activity names to name the activities in the data set. Take the activity names and IDs from `activity_labels.txt` and they are substituted in the dataset.
* 4. Appropriately labels the data set with descriptive variable names. 
* 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. The output file is called `tidy.txt`, and uploaded to this repository.

# Variables

* `training_x`, `training_y`, `testing_x`, `testing_y`, `training_sub` and `testing_sub` contain the data from the downloaded files.
* `data_x`, `data_y` and `data_sub` merge the previous datasets to further analysis.
* `features` contains the correct names for the `data_x` dataset, which are applied to the column names stored in `MeanSdFeatures`, a numeric vector used to extract the desired data.
* A similar approach is taken with activity names through the `activities` variable.
* `MergedData` merges `data_x`, `data_y` and `data_sub` in a big dataset.
* Finally, `tidydata` contains the relevant averages which will be later stored in a `.txt` file.
