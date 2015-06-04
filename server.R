

# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

source("./R/global.R")

function(input,output,session) {
  terms <- reactive({
    #Change when the "update" button is pressed.....
    input$wrdCld
    
    isolate({
      withProgress({
        setProgress(message = "Processing corpus.....!!")
        getTermMatrix(input$summary)
      })
    })
  })
  
  
  output$wordCloudPlot <- renderPlot({
    v <- terms()
    wordcloud(
      names(v),v,min.freq = input$wordFreq,max.words = input$numberOfWords,colors = brewer.pal(50,input$tTheme)
    )
  })
}
