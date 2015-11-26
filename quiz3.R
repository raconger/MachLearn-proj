library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)

set.seed(125)

inTrain <- createDataPartition(y=segmentationOriginal$Case,
                               , list=FALSE)
training <- segmentationOriginal[inTrain,]
testing <- segmentationOriginal[-inTrain,]

modFit <- train(Case~ .,data=training,method="rpart",prox=TRUE)

library(rpart)

fit <- train(Case~ ., data=training, method = 'rpart')
fancyRpartPlot(fit$finalModel)

##########
  
  library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)


myData<-segmentationOriginal

set.seed(125)
trainData<-myData[myData$Case=="Train",]

#testData<-trainData<-myData[myData$Case=="Test",]


cartModel <- train(Class ~ ., data=trainData, method="rpart")
cartModel$finalModel

plot(cartModel$finalModel, uniform=T) 
text(cartModel$finalModel, cex=0.8)
fancyRpartPlot(cartModel$finalModel)

###########
library(pgmm)
data(olive)
olive = olive[,-1]

oliveModel <- train(Area ~ ., data=olive, method="rpart")
fancyRpartPlot(oliveModel$finalModel)
newdata = as.data.frame(t(colMeans(olive)))

###########
library(ElemStatLearn)
data(SAheart)
set.seed(8484)
train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]

set.seed(13234)

fitModel <- train(chd ~ age + alcohol + obesity + tobacco + typea + ldl, data=SAheart, method="glm", family = "binomial")
predictions <- predict(fitModel,newdata=testSA)
missClass = function(testSA,predictions){sum(((predictions > 0.5)*1) != testSA)/length(testSA)}
missClass
missClass = function(values,prediction){sum(((prediction > 0.5)*1) != values)/length(values)}
missClass(testSA$chd,predictions)

predictions <- predict(fitModel,newdata=trainSA)

missClass(trainSA$chd,predictions)
