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
                            "Distribution of Rented Bikes per Day",
                            15)

ggsave("output/bike_histogram.png", bike_histogram)

#ggpairs plot: predictor correlations 
options(repr.plot.width = 8, repr.plot.height = 8)
bike_correlations_ggpairs <- bike_training %>%
  ggpairs() +
  ggtitle("Predictor Correlations") +
  theme(text = element_text(size = 12))

ggsave("output/bike_correlations_ggpairs.png", bike_correlations_ggpairs)

#bar plot: strength of environmental factors on bike count
bike_count_barplot <- bar_graph(bike_cors, 
                                bike_cors$factors, 
                                bike_cors$r, 
                                "Environmental Factors", 
                                "Correlational Coefficient", 
                                "Factors", 
                                "Correlation Strength Between \nBike Count and Environmental Factors")

ggsave("output/bike_count_barplot.png", bike_count_barplot)

#scatter plot: regression for bike count vs temperature 
lm_bike_count_temp <- scatter_plot(bike_training, 
                                    temperature, 
                                    bike_count, 
                                    "Temperature (°C)", 
                                    "Number of Bikes Rented Per Day",     
                                    "Best Fit Line for Bike Count vs Temperature", 15) +
  geom_smooth(method = "lm", se = FALSE)

ggsave("output/lm_bike_count_temp.png", lm_bike_count_temp)

#scatter plot: regression for bike count vs solar radiation
lm_bike_count_solar_rad <- scatter_plot(bike_training, 
                                         solar_radiation, 
                                         bike_count, 
                                         "Solar Radiation (MJ/m2)", 
                                         "Number of Bikes Rented Per Day",     
                                         "Best Fit Line for Bike Count vs Solar Radiation", 15) +
  geom_smooth(method = "lm", se = FALSE)

ggsave("output/lm_bike_count_solar_rad.png", lm_bike_count_solar_rad)

#scatter plot: knn for number of bikes rented vs temperature 
knn_bike_count_temp <- scatter_plot(bike_preds_1, 
                                    temperature, 
                                    bike_count, 
                                    "Temperature (°C)", 
                                    "Number of Bikes Rented Per Day",     
                                    "Number of Bikes Rented vs Temperature", 15) +
  geom_line(data = bike_preds_1, 
            mapping = aes(x = temperature, y = .pred), color = "blue")

ggsave("output/knn_bike_count_temp.png", knn_bike_count_temp)

#scatter plot: knn for number of bikes rented vs solar radiation
knn_bike_count_solar_rad <- scatter_plot(bike_preds_2, 
                                         solar_radiation, 
                                         bike_count, 
                                         "Solar Radiation (MJ/m2)", 
                                         "Number of Bikes Rented Per Day",     
                                         "Number of Bikes Rented vs Solar Radiation", 15) +
  geom_line(data = bike_preds_2, 
            mapping = aes(x = solar_radiation, y = .pred), color = "blue")

ggsave("output/knn_bike_count_solar_rad.png", knn_bike_count_solar_rad)


