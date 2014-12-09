
library(shiny)
shinyServer(function(input, output) {
  
  output$samplesize <- renderPrint({
    z=1-(input$alpha)/2
    qz=qnorm(z,0,1)
    qb=qnorm((1-input$beta),0,1)
    ((qz+qb)^2)*((input$sd)^2)/((input$improv)^2)
  })
  output$tstat <- renderPrint({
    ts=(input$change)/((input$sd1)/sqrt(input$sample))
    ts
  })
  
  output$decision <-renderPrint({
    ts=(input$change)/((input$sd1)/sqrt(input$sample))
    pval=pt(ts,(input$sample-1))
    if ("ckg"==1){
      t=qt((1-input$alpha1),(input$sample-1))
      if (ts > t){
        cat("Null Hypothesis Rejected with a p value of ",pval)
        break()
      }
      else {
        cat("Null Hypothesis Accepted with a p value of ",pval)
        break()
      }
    }
    else if ("ckg"==2){
      t=qt(input$alpha1,(input$sample-1))
      if (ts < t){
        cat("Null Hypothesis Rejected with a p value of ",pval)
        break()
      }
      else {
        cat("Null Hypothesis Accepted with a p value of ",pval)
        break()
      }
      
    }
    else if ("ckg"==3){
      t=qt((1-(input$alpha1/2)),(input$sample-1))
      if (abs(ts) > t){
        cat("Null Hypothesis Rejected with a p value of ",pval)
        break()
      }
      else {
       cat("Null Hypothesis Accepted with a p value of ",pval)
        break()
      }
    }
    
    
  })
  
})