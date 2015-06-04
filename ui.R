

# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(
  # Application title
  titlePanel("Gowdhaman!! word cloud analysis......."),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      textInput("summary","Please enter the summary","Gowdhaman"),
      selectInput(
        "tTheme",
        label = "Choose a variable to display",
        choices = list(
          "Accent",
          "Dark2",
          "Paired",
          "Pastel1",
          "Pastel2",
          "Set1",
          "Set2",
          "Set3"
        ),
        selected = "Dark2"
      ),
      sliderInput("wordFreq","Word Frequency",min = 0,max = 100,value = 50),
      sliderInput("numberOfWords","Number Of Words",min = 0,max = 100,value = 50),
      hr(),
      actionButton("wrdCld","Get word cloud")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(plotOutput("wordCloudPlot"))
  )
))
