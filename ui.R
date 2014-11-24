# Load the shiny package
library(shiny)

# Launch the shiny server
shinyUI(fluidPage(
    # Give the title of the shiny app.
    titlePanel("Dyanamic display of scatterplots of variables in the airquality, trees and DNase R Datasets"),
    
    sidebarLayout(
        # Select the the dataset to plot
        sidebarPanel(
            selectInput(inputId="data1", label = "Select the dataset ", choices = c("airquality", "trees", "DNase")),
            br(),
            helpText("The following selectInput drop down choices are dynamically populated based on dataset selected above"),
            br(),
            
            # vx values come from the server.r file
            uiOutput("vx"),
            br(),
            uiOutput("vy")
            
            
                        
            ),
        
        # Initialize the main panel where scatterplot is to be displayed
        mainPanel(
            plotOutput("p")
            )
        
        )
    
    
    
    
    
    ))