
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
    tstat=(input$change)/((input$sd1)/sqrt(input$sample))
    pval=pt(tstat,(input$sample-1))
    
    t=qt((1-input$alpha1),(input$sample-1))
    ## converting radiobutton input to numeric value
    sw=as.numeric(input$ckg)
    
    if (sw==1){
      ##t=qt((1-input$alpha1),(input$sample-1))
      if (tstat > t){
        cat("Null Hypothesis Rejected with a p value of ",pval)
        
        }
      else {
        cat("Null Hypothesis Accepted with a p value of ",pval)
        
        }
       
      }
     
     else if (sw==2){
           if (tstat < t){
         cat("Null Hypothesis Rejected with a p value of ",pval)
        
          }
            else {
        cat("Null Hypothesis Accepted with a p value of ",pval)
            
              }
         
         }
     
     else if (sw==3){
          t=qt((1-(input$alpha1)/2),(input$sample-1))
            if (abs(tstat) > t){
              cat("Null Hypothesis Rejected with a p value of ",pval)
              
                }
          else {
            cat("Null Hypothesis Accepted with a p value of ",pval)
            
                }
            
            }
    })
  
  output$decisionmean <-renderPrint({
    tstat=(input$meansample)/((input$sdmean)/sqrt(input$meansample))
    pval=pt(tstat,(input$meansample-1))
    
    t=qt((1-input$meanalpha),(input$meansample-1))
    ## converting radiobutton input to numeric value
    sw=as.numeric(input$ckgmean)
    
    if (sw==1){
      ##t=qt((1-input$alpha1),(input$sample-1))
      if (tstat > t){
        cat("Null Hypothesis Rejected with a p value of ",pval)
        
      }
      else {
        cat("Null Hypothesis Accepted with a p value of ",pval)
        
      }
      
    }
    
    else if (sw==2){
      if (tstat < t){
        cat("Null Hypothesis Rejected with a p value of ",pval)
        
      }
      else {
        cat("Null Hypothesis Accepted with a p value of ",pval)
        
      }
      
    }
    
    else if (sw==3){
      t=qt((1-(input$meanalpha)/2),(input$meansample-1))
      if (abs(tstat) > t){
        cat("Null Hypothesis Rejected with a p value of ",pval)
        
      }
      else {
        cat("Null Hypothesis Accepted with a p value of ",pval)
        
      }
      
    }
    
    
  })
    
    
  })
