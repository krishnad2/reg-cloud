shinyServer(function(input, output) {
  #This function is repsonsible for loading in the selected file
  filedata <- reactive({
    infile <- input$datafile
    if (is.null(infile)) {
      # User has not uploaded a file yet
      return(NULL)
    }
    df<-read.csv(infile$datapath)
  })
  
  #The following set of functions populate the column selectors
  output$depvar <- renderUI({
    df <-filedata()
    if (is.null(df)) return(NULL)
    items=names(df)
    names(items)=items
    selectInput("dvar", "Dependent Variable",items)
    # selectInput("columns", "Dependent Variable",items)
    
  })
  
  output$indepvar <- renderUI({
    df <-filedata()
    if (is.null(df)) return(NULL)
    
    items=names(df)
    names(items)=items
    checkboxGroupInput("indvar","Independent Variables",selected = TRUE,items)
  })
  filedata1 <- reactive({
    infile1 <- input$datafile1
    if (is.null(infile1)) {
      # User has not uploaded a file yet
      return(NULL)
    }
    read.csv(infile1$datapath)
  })
  
  regfit <- reactive({
    df<-data.frame(filedata())
    nam<-names(df[,input$indvar])
    iv<-as.matrix(df[,input$indvar])
    colnames(iv)<-nam
    dv<-as.matrix(df[,input$dvar])
    res<-lm(dv~iv)
    res
  })
#  output$dvar<-renderPrint({
#    df<-data.frame(filedata())
#    iv<-as.matrix(df[,input$indvar])
 #   colnames(dv)<-c("y")
 #   iv
 # }) 
#  output$ivar<-renderPrint({
 #   df<-data.frame(filedata())
#    dv<-as.matrix(df[,input$indvar],length(df),4)
 #   colnames(dv)<-c("y")
#    dv
 # }) 
  
  
  #This previews the CSV data file
  output$filetable <- renderTable({
    df<-data.frame(filedata())
    df
  })
  output$sumout <- renderPrint({
     df<-filedata()
     df<-data.frame(filedata())
    summary(df)
  })
  
  output$regout <- renderPrint({
    s<-regfit()
    summary(s)
   })
  output$predout <- renderPrint({
    s<-regfit()
    df<-data.frame(filedata())
    dv<-dv<-as.matrix(df[,input$dvar])
    prd<-predict(s,df)
    prdres<-data.frame("Actual y"=dv,"Predicted Y"=prd, "Residuals"=dv-prd)
    prdres
  })
  output$filetable1 <- renderTable({
    df1<-data.frame(filedata1())
    df1
  })
    output$prednewout <- renderPrint({
    res <- regfit()
    n<-length(res$coefficients)
    df1<-filedata1()
    newdf<-data.frame(df1)
    n1<-ncol(df1)
    prd1<-res$coefficients[1]+as.matrix(df1[,1:n1]) %*% res$coefficients[2:n]
    prednewdf<-data.frame("New Data"=newdf,"Prediction"=prd1)
    prednewdf
 })
    
  output$plot <- renderPlot({
    res <- regfit()
    par(mfrow=c(2,2))
    plot(res)
  })
})