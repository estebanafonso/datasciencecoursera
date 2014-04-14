



# PREPARE TEST DATASET

# Read in features dataset
features = read.table("features.txt",strip.white=TRUE,sep="  ")

# Create boolean to keep variables that contain "mean" or "std"
keep_features = grepl("mean|std",features$V2)

# Read in test data
X_test = read.table("test/X_test.txt")

# Only keep select variables
X_test = X_test[,keep_features]

#  Assign column names
colnames(X_test) <- features$V2[keep_features]

# Read in activity labels
activity_labels = read.table("activity_labels.txt",strip.white=TRUE,sep=" ")

# Read in activity variables
y_test = read.table("test/y_test.txt")

# Read in identifier variable and call variable "ID"
identifier_test = read.table("test/subject_test.txt")
colnames(identifier_test) = c("ID")

# Attach activity label variable to main dataset
X_test$activity_label= activity_labels[y_test$V1,2]

#Attach idenitifier variable to main dataset
X_test$ID= identifier_test$ID



# PREPARE TRAINING DATASET

# Read in test data
X_train = read.table("train/X_train.txt")

# Only keep select variables
X_train = X_train[,keep_features]

# Assign column names
colnames(X_train) <- features$V2[keep_features]

# Read in activity variables
y_train = read.table("train/y_train.txt")

# Read in identifier variable and call variable "ID"
identifier_train = read.table("train/subject_train.txt")
colnames(identifier_train) = c("ID")

# Read in activity labels
X_train$activity_label= activity_labels[y_train$V1,2]

# Read in activity variables
X_train$ID= identifier_train$ID

# FINAL PROCESSING

# Stack training and testing datasets
complete = rbind(X_train, X_test)

# Calculate means by ID and activity label
tidy_table = ddply(complete, c("ID","activity_label"), colwise(mean))

# Write out dataset
write.csv(tidy_table, "tidy_table.csv")
