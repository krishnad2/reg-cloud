shinyUI(pageWithSidebar(
  headerPanel("CSV File Upload and Regression  Demo"),
  
  sidebarPanel(
    #Selector for file upload
    fileInput('datafile', 'Choose CSV file (Original Data)',
              accept=c('text/csv', 'text/comma-separated-values,text/plain')),
    
  uiOutput("depvar"),
  uiOutput("indepvar"),
  fileInput('datafile1', 'Choose CSV file (New Data)',
              accept=c('text/csv', 'text/comma-separated-values,text/plain')),
  h3("Help to run the App"),
  helpText("First click Browse Button and select the csv file from your system. Once the
           file is uploaded two new select boxes appear. Select only one variable under
           Dependent Variable and two more variaables under Independent Variables. Observe
           the results by clicking each of the Menu Options. Before clicking the last
           three options, first click the Browse Button for selecting New Data to
           upload that file and later click last three Menu options one by one")),
  mainPanel(
    tabsetPanel(type = "tabs", 
                tabPanel("Display Data", tableOutput("filetable")),
                tabPanel("Summaries", verbatimTextOutput("sumout")),
                tabPanel("Regression", verbatimTextOutput("regout")),
                tabPanel("Predictions-Data", verbatimTextOutput("predout")),
                tabPanel("New Data", tableOutput("filetable1")), 
                tabPanel("Predictions-New Data", verbatimTextOutput("prednewout")),
                tabPanel("Regression Plots", plotOutput("plot")))
    )))