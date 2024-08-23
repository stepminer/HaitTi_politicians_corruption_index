#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(dplyr)
library(leaflet)
library(ggplot2)
library(RColorBrewer)

# Load the data
data <- read.csv("presidents_corruption_geo.csv")

# Convert city, Political.Figure, and Honest to factors
data$city <- as.factor(data$city)
data$Political.Figure <- as.factor(data$Political.Figure)
data$Honest <- as.factor(data$Honest)

# Define UI
ui <- fluidPage(
 titlePanel("Corruption in Haiti - Political Figures"),
 
sidebarLayout(
 sidebarPanel(
 selectInput("figure", "Select Political Figure:", 
 choices = c("All", levels(data$Political.Figure))),
 selectInput("city", "Select City:", 
 choices = c("All", levels(data$city))),
 selectInput("honest", "Honest:", 
 choices = c("All", "Yes", "No")) # Added input for Honest column
 ),
 
mainPanel(
 tabsetPanel(
 tabPanel("Map", leafletOutput("map")),
 tabPanel("Bar Graph", plotOutput("bargraph"))
 )
 )
 )
)

# Define Server
server <- function(input, output, session) {

# Filter data based on inputs
 filteredData <- reactive({
 df <- data
 if (input$figure != "All") {
 df <- df %>% filter(Political.Figure == input$figure)
 }
 if (input$city != "All") {
 df <- df %>% filter(city == input$city)
 }
 if (input$honest != "All") {
 df <- df %>% filter(Honest == input$honest)
 }
 df
 })
 
# Create the map
 output$map <- renderLeaflet({
 leaflet(filteredData()) %>%
 addTiles() %>%
 addCircleMarkers(~longitude, ~latitude, 
 popup = ~paste("<strong>Name:</strong>", Political.Figure,
 "<br><strong>City of Birth:</strong>", city,
 "<br><strong>Score:</strong>", Corruption.Score,
 "<br><strong>Details:</strong>", Notable.Corruption.Details),
 label = ~paste(Political.Figure, "(", city, ")"), # Label with city name
 radius = ~Corruption.Score / 3, # Adjusting the size of the bubbles
 color = "red",
 fillOpacity = 0.8)
 })

# Create the bar graph
 output$bargraph <- renderPlot({
 mean_score <- mean(data$Corruption.Score, na.rm = TRUE) # Calculate the mean corruption score
 
ggplot(filteredData(), aes(x = reorder(Political.Figure, -Corruption.Score), y = Corruption.Score, fill = Political.Figure)) +
 geom_bar(stat = "identity", fill = "red") +
 geom_hline(yintercept = mean_score, color = "black", linetype = "dashed", size = 1) + # Add mean line
 geom_text(aes(label = Corruption.Score), vjust = -1, hjust = -0.1) +
 theme_minimal() +
 coord_flip() +
 labs(x = "Political Figure", y = "Corruption Score (0-100)", title = "Corruption Scores by Political Figure", 
 subtitle = paste("Mean Corruption Score =", round(mean_score, 2), "- Dashed Line"))
 
})
}

# Run the app
shinyApp(ui = ui, server = server)