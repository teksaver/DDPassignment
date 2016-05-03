# generate regression models for linear regression, random forrests and gdm
# and import function with prediction results
source("prediction.R")

g <- ggplot(df,aes(method,value))
g + geom_bar(stat="identity") +lims(y=c(0,1000))

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

  dataPred <- reactive({
    pred_data(input$temperature,input$vacuum,input$pressure,input$humidity)
  })
  
  output$meanVal <- renderText({
    paste("The mean predicted value is: ",mean(dataPred()(15,50,1000,60)$value))
  })


  output$predPlot <- renderPlot({
    g <- ggplot(dataPred(),aes(x=method,y=value))
    g + geom_bar(stat="identity") + coord_cartesian(ylim=c(400, 500))
  })

})
