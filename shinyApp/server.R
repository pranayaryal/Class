library(shiny)

shinyServer(function(input, output) {
  
  uiInput <- reactive({
    switch(input$input_type,
           "One sample Test of Means" = 
             c(numericInput("mean", "Sample Mean",
                            value = 10),
               numericInput("null", "Null Value Mean",
                            value = 10),
               numericInput("sd", "Sample Standard Deviation",
                            value = 10),
               numericInput("size", "Sample Size",
                            value = 10),
               numericInput("alpha", "Alpha",
                            value = 10)),
           
           "Two sample difference of means(equal variance)" = 
             c(numericInput("size1", "sample size 1",
                            value = 35),
               numericInput("size2", "Sample Size 2",
                            value = 40),
               numericInput("sd1", "standard deviation 1",
                            value = 15),
               numericInput("sd2", "Standard deviation 2",
                            value = 15),
               numericInput("diff", "desired difference",
                            value = 5),
               numericInput("mean1", "Sample Mean1",
                            value = 78.2),
               numericInput("mean2", "Sample Mean2",
                            value = 69.4),
               numericInput("alpha", "Alpha",
                            value = 0.05),
               numericInput("beta", "1-Beta(Power)",
                            value = 0.9)
               
      
               )
          )         
  })
  
  values <- reactive({
    s1=as.numeric(input$size1);s2=as.numeric(input$size2);sd1=as.numeric(input$sd1)
    sd2=as.numeric(input$sd2)
    sp=((s1-1)*(sd1^2) + (s2-1)*(sd2^2))/(s1+s2-2)
    se=(sqrt((sp/s1) + (sp/s2)))
    mean1=as.numeric(input$mean1);mean2=as.numeric(input$mean2)
    t=(mean1-mean2)/se
    refd1=qt(0.95,(s1+s2-2))
    refd2=qt(0.05,(s1+s2-2))
    refd3=qt(0.975,(s1+s2-2))
    ci=(mean1-mean2)+(c(-1,1)*refd1*se)
    alpha=as.numeric(input$alpha)
    alpha=(1-(input$alpha)/2)
    beta=as.numeric(input$beta)
    z1=qnorm(alpha,0,1)
    z2=qnorm(beta,0,1)
    sd1=as.numeric(input$sd1)
    sd2=as.numeric(input$sd2)
    d=as.numeric(input$diff)
    samplesize=((z1+z2)^2*(sd1^2+sd2^2))/d^2
    pval1=pt(t,(s1+s2-2),F)
    pval2=pt(t,(s1+s2-2))
    c(refd1,refd2,refd3,samplesize,sp,t,ci,s1,s2,pval1,pval2)
    
  })
  
  inputRadio <- reactive({
    
    switch(input$radio, 
           "1"={
             refd1=values()[1]
             if (t>refd1){
               
               cat("reject null hypothesis with pvalue",values()[10])
             }
             else {
               print("accept null hypothesis")
             }
           },
           "2"={
             refd2=values()[2]
             if (t<refd2){
               
               cat("reject null hypothesis with pvalue",values()[11])
             }
             else{
               cat ("accept null hypothesis with pvalue",values()[11])
             }
            },
           "3"={
             refd3=values()[3]
             if (abs(t)>refe3){
               
               print("reject null hypothesis")
             }
             else{
               print("accept null hypothesis")
             }
             
           }
           )
    
  })
  
  
  
  output$ui <- renderUI({
    if (is.null(input$input_type))
      return()
    ## the input is in the reactive function above
    uiInput()
      
  })
  
  output$pool <- renderText({
    values()[5]
    
  })
  
  output$tstat <- renderPrint({
    values()[6]
  })
  
  output$decision <- renderPrint({
    inputRadio()
    
    
  })
  
  output$conf <- renderPrint({
    values()[7]
    })
  
  output$samp <- renderPrint({
    values()[4]
     })
  
})