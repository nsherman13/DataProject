library(shiny)
library(ggplot2)
shinyUI(fluidPage(
  titlePanel("Top Scoring Teams in the English Football"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("top",
                  "Number of Top values:",
                  min = 1,
                  max = 10,
                  value = 10
                  ), 
      selectInput("tier", 
                  label = "Choose League Level(1 = Premier)",
                  choices = list("1", "2",
                                 "3", "4"),
                  selected = "1"),
      
      textInput("season", 
                  label = "Season of Interest: Enter number between 1888 and 2014",
                  value =  2014)
    ),
    
    mainPanel(
      #textOutput("text"),
      #textOutput("text2"),
      #textOutput("text3"),
      plotOutput("plot"),
      tableOutput("table")
    )
  )
))