"
Usage: R/lm_training.R --train_data=<train_data> --out_dir=<out_dir>
Options:
--train_data=<train_data>       Path to training data
--out_dir=<out_dir>   Path to directory where model is saved
" -> doc

library(docopt)
library(tidyverse)
library(tidymodels)

opt <- docopt(doc)
main <- function(train_data, out_dir) {
  
  # Load training data
  bike_training <- read_csv(train_data)
  
  # Create lm spec
  lm_spec <- linear_reg() |>
    set_engine("lm") |>
    set_mode("regression")
  
  # Create recipe
  bike_recipe <- recipe(bike_count ~ temperature + solar_radiation, data = bike_training)
  
  # Create model
  lm_model <- workflow() |>
    add_recipe(bike_recipe) |>
    add_model(lm_spec) |>
    fit(data = bike_training)
  
  # Extract intercept + slope
  intercept_3 <- lm_model |>
    tidy() |>
    slice(1) |>
    pull(estimate)
  
  slope_3_temp <- lm_model |>
    tidy() |>
    slice(2) |>
    pull(estimate)
  
  slope_3_sol_rad <- lm_model |>
    tidy() |>
    slice(3) |>
    pull(estimate)
  
  # Save model
  saveRDS(lm_model, file = paste0(out_dir, "/lm_model.rds"))

  # Save intercepts + coefficients
  saveRDS(intercept_3, file = paste0(out_dir, "/intercept_3.rds"))
  saveRDS(slope_3_temp, file = paste0(out_dir, "/slope_3_temp.rds"))
  saveRDS(slope_3_sol_rad, file = paste0(out_dir, "/slope_3_sol_rad.rds"))
  

} 

main(opt[["--train_data"]], opt[["--out_dir"]])