# Haiti_politicians_corruption_index 
Overview
This Shiny app visualizes the history and extent of corruption among Haiti's political elite, from the era of Jean-Jacques Dessalines to the current political transitional period (CPT). The app provides interactive tools to explore and analyze corruption data by political figure and location, offering insights into the historical patterns and geographic distribution of corruption in Haiti. Try it here: https://stepminer.shinyapps.io/HT_politicians_corruption_index/
Features
1. Interactive Map
•	Geographic Visualization: View the locations associated with each political figure using an interactive map.
•	Corruption Score Bubbles: The size of the bubbles on the map is proportional to the corruption score of each political figure.
•	Popups and Labels: Click on any marker to see detailed information, including the political figure's name, corruption score, notable corruption details, and city of birth. Each marker also has a label that displays the political figure's name and city.
2. Bar Graph
•	Corruption Scores by Political Figure: A bar chart that ranks political figures by their corruption score.
•	Mean Corruption Score: A vertical dashed line represents the average corruption score across all political figures. This provides context on where each figure stands relative to the average.
•	Customizable Filters: You can filter the data by selecting specific political figures or cities, allowing for tailored analysis.
Data
The dataset (presidents_corruption_geo.csv) includes the following key columns:
•	Political.Figure: The name of the political figure.
•	Corruption.Score: A numeric score representing the level of corruption associated with each figure.
•	city: The city of birth of the political figure.
•	longitude & latitude: Geographical coordinates for plotting on the map.
•	Notable.Corruption.Details: Brief details about the corruption incidents related to each figure.
Usage
1.	Install Required Packages: Ensure you have the following R packages installed:
r
Copy code
install.packages(c("shiny", "dplyr", "leaflet", "ggplot2", "RColorBrewer"))
2.	Run the App:
o	Load your dataset into the 00_data/ directory or update the file path in the script if necessary.
o	Use the following command to run the app:
r
Copy code
shiny::runApp("path_to_your_app_directory")
3.	Explore the Data:
o	Use the dropdowns in the sidebar to filter data by political figure or city.
o	Navigate between the "Map" and "Bar Graph" tabs to explore different visualizations.
Contributions
Contributions are welcome! If you'd like to improve this app or add new features, feel free to fork the repository and submit a pull request.
License
This project is licensed under the MIT License. See the LICENSE file for details.
Contact
For any questions or suggestions, please contact the developer at manifeste1804@gmail.com

