"
Usage: R/lm1_training.R --train_data=<train_data> --out_dir=<out_dir>
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
  
  # Create recipe
  bike_recipe_1 <- recipe(bike_count ~ temperature, data = bike_training)
  
  # Create model
  lm1_model <- linearmodel(bike_recipe_1, bike_training)
  
  intercept_1 <- lm1_model |>
    tidy() |>
    slice(1) |>
    pull(estimate)
  
  slope_1 <- lm1_model |>
    tidy() |>
    slice(2) |>
    pull(estimate)
  
  # Save model & equation coefficients
  saveRDS(lm1_model, file = paste0(out_dir, "/lm1_model.rds"))
  saveRDS(slope_1, file = paste0(out_dir, "/slope_1.rds"))
  saveRDS(intercept_1, file = paste0(out_dir, "/intercept_1.rds"))
}

main(opt[["--train_data"]], opt[["--out_dir"]])