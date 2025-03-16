# Jaden Van der Berg - CT.2022.P7X9H6

# Loading in necessary libraries
library(shiny)
library(shinydashboard)
library(shinythemes)
library(plotly)
library(ggplot2)
library(tidyverse)
library(rsconnect)

# Initialize source files
source("Question_1.R", local = TRUE)
source("Question_2.R", local = TRUE)

# Define UI for dashboard
ui <- fluidPage(theme = shinytheme("yeti"),                                        # Set Theme
                navbarPage(title = "Graduate Insights",                            # Setting Dashboard Main Title
                           
                           # Initializing tab 1
                           tabPanel("Top Tools",                                   # Setting Title
                                    # Setting up a side panel for plot options
                                    sidebarPanel(
                                      tags$h3("Plot Options"),
                                      # initialization of radio button section for plot selection
                                      radioButtons(
                                        inputId = "selectTool",
                                        label = "Select Tool Below:",
                                        choices = list("Programming Language" = 1,
                                             "Database" = 2,
                                             "Platform" = 3,
                                             "Web Framework" = 4,
                                             "AI Search" = 5,
                                             "AI Developer" = 6)
                                      ),
                                      width = 1
                                    ), # end of sidebar panel
                                    # Setting main section to be where plot output is
                                    mainPanel(
                                      plotlyOutput(outputId = "barPlot",
                                                 height = "900px",
                                                 width = "100%"),
                                      width = 11
                                    )
                                    
                             
                           ), # end of tab 1
                           # Initializing tab 2 to show the Industries plot
                           tabPanel("Top Industries",
                                    mainPanel(
                                      plotlyOutput(outputId = "dotPlot1",
                                                 height = "800px"),
                                      width = 12
                                    )
                                    
                                    
                           ), # end of tab 2
                           # Initializing tab 3 to show the Roles plot
                           tabPanel("Top Roles",
                                    mainPanel(
                                      plotlyOutput(outputId = "dotPlot2",
                                                 height = "800px"),
                                      width = 12
                                    )
                                    
                                    
                           ), # end of tab 3
                           # Initializing tab 4 to show the employment pie plots
                           tabPanel("Employment Rates",
                                    sidebarPanel(
                                      tags$h3("Plot Options"),
                                      radioButtons(
                                        inputId = "selectField",
                                        label = "Select Study Field Below:",
                                        choices = list("Data Science" = 1,
                                                       "Computer Science" = 2,
                                                       "Information Technology" = 3)
                                      ),
                                      width = 1
                                    ), # end of sidebar panel
                                    mainPanel(
                                      plotlyOutput(outputId = "piePlot",
                                                 height = "800px"),
                                      width = 11
                                    )
                                    
                                    
                           ), # end of tab 4
                           # Initializing tab 5 to contain main Data table with filtering options
                           tabPanel("Data",
                                    titlePanel(title = list(text = "Data Insights")),
                                    fluidRow(
                                      # Setting up logic for drop down selection menus to allow for filtering
                                      column(1,
                                             selectInput("campus",
                                                         "Campus:",
                                                         c("All",
                                                           unique(as.character(final_grad_df$Campus))))
                                      ),
                                      column(1,
                                             selectInput("studyfield",
                                                         "Study Field:",
                                                         c("All",
                                                           unique(as.character(final_grad_df$StudyField))))
                                      ),
                                      column(1,
                                             selectInput("branch",
                                                         "Branch:",
                                                         c("All",
                                                           unique(as.character(final_grad_df$Branch))))
                                      ),
                                      column(1,
                                             selectInput("role",
                                                         "Role:",
                                                         c("All",
                                                           unique(as.character(final_grad_df$Role))))
                                      ),
                                      column(1,
                                             selectInput("edulvl",
                                                         "Education Level:",
                                                         c("All",
                                                           unique(as.character(final_grad_df$EduLevel))))
                                      ),
                                      column(1,
                                             selectInput("proglang",
                                                         "Programming Language:",
                                                         c("All",
                                                           unique(as.character(final_grad_df$ProgLang))))
                                      ),
                                      column(1,
                                             selectInput("database",
                                                         "Database:",
                                                         c("All",
                                                           unique(as.character(final_grad_df$Databases))))
                                      ),
                                      column(1,
                                             selectInput("platform",
                                                         "Cloud Platform:",
                                                         c("All",
                                                           unique(as.character(final_grad_df$Platform))))
                                      ),
                                      column(1,
                                             selectInput("webframework",
                                                         "Web Framework:",
                                                         c("All",
                                                           unique(as.character(final_grad_df$WebFramework))))
                                      ),
                                      column(1,
                                             selectInput("industry",
                                                         "Industry:",
                                                         c("All",
                                                           unique(as.character(final_grad_df$Industry))))
                                      ),
                                      column(1,
                                             selectInput("aisearch",
                                                         "AI Search Tool:",
                                                         c("All",
                                                           unique(as.character(final_grad_df$AISearch))))
                                      ),
                                      column(1,
                                             selectInput("aitool",
                                                         "AI Developer Tool:",
                                                         c("All",
                                                           unique(as.character(final_grad_df$AITool))))
                                      ),
                                      column(1,
                                             selectInput("employment",
                                                         "Employment:",
                                                         c("All",
                                                           unique(as.character(final_grad_df$Employment))))
                                      )
                                    ),
                                    # Creating new row for Data Table
                                    DT::dataTableOutput("table")
                                    
                                    
                           ), footer = "By Jaden Van der Berg"
                           
                           )

    
)

# Define server logic for dashboard
server <- function(input, output) {
  # initializing logic to render plot output for bar plots
  output$barPlot <- renderPlotly({
    if (input$selectTool == 1) {
      ProgLang_Tool_Plot
    } else if (input$selectTool == 2) {
      Database_Tool_Plot
    } else if (input$selectTool == 3) {
      Platform_Tool_Plot
    } else if (input$selectTool == 4) {
      WebFramework_Tool_Plot
    } else if (input$selectTool == 5) {
      AISearch_Tool_Plot
    } else if (input$selectTool == 6) {
      AIDevTool_Tool_Plot
    }
  })
  # Rendering Industries Plot
  output$dotPlot1 <- renderPlotly({
    Industries_Plot
  })
  # Rendering Roles Plot
  output$dotPlot2 <- renderPlotly({
    Roles_Plot
  })
  # Defining logic to render plot output for the 3 pie plots
  output$piePlot <- renderPlotly({
    if (input$selectField == 1) {
      DS_EmpRate_fig
    } else if (input$selectField == 2) {
      CS_EmpRate_fig
    } else if (input$selectField == 3) {
      IT_EmpRate_fig
    }
  })

  # Defining Logic for data table rendering and filtering  
  output$table <- DT::renderDataTable(DT::datatable({
    data <- final_grad_df
    # Logic for filtering data based on columns
    if (input$campus != "All") {
      data <- data[data$Campus == input$campus,]
    }
    if (input$studyfield != "All") {
      data <- data[data$StudyField == input$studyfield,]
    }
    if (input$branch != "All") {
      data <- data[data$Branch == input$branch,]
    }
    if (input$role != "All") {
      data <- data[data$Role == input$role,]
    }
    if (input$edulvl != "All") {
      data <- data[data$EduLevel == input$edulvl,]
    }
    if (input$proglang != "All") {
      data <- data[data$ProgLang == input$proglang,]
    }
    if (input$database != "All") {
      data <- data[data$Databases == input$database,]
    }
    if (input$platform != "All") {
      data <- data[data$Platform == input$platform,]
    }
    if (input$webframework != "All") {
      data <- data[data$WebFramework == input$webframework,]
    }
    if (input$industry != "All") {
      data <- data[data$Industry == input$industry,]
    }
    if (input$aisearch != "All") {
      data <- data[data$AISearch == input$aisearch,]
    }
    if (input$aitool != "All") {
      data <- data[data$AITool == input$aitool,]
    }
    if (input$employment != "All") {
      data <- data[data$Employment == input$employment,]
    }
    data
  }))
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)
