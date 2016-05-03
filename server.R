source("prediction.R") #model generation and prediction function

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

  dataPred <- reactive({
    pred_data(input$temperature,input$vacuum,input$pressure,input$humidity)
  })
  
  output$meanVal <- renderText({
    paste("The mean predicted value is: ",round(mean(dataPred()$value),digits=2), " MW")
  })


  output$predPlot <- renderPlot({
    g <- ggplot(dataPred(),aes(x=method,y=value))
    g + geom_bar(stat="identity") + 
      coord_cartesian(ylim=c(400, 500)) +
      geom_hline(yintercept=mean(dataPred()$value),linetype="dotted") +
      ggtitle("Predicted power output according to prediction models")

  })

})
