
source(here::here("R/functions/bar_graph.R"))
source(here::here("R/functions/hist_plot.R"))
source(here::here("R/functions/scatter_plot.R"))
source(here::here("R/linear_regression_analysis.R"))
source(here::here("R/knn_regression_analysis.R"))

#histogram plot: distribution of rented bikes per day
bike_histogram <- hist_plot(bike_data_clean, 
                       bike_count, 
                       "Number of Rented Bikes per Day", 
                       "Count", 
                       "Figure 1: Distribution of Rented Bikes per Day",
                       15)


#ggpairs plot: predictor correlations 
options(repr.plot.width = 8, repr.plot.height = 8)
bike_correlations_ggpairs <- bike_training %>%
  ggpairs() +
  ggtitle("Figure 2: Predictor Correlations") +
  theme(text = element_text(size = 15))

#bar plot: strength of environmental factors on bike count
bike_count_barplot <- bar_graph(bike_cors, 
                            bike_cors$factors, 
                            bike_cors$r, 
                            "Environmental Factors", 
                            "Correlational Coefficient", 
                            "Factors", 
                            "Figure 3: Correlation Strength Between \nBike Count and Environmental Factors")

#scatter plot: regression for bike count vs temperature 
reg_bike_count_temp <- scatter_plot(bike_training, 
                          temperature, 
                          bike_count, 
                          "Temperature (°C)", 
                          "Number of Bikes Rented Per Day",     
                          "Figure 4: Best Fit Line for Bike Count vs Temperature", 15) +
  geom_smooth(method = "lm", se = FALSE)

#scatter plot: regression for bike count vs solar radiation
reg_bike_count_solar_rad <- scatter_plot(bike_training, 
                          solar_radiation, 
                          bike_count, 
                          "Solar Radiation (MJ/m2)", 
                          "Number of Bikes Rented Per Day",     
                          "Figure 5: Best Fit Line for Bike Count vs Solar Radiation", 15) +
  geom_smooth(method = "lm", se = FALSE)

#scatter plot: knn for number of bikes rented vs temperature 
knn_bike_count_temp <- scatter_plot(bike_preds_1, 
                            temperature, 
                            bike_count, 
                            "Temperature (°C)", 
                            "Number of Bikes Rented Per Day",     
                            "Figure 6: Number of Bikes Rented vs Temperature", 15) +
  geom_line(data = bike_preds_1, 
            mapping = aes(x = temperature, y = .pred), color = "blue")

#scatter plot: knn for number of bikes rented vs solar radiation
knn_bike_count_solar_rad <- scatter_plot(bike_preds_2, 
                            solar_radiation, 
                            bike_count, 
                            "Solar Radiation (MJ/m2)", 
                            "Number of Bikes Rented Per Day",     
                            "Figure 7: Number of Bikes Rented vs Solar Radiation", 15) +
  geom_line(data = bike_preds_2, 
            mapping = aes(x = solar_radiation, y = .pred), color = "blue")

