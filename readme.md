#  Combined Cycle Power Plant Energy Output Prediction

## Introduction

This application uses the  Combined Cycle Power Plant Data Set  available at [the UCI web site](http://archive.ics.uci.edu/ml/datasets/Combined+Cycle+Power+Plant).

It displays the predicted amount of power provided by 3 machine learning algorithms : linear regression, random forests and generalized linear model. Other models could be added to the resulting graph but shiny.io puts a strong constraint on calculation resources for deployment, at least on the basic plan.

## How to use

At the very first launch, wait for the graph to display (the main panel is blank while the models are calculated)

Once the graph is loaded wit the default values, you can change the values for each 4 predictors by using the sliders. The graph and the mean value will update accordingly.

The predictors are:

- Temperature (T) in the range 1.81°C and 37.11°C,
- Ambient Pressure (AP) in the range 992.89-1033.30 milibar,
- Relative Humidity (RH) in the range 25.56% to 100.16%
- Exhaust Vacuum (V) in teh range 25.36-81.56 cm Hg

## Results display

The predicted Net hourly electrical energy output (EP) should be between 420.26 and 495.76 MW. 
The value for each prediction is displayed on the graph on the main panel. 
The mean predicted value is displayed as title and drawn as a dotted line in the graph

## About this documentation

This documentation is written in a readme.md markdown file and displayed automatically by using the *DisplayMode: Showcase* attribute in the DESCRIPTION file of the project.