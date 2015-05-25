#"Getting and Cleaning Data" project


This file explains the functioning of the analysis performed by the script 
*run_analysis.R*. The raw data for the project can be obtained here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

This data is related with multiple measurements taken with a Samsung Galaxy S 
smartphone, in the context of a study on wearable devices. A full description can 
be found here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


The main steps of the script are the following (I suggest to read the code 
*run_analysis.R* side-to-side with this text):

0. Prerequisites: 
    * The raw data must be loaded in the working directory in a folder called *raw_data*
    * The library *dplyr* must be installed

1. First the training and test sets are merged. Specifically the script creates 
3 tables called *merged.subject*, *merged.label* and *merged.set*, in which the 
data corresponding to the subject id, the activity label and the features being 
measured from the training and test sets are combined. This 3 tables will be merged 
later on in a single object.

2. The raw names of all the features are stored in a table called *features*. 
Those containing the strings *mean()* or *std()* are identified and used to 
affect a new value to *merged.set* in which only the features containing these 
string are taken into account. 
*Note: It is my understanding that this is what it was asked. In particular, I'm 
ignoring some features containing the string "mean", such us "fBodyAcc-meanFreq()-X".* 

3. Raw activity names are taken from the file *activity_labels.txt*. They are 
formatted following my personal taste and used to create a data frame 
called *merged.activity*. This object plays the same role as *merged.label* 
(identifying the activity being recorded) but in a human-readable manner.

4. The goal of this step is to combine all the data (subjects + activities + features) 
in a unique tidy object called *merged.data*. Before doing so we need to assign 
descriptive names to the variables. The names corresponding to the subjects and 
the activities are straightforward. The names concerning the features need  
more processing in my view. I use the function *gsub* to obtain more readable 
names for the features and I adopt the period.separation convention 
(see http://journal.r-project.org/archive/2012-2/RJournal_2012-2_Baaaath.pdf). 
The particular transformations that I apply are motivated by the description of 
the features that were provided in the raw file "features_info.txt". Once all 
the variable names have been assigned, we create the object *merged.data* containing 
all the tidy information.

5. We use the powerful library *dplyr* to easily summarize the information 
contained in *merged.data* as requested. Concretely, for each combination 
subject-activity we compute the mean of each variable and we store it in 
the object *summary*. Finally this object is exported to the file *data_summary.txt*.




