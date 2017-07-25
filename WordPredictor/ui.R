#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = "bootstrap.css",
    tags$style(type = 'text/css', 'html{background-color:gray;}'),
  tags$h2(id = "title","Smart Text Prediction"),
  # Application title
  tabsetPanel(
      tabPanel("Application",
          mainPanel(
              br(),
              br(),
              column(width = 12, align = "center", h1("Enter Text Here:")),
              column(width = 12, align = "center", textInput("text",label = "",value =  "Enter Text Here")),
              column(width = 12, align = "center", h2("Predicted Next Word")),
              column(width = 12, align = "center", textOutput("optimalChoice")),
              tags$style(type = 'text/css', '#optimalChoice{font-size: 25px;}'),
              column(width = 12, align = "center", h3("Three Next Word Predictions")),
              tags$style(type = 'text/css', '.col-sm-4{font-size: 15px;}'),
              fluidRow(
                  column(width = 4,align = "left",textOutput("choice1")),
                  column(width = 4,align = "center",textOutput("choice2")),
                  column(width = 4,align = "right",textOutput("choice3"))
              ),
              br(),
              br(),
              br(),
              fluidRow(
                  column(width = 6, align= "left", imageOutput("courseraImage")),
                  column(width = 6, align = "right", imageOutput("swiftKeyImage"))
              )
              
          )
      ),
      tabPanel("Plots",
               mainPanel(
                   br(),   
                   h3("Probability of Word Predicted Outcome with no Common Stop Words"),
                   plotlyOutput("noStopWords"),
                   br(),
                   h3("Probability of Word Predicted Outcome with Common stop Words"),
                   plotlyOutput("withStopWords")
               )),
      tabPanel("Documentation",
               h1("Supporting Information"),
               h2("Overview"),
               p("This app takes a user given input text and returns the three most likely words to follow that piece of text"),
               br(),
               h2("Main App Tab"),
               p("The main app tab is where the input text can be supplied. Directly below the input text are the three predictions for the next word for that given text."),
               p("The text input box does not require a button press to begin predicting. It will predict when the user is finished typing a word."),
               br(),
               h2("Supplemental Plots and Model Information"),
               p("This model for prediction is based on a Markov Chain and thus works on the probability of a word occuring following a sequence of words given the number of occurances in a large data set. In this 
                 second tab we show plots that can give some insight into the Markov Model used for this prediction"),
               p("Two plots exist because two training sets were built and predicted upon. One training set has 'stop words' removed. These words are the most common words in the english language. We remove these words to allow for more diversity in our 
                 training data. However, it is wise when dealing with phrases to include these words to maintain the integrity of the phrase. This is why we have included a second training set that includes phrases with these 'stop words'."),
               p("The top plot refers to predictions made with the training set that does not include stop words."),
               p("The bottom plot refers to predictions made with the training set that includes stop words."))
  )

))
