# title: "Bike Share Analysis and Daily Users Predictor"
# author: "Vera Danilova, Jenna Le Noble, Moira Renata, Yuyang Wang"
# date: 2023-03-22

"
Loads bike data (downloaded from
https://archive.ics.uci.edu/ml/machine-learning-databases/00560/SeoulBikeData.csv
and generates figures and tables related to biking in Seoul.

Usage: src/generate_figures.R --input_dir=<input_dir>  --out_dir=<output_dir> 

Options:
--input_dir=<input_dir>		Path (including filename) to raw data
--out_dir=<output_dir>		Path to directory where the results should be saved
" -> doc


library(docopt)
library(gridExtra)
library(knitr)
library(tidyverse)

source(here::here("R/plots_analysis.R"))

opt <- docopt(doc)

main <- function(input_dir, out_dir) {
  # Create out_dir if it does not exist
  if (!dir.exists(out_dir)) {
    dir.create(out_dir)
  }
  
  #histogram plot: distribution of rented bikes per day
  bike_histogram <- hist_plot(bike_data_clean, 
                              bike_count, 
                              "Number of Rented Bikes per Day", 
                              "Count", 
                              "Figure 1: Distribution of Rented Bikes per Day",
                              15)
  ggsave("bike_histogram.png", device = "png", path = out_dir, width = 10, height = 7)
  
  #ggpairs plot: predictor correlations 
  options(repr.plot.width = 8, repr.plot.height = 8)
  bike_correlations_ggpairs <- bike_training %>%
    ggpairs() +
    ggtitle("Figure 2: Predictor Correlations") +
    theme(text = element_text(size = 15))
  
  ggsave("bike_correlations_ggpairs.png", device = "png", path = out_dir, width = 10, height = 7)
  
  #bar plot: strength of environmental factors on bike count
  bike_count_barplot <- bar_graph(bike_cors, 
                                  bike_cors$factors, 
                                  bike_cors$r, 
                                  "Environmental Factors", 
                                  "Correlational Coefficient", 
                                  "Factors", 
                                  "Figure 3: Correlation Strength Between \nBike Count and Environmental Factors")
  ggsave("bike_count_barplot.png", device = "png", path = out_dir, width = 10, height = 7)
  
  
  #scatter plot: regression for bike count vs temperature 
  reg_bike_count_temp <- scatter_plot(bike_training, 
                                      temperature, 
                                      bike_count, 
                                      "Temperature (°C)", 
                                      "Number of Bikes Rented Per Day",     
                                      "Figure 4: Best Fit Line for Bike Count vs Temperature", 15) +
    geom_smooth(method = "lm", se = FALSE)
  ggsave("reg_bike_count_temp.png", device = "png", path = out_dir, width = 10, height = 7)
  
  
  #scatter plot: regression for bike count vs solar radiation
  reg_bike_count_solar_rad <- scatter_plot(bike_training, 
                                           solar_radiation, 
                                           bike_count, 
                                           "Solar Radiation (MJ/m2)", 
                                           "Number of Bikes Rented Per Day",     
                                           "Figure 5: Best Fit Line for Bike Count vs Solar Radiation", 15) +
    geom_smooth(method = "lm", se = FALSE)
  ggsave("reg_bike_count_solar_rad.png", device = "png", path = out_dir, width = 10, height = 7)
  
  #scatter plot: knn for number of bikes rented vs temperature 
  knn_bike_count_temp <- scatter_plot(bike_preds_1, 
                                      temperature, 
                                      bike_count, 
                                      "Temperature (°C)", 
                                      "Number of Bikes Rented Per Day",     
                                      "Figure 6: Number of Bikes Rented vs Temperature", 15) +
    geom_line(data = bike_preds_1, 
              mapping = aes(x = temperature, y = .pred), color = "blue")
  ggsave("knn_bike_count_temp.png", device = "png", path = out_dir, width = 10, height = 7)
  
  #scatter plot: knn for number of bikes rented vs solar radiation
  knn_bike_count_solar_rad <- scatter_plot(bike_preds_2, 
                                           solar_radiation, 
                                           bike_count, 
                                           "Solar Radiation (MJ/m2)", 
                                           "Number of Bikes Rented Per Day",     
                                           "Figure 7: Number of Bikes Rented vs Solar Radiation", 15) +
    geom_line(data = bike_preds_2, 
              mapping = aes(x = solar_radiation, y = .pred), color = "blue")
  
  ggsave("knn_bike_count_solar_rad.png", device = "png", path = out_dir, width = 10, height = 7)
  
}

main(opt[["--input_dir"]], opt[["--out_dir"]])

