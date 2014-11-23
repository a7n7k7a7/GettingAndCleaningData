##Human Activity Recognition Using Smartphones Dataset - tidy data
###Tidy data

The repo includes following files:
* README.md
* run_analysis.R
* CodeBook.md
* tidy_data.txt

The run_analysis.r file can be used to produce tidy_data.txt file from the oryginal dataset obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip . In order to run the run_analysis.R file the structure under the original zip file should not be changed and the "UCI HAR Dataset" folder should be placed in the working directory. The script will produce tidy dataset in .txt format. The tidy_data.txt file will be saved in working directory

In order to read the tidy_data.txt dataset into R use:

	data <- read.table("tidy_data.txt", header = TRUE, sep = " ")
	View(data)

The CodeBook.md provides all the information about the data and the transformation of data, which were made in order to produce tidy_data.txt from the raw data.

###Brief description of what the script does:
* firstly all the raw data are read into R
* thenr datasets are merged and the columns of the merged dataset are named properly
* then the activities are named with their descriptive names
* in the next step only the columns with mean and standard deviation are picked from the merged dataset
* then mean is calculated for each varible for each subject and activity
* later the additional dots in the column names are removed
* at the end the final dataset is saved in the tidy_data.txt file in the working directory