"
Usage: R/lm2_training.R --train_data=<train_data> --out_dir=<out_dir>
Options:
--train_data=<train_data>       Path to training data
--out_dir=<out_dir>   Path to directory where model is saved
" -> doc

library(docopt)
library(tidyverse)
library(tidymodels)
library(ln.knn.regression)

opt <- docopt(doc)
main <- function(train_data, out_dir) {
  
  # Load training data
  bike_training <- read_csv(train_data)
  
  # Build model
  bike_recipe_2 <- recipe(bike_count ~ solar_radiation, data = bike_training)
  
  lm2_model <- linearmodel(bike_recipe_2, bike_training)
  
  # Extract intercept + slope
  intercept_2 <- lm2_model |>
    tidy() |>
    slice(1) |>
    pull(estimate)
  
  slope_2 <- lm2_model |>
    tidy() |>
    slice(2) |>
    pull(estimate)
  
  # Save model & equation coefficients
  saveRDS(lm2_model, file = paste0(out_dir, "/lm2_model.rds"))
  saveRDS(slope_2, file = paste0(out_dir, "/slope_2.rds"))
  saveRDS(intercept_2, file = paste0(out_dir, "/intercept_2.rds"))
}

main(opt[["--train_data"]], opt[["--out_dir"]])
  