# Define UI for miles per gallon app ----
ui <- pageWithSidebar(
  
  # App title ----
  headerPanel("Calculator of logic score"),
  
  # Sidebar panel for inputs ----
  sidebarPanel(
    
    checkboxInput("continua", "Continuous evaluation ", TRUE),
    
    numericInput(min = 0, max = 10,
      inputId = "LP",
      label = strong("Propositional Logic (LP)"),
      value = 5.5
    ),
    
    conditionalPanel(
      condition = "input.continua == true",   
    numericInput(min = 0, max = 10,
      inputId = "LPG",
      label = strong("LP Group"),
      value = 5.5
    )
    ),
    
    numericInput(min = 0, max = 10,
      inputId = "LPO",
      label = strong("First order Logic (LPO)"),
      value = 5.5
    ),
    
    conditionalPanel(
      condition = "input.continua == true",      
    numericInput(min = 0, max = 10,
      inputId = "LPOG",
      label = strong("LPO Group"),
      value = 5.5
    )
    ),
    
    # Input: Checkbox for whether outliers should be included ----
    
    conditionalPanel(
      condition = "input.continua == true",   
      
    checkboxInput("recovery", "Recovery exam (repesca)", FALSE),
    
    conditionalPanel(
      condition = "input.recovery == true",  
      
    radioButtons("radio", label = ("Recovered part:"),
                 choices = list("LP" = 1, "LPO" = 2)),
    
    numericInput(min = 0, max = 10,
      inputId = "repesca",
      label = strong(" "),
      value = 5.5
    )
    )
    ),
    
    #actionButton("button", "GO!")
    
         
    hr(),
    #print("hi")
    print("Code developed by Emilio Serrano (emilioserra.oeg-upm.net) and licensed under the GNU GENERAL PUBLIC LICENSE, version 3.0.")
    
  ),
  
  
  
  # Main panel for displaying outputs ----
  mainPanel(h2(textOutput("selected_var")))
)
