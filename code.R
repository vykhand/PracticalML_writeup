
dt <- read.csv("data//pml-training.csv", na.strings=c("#DIV/0!", ""))
na.cols <- as.vector(colSums(is.na(dt))>(nrow(dt)*.95))
dt <- dt[,!na.cols]



dt.test <- read.csv("data//pml-testing.csv", na.strings=c("#DIV/0!", ""))
dt.test <- dt.test[, !na.cols]


library(caret)
library(kernlab)

dt.p <- createDataPartition(y=dt$classe, p=3/4, list=FALSE)
dt.train <- dt[dt.p,]
dt.cv <- dt[-dt.p,]

#tc <- trainControl(method="cv", number=4)
library(randomForest)
fit.rf <- train(classe ~ ., data=dt.train, method = "rf")
