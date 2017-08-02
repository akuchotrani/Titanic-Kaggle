setwd("~/GitHub/Titanic-Kaggle")

titanic.train <- read.csv(file = "train.csv", stringsAsFactors = FALSE, header = TRUE)
titanic.test <- read.csv(file = "test.csv",stringsAsFactors = FALSE, header = TRUE)