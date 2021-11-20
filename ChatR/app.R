# Scott Schumacker
# Chat application

library(shiny)
library(firebase)
library(googlesheets4)
library(rlang)

# Define UI for application that draws a histogram
ui <- fluidPage(

    "Hello this is a chat application experiment with R",
    br(),
    br(),
    br(),
    br(),
    tableOutput('table'),
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
    
    gs4_deauth()
    ss <- "https://docs.google.com/spreadsheets/d/1BCcmhgfx_F1bzIi2t3kylu7i92udZIahZ19iReSHC38/edit?usp=sharing"
    dat <- read_sheet(ss)
    
    output$table <- renderTable({ dat })
    
    observeEvent(input$button, {
        output$text <- renderText({ input$Message })
    })

}

# Run the application 
shinyApp(ui = ui, server = server)
