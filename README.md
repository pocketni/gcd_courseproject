The R script and Codebook contained within this directory will assist you in cleaning the UCI HAR Dataset 
according to specifications set out in the JHU "Getting and Cleaning Data" Course Project.

This directory contains:
----
1. README.md - This wonderful file that you are reading. Provides an overview of the purpose of each file in
                  my github assignment directory.
                  
2. run.analysis.R - performs all tasks specified above. Place file in the top level of the UIC HAR Dataset
                  directory (you should see "train" and "test" directories). Code is exhaustively (and 
                  pedantically) commented and should be self explanatory.
                  
3. CodeBook.md - Codebook explaining the purpose of each variable. 

Cleaning specifications:
----
  1. Combining test and training data into a complete set, including the addition of 
      appending Subject No. and Activity to said set
                  a. cbind subject numbers, x and y together in training and test sets
                  b. rbind training and test sets together
                  c. extracted Activity names (walking, walking upstairs, etc) into a data frame for step 3
                  
  2. Extracting the means and std for each measurement by using grep to search for mean or "std".
                (NB: I included meanFreq measurements but not angle calculations. I did this by using dplyr and deleting rows that contained "angle")
                  
  3. Substituted number representation in "Activity" with word description
                replaced y (Activity) with name of said activity with gsub

  4. Provided expanded (and more informative) measurement names. All steps here done with gsub.
                  a. cleaned up BodyBody duplications with gsub
                  b. deleted parentheses.
                  c. deleted all hyphens
                  d. expanded abbreviations "t" and "f" for "time" and "frequency", respectively. Also "Gyro", "Acc" and "Mag" to "gyrometer", "accelerometer" and "magnitude".
                  e. changed everything except orientation (XYZ) to lower case
                  f. added a bunch of periods (not preferred, I know) to make variable labels more readable 

  5. Created a second data set ("measurement_averages_by_subject_and_activity.txt") that contains the mean 
      of every variable by subject and activity. A mouthful, but self-explanatory. Code for reading said
      file back into R is provided at the bottom.
                  a. used the dplyr package here
                  b. use group_by() to subset by subject and also by activity
                  c. provide a mean of each activity (even the std devs) with summarise
                  d. wrote out to the file mentioned above with write.table().
                  
      
