library(tidyverse)
library(tidymodels)
library(GGally)
library(kknn)
options(repr.matrix.max.rows = 10)


source("../R/bar_plot.R")
source("../R/hist_plot.R")
source("../R/scatter_plot.R")
source("../R/summarize_column.R")

bike_data <- read_csv("https://archive.ics.uci.edu/ml/machine-learning-databases/00560/SeoulBikeData.csv", locale=locale(encoding="latin1"))
bike_data


colnames(bike_data) <- c("date", "bike_count", "hour", "temperature", "humidity", "wind_speed", "visibility", "dew_point_temp", "solar_radiation", "rainfall", "snowfall", "seasons", "holiday", "functioning_day") 

bike_data_clean <- bike_data |>
  filter(functioning_day == "Yes") |>
  group_by(date) |>
  summarize(bike_count = sum(bike_count), 
            temperature = mean(temperature),
            humidity = mean(humidity),
            wind_speed = mean(wind_speed),
            visibility = mean(visibility),
            dew_point_temp = mean(dew_point_temp),
            solar_radiation = mean(solar_radiation),
            rainfall = mean(rainfall),
            snowfall = mean(snowfall)) |>
  select(-date)
bike_data_clean


bike_hist <- hist_plot(bike_data_clean, 
                       bike_count, 
                       "Number of Rented Bikes per Day", 
                       "Count", 
                       "Figure 1: Distribution of Rented Bikes per Day",
                       15)
bike_hist

bike_param <- bike_data_clean %>%
  summarize(mean = mean(bike_count),
            med = median(bike_count),
            sd = sd(bike_count))
bike_param



