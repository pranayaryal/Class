
library(shiny)
shinyUI(fluidPage(
  titlePanel("Pranay Aryal's Biostatistics App"),
  withMathJax(),
  
  fluidRow(
    
    column(4,
           wellPanel(
             div("PAIRED SAMPLE TEST OF MEANS",style ="color:blue"),
             hr(),
             numericInput("improv", label = h4("Enter improvement desired"), value = NULL),
             hr(),
             ##p("Current Value:", style = "color:#888888;"), 
             ##verbatimTextOutput("num"),
             numericInput("beta",label=h4("enter beta"),value=NULL),
             hr(),
             ##p("Current Value:", style = "color:#888888;"), 
             ##verbatimTextOutput("num2"),
             numericInput("alpha",label=h4("enter alpha"),value=NULL),
             sliderInput("sd","Enter standard deviation",min=0,max=100,value=10,step=1),
             p("sample size",style ="color:#888888;"),
             ##verbatimTextOutput("samplesize")
             ##verbatimTextOutput("confidenceinterval")
           )),
    column(4,
           wellPanel(
             div("PAIRED SAMPLE TEST OF MEANS(TEST STATISTICS)",style ="color:blue"),
             hr(),
             withMathJax(),
             checkboxGroupInput("ckg", 
                                label = h4("Null and Alternate Hypothesis"), 
                                choices = list("\\(H_0:\\mu_d \\le \\mu_{d0};H_A:\\mu_d > \\mu_{d0}\\)" = 1, "\\(H_0:\\mu_d \\ge \\mu_{d0};H_A:\\mu_d < \\mu_{d0}\\)" = 2, 
                                               "\\(H_0:\\mu_d = \\mu_{d0};H_A:\\mu_d \\ne \\mu_{d0}\\)" = 3),
                                selected = 1),
             numericInput("sample", label = h4("Enter sample size"),value=NULL),
             hr(),
             numericInput("change",label=h4("enter desired average change"),value=NULL),
             hr(),
             numericInput("sd1",label=h4("enter standard deviation"),value=NULL),
             numericInput("alpha1",label=h4("enter alpha"),value=NULL),
             p("t-statistics",style ="color:#888888;"),
             verbatimTextOutput("tstat"),
             p("decision",style ="color:#888888;"),
             textOutput("decision")
           ))
    
  )
))