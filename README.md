
## SOURCE CODE

Source code is documented

Data files are uncompressed with original structure creating 'UCI HAR Dataset' directory inside the project.
Project is working directory.
So, to load files they are referenced as './UCI HAR Dataset/THE_FILE'

Main blocks of process:

* Load Features
  * Filter Features to get only std and mean variables
* Load Activity Names
* Load Subject Data 
  * Merge train and test data
  * Rename columns with descriptions
* Load Activity Data 
  * Merge train and test data
  * Join with Activity Names
  * Rename columns with descriptions
* Load Main Data 
  * Merge train and test data
  * Filter data to get only std and mean variables
  * Rename columns with descriptions
* Join all the data
* Generate average table