# world-cup

Data containing the game time when World Cup goals have been scored.  The data was scraped from Wikipedia and covers all World Cups though 2018.  The R script `world_cup_goals_data.R` has the code that was used to acquire the data, and that raw data from Wikipedia is in the file `original_goals.csv`. A small amount of data cleaning/processing was done to create the file `updated_goals.csv`.  That code can be found in `world_cup_goals_cleaning.R`.  Finally, `world_cup_goals_plots.R` has code to create some simple histograms for visualization.  A few plots can be found [here](https://imgur.com/a/0FeZR9G) and an interactive Shiny App is [here](https://tylerlewiscook.shinyapps.io/WorldCupGoals/).
