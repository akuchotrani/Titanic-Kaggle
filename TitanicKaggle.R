setwd("~/GitHub/Titanic-Kaggle")

titanic.train <- read.csv(file = "train.csv", stringsAsFactors = FALSE, header = TRUE)
titanic.test <- read.csv(file = "test.csv",stringsAsFactors = FALSE, header = TRUE)

#combining both datasets
#first adding a new feature to differentiate between both dataset before combining
titanic.train$IsTrainSet <- TRUE
titanic.test$IsTrainSet <- FALSE

# adding survived column to the test set
titanic.test$Survived<- NA

#Joining the two datasets
titanic.full <- rbind(titanic.train,titanic.test)

#filling the missing string in embarked with mode of the titanic.full
titanic.full[titanic.full$Embarked == '',"Embarked"] <- 'S'