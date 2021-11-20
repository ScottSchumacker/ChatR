# Scott Schumacker
# Chat application

library(shiny)
library(firebase)

# Define UI for application that draws a histogram
ui <- fluidPage(

    "Hello this is a chat application experiment with R",
    br(),
    br(),
    br(),
    br(),
    textOutput("text"),
    br(),
    br(),
    br(),
    br(),
    
    textInput("Message", NULL, value = "", width = NULL, placeholder = NULL),
    actionButton("button", "Send Message")
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    observeEvent(input$button, {
        output$text <- renderText({ input$Message })
    })

}

# Run the application 
shinyApp(ui = ui, server = server)
