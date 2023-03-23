title:'DSCI-310-GROUP-09'

library(tidyverse)
library(tidymodels)
library(GGally)
library(kknn)
options(repr.matrix.max.rows = 10)




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






