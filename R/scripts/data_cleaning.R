"
Clean and tidy the data.
Usage: R/data_cleaning.R --input=<input> --out_dir=<out_dir>
Options:
--input=<input>       Path to raw data
--out_dir=<out_dir>   Path to clean data
" -> doc

library(docopt)
library(tidyverse)
library(tidymodels)
library(ln.knn.regression)

opt <- docopt(doc)
main <- function(input, out_dir){
  
  bike_data <- read_csv(input)
  
  colnames(bike_data) <- c("date", 
                           "bike_count", 
                           "hour", 
                           "temperature", 
                           "humidity", 
                           "wind_speed", 
                           "visibility", 
                           "dew_point_temp", 
                           "solar_radiation", 
                           "rainfall", 
                           "snowfall", 
                           "seasons", 
                           "holiday", 
                           "functioning_day")
  
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
  
  write_csv(bike_data_clean, paste0(out_dir, "/bike_data_clean.csv"))
}

main(opt[["--input"]], opt[["--out_dir"]])