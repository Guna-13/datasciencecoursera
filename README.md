## README

### Execution of the R script

* Download the zip file "getdata-projectfiles-UCI HAR Dataset.zip"
from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
into: your working directory.

* Source "run_analysis.R" to execute the analysis
See "Script description" to see what the script do with the original data.


### Script description

Input:
* The zip file -see above- "getdata-projectfiles-UCI HAR Dataset.zip" 

Output:
* A text file with the name "tidy_data.txt" in table format

Processing:
1. The script unzips the input file. 
2. It processes its data.
3. It writes the results of the processing in a text file.

The processing of the data is made in 5 steps. 

#### 1. Merge files

Input: 
* All the files in the previous list

Output: 
* The features for which we have measurements
* The activity names
* The activities each subject -person- carried out
* The subjects 
* The measurements for each subject and activity

Processing:
* All the files from the previous list are read. 
* The ones with the same structure and similar content are merge together.

#### 2.	Extract measurements

Input: 
* The measurements
* The features for the measurements

Output: 
* The means and standard deviations measurements

Processing:
The features which contain the mean and the standard deviation are extract.

#### 3. Activity names

Input: 
* The activities each subject -person- carried out 
* The activity names

Output: 
* The activities each subject -person- carried out, with the corresponding activity name

Processing:
* Each activity each subject did gets its corresponding activity name. 
* It was taken care to keep the order of the input.

#### 4. Variables labels

Input: 
* The data.frame with means and standard deviations measurements
* The features for which we have measurements

Output: 
* The data.frame with the features as variable names

Processing:
* The names for the variables are selected and prepared.

#### 5. Create averages

Input: 
* The activities each subject -person- carried out, with the corresponding activity name
* The subjects
* The means and standard deviations measurements with the features as variable names

Output: 
* The means and standard deviations measurements along with the activity and 
the subject for which the measurements correspond

Processing:
* The measurements, the subjects and the activities are linked together.
* For the resulting data the measurements are averaged per subject and activity.


