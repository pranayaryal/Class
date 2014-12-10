
library(shiny)
shinyUI(fluidPage(
  titlePanel("Pranay Aryal's Biostatistics App"),
  withMathJax(),
  
  fluidRow(
    
    column(2,
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
             p("sample size",style ="color:#888888;")
             
           )),
    column(3,
           wellPanel(
             div("PAIRED SAMPLE TEST OF MEANS(TEST STATISTICS)",style ="color:blue"),
             hr(),
             withMathJax(),
             radioButtons("ckg", 
                label = h4("Null and Alternate Hypothesis"), 
                choices = list("\\(H_0:\\mu_d \\le \\mu_{d0}
                    ;H_A:\\mu_d > \\mu_{d0}\\)" = 1,
                "\\(H_0:\\mu_d \\ge \\mu_{d0};H_A:\\mu_d < \\mu_{d0}\\)" = 2, 
                "\\(H_0:\\mu_d = \\mu_{d0};H_A:\\mu_d \\ne \\mu_{d0}\\)" = 3),
                selected = 1),
             sliderInput("sample", "Enter sample size",min=0,max=100,value=50),
             hr(),
             sliderInput("change","enter desired average change",min=-10,max=20,
                         step=0.1,value=-3.2),
             hr(),
             sliderInput("sd1","enter standard deviation",min=0,
                         max=30,step=0.1,value=12.1),
             numericInput("alpha1","enter alpha",value=0.05),
             p("t-statistics",style ="color:#888888;"),
             verbatimTextOutput("tstat"),
             p("decision",style ="color:#888888;"),
             textOutput("decision")
           )),
    column(3,
           wellPanel(
             div("ONE SAMPLE TEST OF MEAN",style ="color:blue"),
             hr(),
             withMathJax(),
             radioButtons("ckgmean", 
                  label = h4("Null and Alternate Hypothesis"), 
                  choices = list("\\(H_0:\\mu \\le \\mu_0;H_A:\\mu > \\mu_0\\)" = 1,
                 "\\(H_0:\\mu \\ge \\mu_0;H_A:\\mu < \\mu_0\\)" = 2, 
                 "\\(H_0:\\mu = \\mu_0;H_A:\\mu \\ne \\mu_0\\)" = 3),
                          selected = 1),
             sliderInput("meansize", "Enter sample size",min=0,max=100,value=50),
             hr(),
             numericInput("nullmean","null value",value=-50),
             hr(),
             numericInput("meansample","sample mean",value=-50),
             sliderInput("sdmean","enter standard deviation",
                         min=0,max=30,step=0.1,value=12.1),
             numericInput("meanalpha","enter alpha",value=0.05),
             p("t-statistics",style ="color:#888888;"),
             verbatimTextOutput("tstat"),
             p("decision",style ="color:#888888;"),
             textOutput("decisionmean")
           )),
    column(4,
           wellPanel(
             div("TWO SAMPLE TEST OF DIFFERENCE IN MEAN(DIFFERENT VARIANCE)",
                 style ="color:blue"),
             hr(),
             withMathJax(),
             radioButtons("ckg", 
                    label = h4("Null and Alternate Hypothesis"), 
                    choices = list("\\(H_0:\\mu_1-\\mu_2 \\le (\\mu_1-\\mu_2)_0\\;
                      H_A:\\mu_1-\\mu_2 > (\\mu_1-\\mu_2)_0\\)" = 1,
                         "\\(H_0:\\mu_1-\\mu_2 \\ge (\\mu_1-\\mu_2)_0;
                         H_A:\\mu_1-\\mu_2 < (\\mu_1-\\mu_2)_0\\)" = 2, 
                       "\\(H_0:\\mu_1-\\mu_2 = (\\mu_1-\\mu_2)_0\\;
                        H_A:\\mu_1-\\mu_2 \\ne (\\mu_1-\\mu_2)_0\\)" = 3),                 
                        selected = 1),
             selectInput("select", strong("Select variance"), 
                         choices = list("Equal Variance" = 1, 
                          "Unequal Variance" = 2),
                         selected = NULL),
             uiOutput("ui"),
             numericInput("meandiffsample", "Enter sample size",value=50),
             hr(),
             numericInput("nullmeandiff","null value",value=-50),
             hr(),
             numericInput("meandiff","difference of mean",value=-50),
             numericInput("sdmeandiff1","enter standard deviation1",
                         value=NULL),
             numericInput("sdmeandiff2","enter standard deviation2",
                          value=NULL),
             numericInput("meandiffalpha","enter alpha",value=0.05),
             p("t-statistics",style ="color:#888888;"),
             verbatimTextOutput("tstat"),
             p("decision",style ="color:#888888;"),
             textOutput("decisionmeandiff")
           ))
    )
))