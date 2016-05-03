# UI file for Coursera's DDP final assignment
# Combined Cycle Power Plant Data Set 

shinyUI(fluidPage(
  titlePanel(" Combined Cycle Power Plant Prediction"),
  sidebarLayout(
    sidebarPanel(
      helpText("Input data to predict Net hourly electrical energy output"),
      sliderInput("temperature", 
                  label = "Temperature (Celsius degrees)",
                  min = 1.81, max = 37.11, value = 20.00, round=-2,step=0.01,ticks=TRUE),
      sliderInput("pressure", 
                  label = " Ambient Pressure (Milibars)",
                  min = 992.89, max =1033.30, value = 1000, round=-2,step=0.01,ticks=TRUE),
      sliderInput("humidity", 
                  label = "Relative humidity (%)",
                  min = 25.56, max =100, value = 50, round=-2,step=0.01,ticks=TRUE),
      sliderInput("vacuum", 
                  label = "Exhaust Vacuum (cmHg)",
                  min = 25.36, max =81.56, value = 40, round=-2,step=0.01,ticks=TRUE)
      
    ),
      mainPanel(
        p(textOutput("h2(meanVal")),
        plotOutput("predPlot"))
  )
)
)