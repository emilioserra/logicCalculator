# Define server logic to plot various variables against mpg ----
notaBloque <- function(NI,NG){
  notaBloque=0
  NI2=round(NI,2)
  NG2=round(NG,2) #redondeo 
  
  factor= 0.3 * ( sqrt (max(0, 5-NI2)/5) )
  notaBloque=    NG2*(0.3-factor) + NI2*(0.7+ factor)
    
  notaBloque=round(notaBloque,2)
  return(notaBloque)
}

#nota lleva 1 para nota LP, 2 para LPO, 3 para final
notaAsignatura<-function(input,bloque){
  LP=input$LP
  LPG=input$LPG
  LPO=input$LPO
  LPOG=input$LPOG
  if(!input$continua) { 
    BloqueLP = LP
    BloqueLPO = LPO
    x    <- round( (LP +  LPO)/2, 1)
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
  
    BloqueLP= round(notaBloque(LP,LPG),2)
    BloqueLPO= round(notaBloque(LPO,LPOG),2)
    
    
    #really weird bug, <3 does not work, it takes it as <=3
    if( BloqueLP <= 2.99999  | BloqueLPO <= 2.99999){
      x <- "Menos de 3 en un bloque"
    }
    else{
      x<- round((BloqueLP+ BloqueLPO) /2, 1)
    
    }
    
  }
  output= c(BloqueLP, BloqueLPO, x)
  return(output[bloque])
}

#server <- function(input, output) {
# observeEvent(input$button, {
#   output$selected_var <- renderText({paste("Final score:", notaAsignatura(input))})
# })
#}


server <- function(input, output){
  
  #output in several variables 
  output$selected_var1 <- renderText({
    #x <- -1
    paste("Bloque LP: ", notaAsignatura(input,1))
  })
  output$selected_var2 <- renderText({
    paste("Bloque LPO: ", notaAsignatura(input,2))
  })
  output$selected_var3 <- renderText({
    paste("Nota asignatura: ", notaAsignatura(input,3))
  })  
  
  
  
}