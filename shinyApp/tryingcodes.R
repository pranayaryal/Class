

library(shiny)
radioButtons("checkGroup", 
          label = h3("Checkbox group"), 
          choices = list("Choice 1" = 1, "Choice 2" = 2, 
                         "Choice 3" = 3),
          selected = 1)
browser()
sliderInput("slider1", label = h3("Slider"), min = 0, max = 100, 
                    value = 50)




renderPrint({
  ## remember to convert checkGroup input to numeri
  k=as.numeric(input$checkGroup)
  switch (k,{
     print("HELLO")
     },
            {
     print("HOW")},
     {
      print("ARE")}
     )
  
  
})


##While using switch statements, you can use curly brackets for each case and separate
## them with commas
x=3
switch(x,{2+2},
        {3*3},
        {6/7})



        
