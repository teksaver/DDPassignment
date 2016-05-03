library(xlsx)
library(caret)


data <- read.xlsx2("./data/Folds5x2_pp.xlsx",1,colClasses = c("numeric","numeric","numeric","numeric","numeric"))
#data <- read.csv("./data/Folds5x2_pp.csv")

lmFit <- train(PE ~.,data=data,method="lm",preProc=c("center","scale"))
dtFit <- train(PE ~.,data=data,method="rpart",preProc=c("center","scale"))
rfFit  <- lmFit #<- train(PE ~.,data=data,method="rf",preProc=c("center","scale"))
gbmFit <- dtFit #train(PE ~.,data=data,method="gbm",preProc=c("center","scale"))


pred_data <- function(temp, vac, press, humid ) {
  dfTest<-data.frame(AT=temp,V=vac,AP=press,RH=humid)
  lmPred <- predict(lmFit,dfTest)
  dtPred <- predict(dtFit,dfTest)
  rfPred <- predict(rfFit,dfTest)
  gbmPred <- predict(gbmFit,dfTest)
  # return a dataframe with all 3 result
  res<- data.frame(method="lm",value=lmPred)
  res<-rbind(res,data.frame(method="dt",value=dtPred))
  res<-rbind(res,data.frame(method="rf",value=rfPred))
  res<-rbind(res,data.frame(method="gbm",value=gbmPred))
  res
}

#mean(pred_data(15,50,1000,60)$value)







