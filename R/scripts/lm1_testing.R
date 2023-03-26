"
Calculate error of lm model.
Usage: R/lm1_testing.R --test_data=<test_data> --out_dir=<out_dir>
Options:
--test_data=<test_data>       Path to testing data
--out_dir=<out_dir>   Path to directory where knn rmspe value should be saved
" -> doc

library(docopt)
library(tidyverse)
library(tidymodels)

source(here::here("R/functions/scatter_plot.R"))

opt <- docopt(doc)
main <- function(test_data, out_dir){
  
  # Load the test data
  bike_testing <- read_csv(test_data)
  
  # Load lm model
  lm1_model <- readRDS("results/lm1_model.rds")
  
  # Load bike training set
  bike_training <- read_csv("data/bike_training.csv")
  
  # Find RMSPE value
  lm_rmspe_1 <- lm1_model |>
    predict(bike_testing) |>
    bind_cols(bike_testing) |>
    metrics(truth = bike_count, estimate = .pred) |>
    filter(.metric == "rmse") |>
    select(.estimate) |>
    pull()
  
  # Create scatter plot
  lm_bike_count_temp <- scatter_plot(bike_training, 
                                     temperature, 
                                     bike_count, 
                                     "Temperature (°C)", 
                                     "Number of Bikes Rented Per Day",     
                                     "Best Fit Line for Bike Count vs Temperature", 15) +
    geom_smooth(method = "lm", se = FALSE)
  
  # Save plot
  ggsave(paste0(out_dir, "/lm_bike_count_temp.png"), lm_bike_count_temp)
  
  # Save RMSPE value
  saveRDS(lm_rmspe_1, file = paste0(out_dir, "/lm_rmspe_1.rds"))
}

main(opt[["--test_data"]], opt[["--out_dir"]])
