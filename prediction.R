library(xlsx)
library(caret)


data <- read.xlsx2("./data/Folds5x2_pp.xlsx",1,colClasses = c("numeric","numeric","numeric","numeric","numeric"))

lmFit <- train(PE ~.,data=data,method="lm",preProc=c("center","scale"))
dtFit <- train(PE ~.,data=data,method="rpart",preProc=c("center","scale"))
brFit  <- train(PE ~.,data=data,method="bridge",preProc=c("center","scale"))

pred_data <- function(temp, vac, press, humid ) {
  dfTest<-data.frame(AT=temp,V=vac,AP=press,RH=humid)
  lmPred <- predict(lmFit,dfTest)
  dtPred <- predict(dtFit,dfTest)
  brPred <- predict(brFit,dfTest)
  # return a dataframe with all 3 result
  res<- data.frame(method="lm",value=lmPred)
  res<-rbind(res,data.frame(method="dt",value=dtPred))
  res<-rbind(res,data.frame(method="bridge",value=brPred))
  res
}

#mean(pred_data(15,50,1000,60)$value)







