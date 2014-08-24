library(plyr)
# Data files are uncompressed with original structure creating
# UCI HAR Dataset directory

# FEATURES
dfe <- read.table("./UCI HAR Dataset/features.txt")

# select only features that are mean or std
# in features_info.txt they are idetified as:
# mean(): Mean value
# std(): Standard deviation

dfe <- subset( dfe, grepl("(std|mean)\\(\\)",V2)) 
feature_column_id <- paste("V",dfe$V1,sep="") # get id columns like V1,V3, etc...

# ACTIVITY NAMES
dan <- read.table("./UCI HAR Dataset/activity_labels.txt")

# ACTIVITY DATA
dy1 <- read.table("./UCI HAR Dataset/test/y_test.txt")
dy2 <- read.table("./UCI HAR Dataset/train/y_train.txt")
dyt <- rbind(dy1,dy2) # merge test and train data
#JOIN WITH ACTIVITY NAMES
dyt <- join(dyt,dan, by="V1")
dyt$ID <- rownames(dyt) #add rowname as ID column
names(dyt)[names(dyt)=="V2"] <- "ACTIVITY" #change name of column to ACTIVITY
dyt <- dyt[,c("ID","ACTIVITY")] #leave only 2 columns

# MAIN DATA
dx1 <- read.table("./UCI HAR Dataset/test/X_test.txt")
dx2 <- read.table("./UCI HAR Dataset/train/X_train.txt")
dxt <- rbind(dx1,dx2) # merge test and train data
#Filter data to get only mean/std columns
dxt<- dxt[,feature_column_id]
colnames(dxt) <- dfe$V2 #rename columns to descriptions
dxt$ID <- rownames(dxt) #add rowname as ID column

dt <- join(dxt,dyt,by="ID")
names(dt)[names(dt)=="V2"] <- "ACTIVITY" #change name of column to ACTIVITY

#DT HAS ALL THE DATA

#STEP 5 
#Creates a second, independent tidy data set with the average of each variable for each activity and each subject