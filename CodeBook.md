activity_labels : store the data that is read from activity_labels.txt.                   
features        : store the data that is read from features.txt.                          
datacolnames    : store the colnames of data set.The colnames is extracted from varible features.                  
subject_train   : store the data that is read from subject_train.txt.   
X_train         : store the data that is read from X_train.txt.         
y_train         : store the data that is read from y_train.txt.         
training        : gether X_train, y_train and subject_train, and store the data in varible training.        
subject_test    : store the data that is read from subject_test.txt.                      
X_test          : store the data that is read from X_test.txt.          
y_test          : store the data that is read from y_test.txt.          
test            : gether X_test, y_test and subject_test, and store the data in varible test.               
mergedata       : this is the result of question 1. Merges the training and the test, and save the data in varible mergedata. 
extractsdata    : this is the result of question 2. Extracts only the measurements on the mean and standard deviation 
                  for each measurement, and save the data in varible extactsdata.         
newnames        : store the colnames of extractsdata.It is extracted from varible datacolnames.Then accomplish question 3
                  and question 4 and the result is still stored in varible extractsdata.                    
second          : this is the result of question 5. It's used to store the average of each variable for each activity 
                  and each subject. And finally, this variable is writted into a file named "average.txt".                    

