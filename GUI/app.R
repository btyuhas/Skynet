library(shiny)

ui <-  shinyUI(
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

server <- shinyServer(function(input,output,session){
  # setwd("C:/Users/damato/Desktop/Fall Semester 2018/CMDA 4864/Shiny app")
  
  # Richmond
  output$image1 <- renderImage({
    setwd("~/Skynet/GUI")
    if (input$picture == "Before"){
      filename <- normalizePath(file.path(paste0("Before", '.JPG')))
      list(src = filename, height=750, width=570)
    }
    
  }, deleteFile = FALSE) 
}
)

shinyApp(ui, server)