library(shiny)

shinyServer(function(input,output,session){
  # setwd("C:/Users/damato/Desktop/Fall Semester 2018/CMDA 4864/Shiny app")
  
  # Richmond
  output$image1 <- renderImage({
    if (is.null(input$picture))
      return(NULL)
    
    if (input$picture == "Before"){
      return( list(
        src = "www/hell.jpg", contentType = "image/jpg", height = 750, width = 570
      ))
      } 
    }, deleteFile = FALSE) 
}
)

  
  
  


