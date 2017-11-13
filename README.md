# reg-cloud

A shiny app for performing multipple linear regression. When the app is loaded, select the Choose csv File(Original Data).
 Choose the csv file on your system  consisting of dependent variable and independent variables. The file will be uploaded 
 and two select Input boxes appear on the website. Select one  dependent variable and few required independent variables
for which regression analysis is to be performed. Then click the Choose csv File(New Data) and select the csv file containing
the new data for which regression predictions are required. The Summaries Menu option displays  Summary Statistics of all the
variables. Regression Menu displays regression results. Predictions-Data Menu displays the original values and fitted values 
of the dependent variable. New Data Menu displaus the new data being selected for predictions. Predictions (New Data) displays
the predicted values for the New Data. Regression Plots displays the regression plots.
  

## Getting Started

These instructions will get you a copy of the shiny app  up and running on your local machine.

On the R console or in RStudio console give

     library(shiny) 
     runGitHub("reg-cloud","krishnad2")

### Prerequisites


```
shiny package is required for running the app
```


## Authors

* **Dr. Krishna Devulapalli** 
