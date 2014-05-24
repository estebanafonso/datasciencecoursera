Getting and Cleaning Data Peer Assessment Assignment
============

The script runAnalysis.R processes smartphone data for individuals performing various tasks according to the instructions in Coursera's Cleaning and Getting Data Peer Assessment assignment.

The processing steps are as follows.

For testing and training datasets:

1.  Read in features dataset.
2.  Create a boolean by "greping" for variables with mean or std (standard deviation) in their name.
3.  Read in primary dataset.
4.  Select variables according to boolean in step 2.
5.  Read in activity labels and activity values.
6.  Substitute activity labels (ie running, walking) for activity values (ie 1, 2)
7.  Read in identification dataset.
8.  Merge identification values, activity label values with main dataset.

Final processing.

1.  Stack processed testing and training datasets.
2.  Calculate mean values of variables with data grouped by activity and individual.
3.  Write final "tidy" dataset out to a csv file "tidy_data.txt"

Estebans changes.