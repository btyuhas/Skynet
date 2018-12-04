library(shiny)

shinyUI(
  fluidPage(
    fluidRow(
      # dividing header panel in two columns      
      # column one contains the title
      column(width = 8, # width of first column 
             style = "font-size: 30pt; line-height: 40pt; width = 100", 
             tags$strong("Team Skynet"))
    ),
    sidebarPanel(style = "background-color: #78d9c9;", id = "sidebar", h3("filter"), 
                 label=HTML('<p style="color:white; font-size: 12pt"> sidebar </p>'),
                 radioButtons("filter", "filter", c("Before")), 
                 width = 3
    ),
    mainPanel( "images", 
               tabsetPanel( 
                 tabPanel("Richmond", plotOutput("image1")),
                 type = "tabs"
               )
    )
  )
  
)