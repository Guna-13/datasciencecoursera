# Input ---------------------------------------------------------------------

unzip(zipfile="getdata-projectfiles-UCI HAR Dataset.zip", exdir = "PD")


# 1. Merges files -----------------------------------------------------------

features <- read.table("PD/UCI HAR Dataset/features.txt", as.is=2)
activity_labels <- read.table("PD/UCI HAR Dataset/activity_labels.txt")

# Merges activities
PD_activities <- read.table("PD/UCI HAR Dataset/train/y_train.txt")
temp_dataset <- read.table("PD/UCI HAR Dataset/test/y_test.txt")
PD_activities <- rbind(PD_activities, temp_dataset)
rm(temp_dataset)
names(PD_activities)="activity_id"

# Merges subjects (volunteers)
PD_subjects <- read.table("PD/UCI HAR Dataset/train/subject_train.txt")
temp_dataset <- read.table("PD/UCI HAR Dataset/test/subject_test.txt")
PD_subjects <- rbind(PD_subjects, temp_dataset)
rm(temp_dataset)
names(PD_subjects)="subject_id"

# Merges measurements
project_dataset <- read.table("PD/UCI HAR Dataset/train/X_train.txt")
temp_dataset <- read.table("PD/UCI HAR Dataset/test/X_test.txt")
project_dataset <- rbind(project_dataset, temp_dataset)
rm(temp_dataset)


# 2. Extracts measurements --------------------------------------------------

select_var <- grepl("mean\\(\\)", features$V2) | grepl("std\\(\\)", features$V2)
features <- cbind(features, select_var)

select_columns <- features[features$select_var==TRUE,"V1"]
library(dplyr)
project_dataset <- select(project_dataset,select_columns)

rm(select_var)
rm(select_columns)

# 3. Activity names ---------------------------------------------------------

PD_activities <- cbind(activity_order=c(1:nrow(PD_activities)), PD_activities)
PD_activities <- merge(PD_activities, activity_labels, by.x="activity_id", by.y="V1")
PD_activities <- arrange(PD_activities,activity_order)
names(PD_activities)[3] <- "activity"

rm(activity_labels)


# 4. Variable labels --------------------------------------------------------

features$V2 <- make.names(features$V2)
features$V2 <- gsub("\\.\\.", "\\.", features$V2)
features$V2 <- gsub("\\.\\.", "\\.", features$V2)

names(project_dataset) <- features[features$select_var==TRUE,"V2"]

rm(features)


# 5. Create avarages --------------------------------------------------------

# Includes the subjects and the activities in the project dataset
project_dataset <- cbind(PD_activities[3], project_dataset)
project_dataset <- cbind(PD_subjects, project_dataset)

rm(PD_subjects)
rm(PD_activities)

# Calculates the avarages
library(reshape2)
tidy_data <- dcast(melt(project_dataset, id=c("subject_id","activity")), 
                   subject_id+activity ~ variable, 
                   fun.aggregate = mean)

rm(project_dataset)

# Output --------------------------------------------------------------------

write.table(tidy_data,file="tidy_data.txt", row.name=FALSE)
