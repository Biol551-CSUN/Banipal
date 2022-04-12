
# 04.06.22, This is is practicing using the shiny app #

library(shiny)
library(tidyverse) 

ui<-fluidPage(
  
  sliderInput(inputId = "Number", 
              label = "Choose your Number", 
              value = 25, min = 0, max = 100 ),
  textInput(inputId = "title",
            label = "Write a Title",
            value = "Histogram of Values"),
  plotOutput("hist"),
  verbatimTextOutput("stats"))

server<-function(input,output){
  data<-reactive({ 
    tibble(x = rnorm(input$Number))}) 
 
    output$hist <- renderPlot({
    ggplot(data(), aes(x = x))+ 
      geom_histogram()+
      labs(title = input$title)})
 
    output$stats <- renderPrint({
    summary(data())})}

shinyApp(ui = ui, server = server)


