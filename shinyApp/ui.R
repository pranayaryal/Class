
library(shiny)
shinyUI(fluidPage(
  titlePanel("Pranay Aryal's Bio-Statistics Apps"),
  fluidRow(
    
    column(4, wellPanel(
      selectInput("input_type", "Choose a test",
                  c("One sample Test of Means", "Two sample difference of means(equal variance)"
                  )
      )
    )),
    
    column(4, wellPanel(
      # This outputs the dynamic UI component
      uiOutput("ui"),
      radioButtons("radio", "Hypothesis",
                   choices = list("greater than null value" = 1,
                                  "less than null value" = 2, 
                                  "two-sided" = 3), 
                   selected = 1)
    )),
    
    column(3,
           tags$p("Pooled Standard Deviation:"),
           verbatimTextOutput("pool"),
           tags$p("Test Statistics:"),
           verbatimTextOutput("tstat"),
           tags$p("Decision:"),
           verbatimTextOutput("decision"),
           tags$p("decision2:"),
           verbatimTextOutput("decision2"),
           tags$p("confidence interval"),
           verbatimTextOutput("conf"),
           tags$p("sample size"),
           verbatimTextOutput("samp")
    )
  )
))
  