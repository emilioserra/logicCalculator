# Define UI for miles per gallon app ----
ui <- pageWithSidebar(
  
  # App title ----
  headerPanel("Calculadora de nota"),
  
  # Sidebar panel for inputs ----
  sidebarPanel(
    hr(),
    print("Curso 2019/2020"),
    checkboxInput("continua", "Eval. continua", TRUE),
    
    
    
    conditionalPanel(
      condition = "input.continua == true",   
      numericInput(min = 0, max = 10,
                   inputId = "LPG",
                   label = strong("LP grupo"),
                   value = 5
      )
    ),
    
    numericInput(min = 0, max = 10,
      inputId = "LP",
      label = strong("LP individual"),
      value = 5
    ),

    conditionalPanel(
      condition = "input.continua == true",      
      numericInput(min = 0, max = 10,
                   inputId = "LPOG",
                   label = strong("LPO grupo"),
                   value = 5
      )
    ),
    
    numericInput(min = 0, max = 10,
      inputId = "LPO",
      label = strong("LPO individual"),
      value = 5
    ),
    

    
    # Input: Checkbox for whether outliers should be included ----
    
    conditionalPanel(
      condition = "input.continua == true",   
      
    checkboxInput("recovery", "Repesca", FALSE),
    
    conditionalPanel(
      condition = "input.recovery == true",  
      
    radioButtons("radio", label = ("Parte recuperada:"),
                 choices = list("LP" = 1, "LPO" = 2)),
    
    numericInput(min = 0, max = 10,
      inputId = "repesca",
      label = strong(" "),
      value = 5
    )
    )
    ),
    
    #actionButton("button", "GO!")
    
         
    hr(),
    #print("hi")
    print("Code developed by Emilio Serrano (emilioserra.oeg-upm.net) and licensed under the GNU GENERAL PUBLIC LICENSE, version 3.0.")
    
  ),
  
  
  
  # Main panel for displaying outputs ----
  mainPanel(
    h3("Notas"),
    tags$hr(),
    h4(textOutput("selected_var1")),
    h4(textOutput("selected_var2")),
    h4(textOutput("selected_var3"))
    
  )
)
