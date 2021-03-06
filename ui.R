library(shiny)

shinyUI(
  bootstrapPage(
    # We'll add some custom CSS styling -- totally optional
    includeCSS("main.css"),
    
    # And custom JavaScript -- just to send a message when a user hits "enter"
    # and automatically scroll the chat window for us. Totally optional.
    includeScript("script.js"),
    
    div(
      # Setup custom Bootstrap elements here to define a new layout
      class = "container-fluid", 
      div(class = "row-fluid",
          # Set the page title
          tags$head(tags$title("Chat using Shiny")),
          
          # Create the header
          div(class="span6",
              h1("Chat using Shiny"), 
              h4("Words Frquencies are displayed at the top. Words are captured from chat.")
          ), div(class="span6", id="sub-words",
                 "Words are monitored =)."
          )
          
      ),
      # The main panel
      div(
        class = "row-fluid", 
        mainPanel(
          plotOutput("plot"),
          # Create a spot for a dynamic UI containing the chat contents.
          uiOutput("chat"),
          
          # Create the bottom bar to allow users to chat.
          fluidRow(
            div(class="span10",
                textInput("entry", "")
            ),
            div(class="span2",
                actionButton("send", "Send")
            )
          )
          
        ),
        
        # Sidebar with a slider and selection inputs
        sidebarPanel(
          sliderInput("freq",
                      "Minimum Frequency:",
                      min = 1,  max = 10, value = 8),
          sliderInput("max",
                      "Maximum Number of Words:",
                      min = 1,  max = 100,  value = 10)
        ),
        
        # The right sidebar
        sidebarPanel(
          # Let the user define his/her own ID
          textInput("user", "Your User ID:", value=""),
          tags$hr(),
          h5("Current Users"),
          # Create a spot for a dynamic UI containing the list of users.
          uiOutput("userList"),
          tags$hr(),
          helpText(HTML("<p>Built using R & <a href = \"http://rstudio.com/shiny/\">Shiny</a>."))
        )
      )
    )
  )
)