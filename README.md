The R script and Codebook contained within this directory will assist you in cleaning the UCI HAR Dataset 
according to specifications set out in the JHU "Getting and Cleaning Data" Course Project.

This directory contains three files:
README.md - This wonderful file that you are reading. Provides an overview of the purpose of each file in
                  my github assignment directory.
                  
run.analysis.R - performs all tasks specified above. Place file in the top level of the UIC HAR Dataset
                  directory (you should see "train" and "test" directories). Code is exhaustively (and 
                  pedantically) commented and should be self explanatory.
                  
CodeBook.md - Codebook explaining the purpose of each variable. 

Cleaning specifications consists of the following:
  1. Combining test and training data into a complete set, including the addition of 
      appending Subject No. and Activity to said set
  2. Extracting the means and std for each measurement (NB: I included meanFreq measurements but not
      angle calculations)
  3. Substituted number representation in "Activity" with word description
  4. Provided expanded (and more informative) measurement names
  5. Created a second data set ("measurement_averages_by_subject_and_activity.txt") that contains the mean 
      of every variable by subject and activity. A mouthful, but self-explanatory. Code for reading said
      file back into R is provided at the bottom.
      
      
Purpose of Each file:



