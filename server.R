# load the shiny and ggplot2 packages
library(shiny)
library(ggplot2)

# Initialize the server function
shinyServer(function(input, output){
    
    # the reactive function here returns the column variables that correspond to a specific dataset
    var <- reactive({
        switch(input$data1,
               "airquality" = names(airquality),
               "trees" = names(trees),
               "DNase" = names(DNase))
               
    })
    
    # vx and vy contain the drop down list of variables names
    output$vx <- renderUI({
        selectInput("variablex", "Select the First(X) variable", choices = var())
    })
    output$vy <- renderUI({
        selectInput("variabley", "Select the Second(Y) variable", choices = var())
    })
    # To plot the scatterplots
    output$p <- renderPlot({
        attach(get(input$data1))

        
        ggplot(get(input$data1), aes_string(input$variablex, input$variabley)) + geom_point()
        
    })
    
})