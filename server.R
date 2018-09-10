# Define server logic to plot various variables against mpg ----
notaBloque <- function(NI,NG){
  notaBloque=0
  if(NI>=5 | ( NI<5 & NG<=NI)){
    notaBloque=NI*0.7+NG*0.3
  }
  else{
    factor= (NG-NI)/NG
    notaBloque= NI*(0.7+ 0.3*factor) + NG*(1-(0.7 + 0.3*factor))
    
  }
  return(notaBloque)
}

notaAsignatura<-function(input){
  LP=input$LP
  LPG=input$LPG
  LPO=input$LPO
  LPOG=input$LPOG
  if(!input$continua) { 
    x    <- round( (LP +  LPO)/2, 2)
    if(LP<3 | LPO <3){
      x <- "Less than 3 in LP or LPO"
    }
  }
  if(input$continua){
    if(input$recovery){
      if(input$radio==1){#repesca de LP
        LP=input$repesca
      }
      else{
        LPO=input$repesca
        
      }
    }
  
    BloqueLP= notaBloque(LP,LPG)
    BloqueLPO= notaBloque(LPO,LPOG)
    
    if( BloqueLP <3 ){
      x <- "LP is less than 3"
    }
    
    if( BloqueLPO <3 )
      x <- "LPO is less than 3"
    
    if(BloqueLP>=3 & BloqueLPO>3){
      x<- round((BloqueLP+ BloqueLPO) /2, 2)
    
    }
    
  }
  return(x)
}

#server <- function(input, output) {
# observeEvent(input$button, {
#   output$selected_var <- renderText({paste("Final score:", notaAsignatura(input))})
# })
#}


server <- function(input, output){
  output$selected_var <- renderText({
    #x <- -1
    paste("Final score:", notaAsignatura(input))
  })
}