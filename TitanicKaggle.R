setwd("~/GitHub/Titanic-Kaggle")

titanic.train <- read.csv(file = "train.csv", stringsAsFactors = FALSE, header = TRUE)
titanic.test <- read.csv(file = "test.csv",stringsAsFactors = FALSE, header = TRUE)

#combining both datasets
#first adding a new feature to differentiate between both dataset before combining
titanic.train$IsTrainSet <- TRUE
titanic.test$IsTrainSet <- FALSE

# adding survived column to the test set
titanic.test$Survived<- NA

#Joining the two datasets to clean together
titanic.full <- rbind(titanic.train,titanic.test)

#filling the missing string in embarked with mode of the titanic.full
titanic.full[titanic.full$Embarked == '',"Embarked"] <- 'S'

#getting the median and filling the missing value with the median
age.median <- median(titanic.full$Age,na.rm = TRUE)
titanic.full[is.na(titanic.full$Age),"Age"]<- age.median

#getting the median and filling the missing value for fare
Fare.median <- median(titanic.full$Fare,na.rm = TRUE)
titanic.full[is.na(titanic.full$Fare),"Fare"]<-Fare.median


#categoriacal casting
titanic.full$Pclass <- as.factor(titanic.full$Pclass)
titanic.full$Sex <- as.factor(titanic.full$Sex)
titanic.full$Embarked <- as.factor(titanic.full$Embarked)

#splitting dataset back into test and train after cleaning it
titanic.train <- titanic.full[titanic.full$IsTrainSet == TRUE,]
titanic.test <- titanic.full[titanic.full$IsTrainSet == FALSE,]

titanic.train$Survived <- as.factor(titanic.train$Survived)

