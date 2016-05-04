library(xlsx)
library(caret)

# load file from data folder
# original data available at http://archive.ics.uci.edu/ml/datasets/Combined+Cycle+Power+Plant
data <- read.xlsx2("./data/Folds5x2_pp.xlsx",1,colClasses = c("numeric","numeric","numeric","numeric","numeric"))

# fit 3 fast models (longer training not working with shiny.io basic plan)
lmFit <- train(PE ~.,data=data,method="lm",preProc=c("center","scale"))
dtFit <- train(PE ~.,data=data,method="rpart",preProc=c("center","scale"))
glmFit  <- train(PE ~.,data=data,method="glm",preProc=c("center","scale"))

# prediction function
# receives the value for each 4 attributes
# returns a dataframe with the name and prediction for each model
pred_data <- function(temp, vac, press, humid ) {
  dfTest<-data.frame(AT=temp,V=vac,AP=press,RH=humid)
  lmPred <- predict(lmFit,dfTest)
  dtPred <- predict(dtFit,dfTest)
  glmPred <- predict(glmFit,dfTest)
  # return a dataframe with all 3 result
  res<- data.frame(method="lm",value=lmPred)
  res<-rbind(res,data.frame(method="dt",value=dtPred))
  res<-rbind(res,data.frame(method="glm",value=glmPred))
  res
}








