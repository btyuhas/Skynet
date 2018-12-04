library(shiny)

shinyServer(function(input,output,session){
  # setwd("C:/Users/damato/Desktop/Fall Semester 2018/CMDA 4864/Shiny app")
  
  # Richmond
  output$image1 <- renderImage({
    setwd("~/Skynet/GUI/www/")
    if (input$filter == "Before"){
      filename <- normalizePath(file.path(paste0("Before", '.JPG')))
      list(src = filename, height=750, width=570)
    }
    
  }, deleteFile = FALSE)
}
)