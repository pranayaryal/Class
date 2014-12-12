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
  
  output$ui <- renderUI({
    if (is.null(input$input_type))
      return()
    
    # Depending on input$input_type, we'll generate a different
    # UI component and send it to the client.
    uiInput()
      
  })
  
  output$pool <- renderText({
    s1=as.numeric(input$size1);s2=as.numeric(input$size2);sd1=as.numeric(input$sd1)
    sd2=as.numeric(input$sd2)
    sp=((s1-1)*(sd1^2) + (s2-1)*(sd2^2))/(s1+s2-2)
    sp
    if (input$input_type=="One sample Test of Means"){
      0
    }
    else{
      sp
    }
    
  })
  
  output$tstat <- renderPrint({
    s1=as.numeric(input$size1);s2=as.numeric(input$size2);sd1=as.numeric(input$sd1)
    sd2=as.numeric(input$sd2)
    sp=((s1-1)*(sd1^2) + (s2-1)*(sd2^2))/(s1+s2-2)
    mean1=as.numeric(input$mean1);mean2=as.numeric(input$mean2)
    t=(mean1-mean2)/(sqrt((sp/s1) + (sp/s2)))
    t
    
  })
  
  output$decision <- renderPrint({
    s1=as.numeric(input$size1);s2=as.numeric(input$size2);sd1=as.numeric(input$sd1)
    n1=as.numeric(input$size1);n2=as.numeric(input$size2);sd1=as.numeric(input$sd1)
    sd2=as.numeric(input$sd2)
    mean1=as.numeric(input$mean1);mean2=as.numeric(input$mean2)
    sp=((s1-1)*(sd1^2) + (s2-1)*(sd2^2))/(s1+s2-2)
    t=(mean1-mean2)/(sqrt((sp/s1) + (sp/s2)))
    refd1=qt(0.95,(s1+s2-2))
    refd2=qt(0.05,(s1+s2-2))
    refd3=qt(0.975,(s1+s2-2))
    
    
    if (input$radio=="1"){
              
              if (t>refd1) {
                pval=pt(t,(n1+n2-2),F)
                cat("null value rejected")
                
                
              }
              else{
                pval=pt(t,(n1+n2-2))
                cat("null value accepted with p value: ",pval)
                
              }
    }
    if(input$radio=="2"){        
             if (t < refd2){
                print("null value rejected")
                
                }
            
               else{
                 print("null value accepted")
                 
               }
               
    }
    if(input$radio=="3"){
      if(abs(t)>refd3){
        print("null hypothesis rejected")
      }
      else {
        print("null hypothesis accepted")
      }
    }

             
    
    
  })
  
  output$conf <- renderPrint({
    s1=as.numeric(input$size1);s2=as.numeric(input$size2);sd1=as.numeric(input$sd1)
    sd2=as.numeric(input$sd2)
    mean1=as.numeric(input$mean1);mean2=as.numeric(input$mean2)
    sp=((s1-1)*(sd1^2) + (s2-1)*(sd2^2))/(s1+s2-2)
    se=(sqrt((sp/s1) + (sp/s2)))
    refd1=qt(0.975,(s1+s2-2))
    (mean1-mean2)+(c(-1,1)*refd1*se)
    if (input$input_type=="One sample Test of Means"){
      0
    }
    else{
      (mean1-mean2)+(c(-1,1)*refd1*se)
    }
    
    
    
    
  })
  
  output$samp <- renderPrint({
    alpha=as.numeric(input$alpha)
    alpha=(1-(input$alpha)/2)
    beta=as.numeric(input$beta)
    z1=qnorm(alpha,0,1)
    z2=qnorm(beta,0,1)
    sd1=as.numeric(input$sd1)
    sd2=as.numeric(input$sd2)
    
    d=as.numeric(input$diff)
    ((z1+z2)^2*(sd1^2+sd2^2))/d^2
    
    
    
    
  })
  
  
  
})