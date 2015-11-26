# Machine Learning Project

trainURL <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
testURL <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"

traindest <- "train.csv"
download.file(trainURL, traindest, method = "curl")    
traindata <- read.csv(traindest, sep = ",")

testdest <- "test.csv"
download.file(testURL, testdest, method = "curl")    
testdata <- read.csv(testdest, sep = ",")

library(caret)
library(AppliedPredictiveModeling)
library(rattle)
library(rpart.plot)


Fit <- train(classe ~ .,method="rpart",data=traindata)
fancyRpartPlot(Fit$finalModel)

FitX <- train(classe ~ X,method="rpart",data=traindata)

predict(FitX, testdata)


set.seed(1235)


kMeans2 <- kmeans(subset(traindata,select=-c(classe)),centers=5)
traindata$clusters <- as.factor(kMeans1$cluster)
qplot(Petal.Width,Petal.Length,colour=clusters,data=training)



modelFit <- train(classe ~ .,data=traindata, method="glm")
modelFit$finalModel
predictions <- predict(Fit,newdata=testdata)
predictions
confusionMatrix(predictions,testing$type)


## All done - spit out results
answers = rep("A", 20)

pml_write_files = function(x){
  n = length(x)
  for(i in 1:n){
    filename = paste0("problem_id_",i,".txt")
    write.table(x[i],file=filename,quote=FALSE,row.names=FALSE,col.names=FALSE)
  }
}

pml_write_files(answers)
