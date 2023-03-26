"
Usage: R/lm2_training.R --train_data=<train_data> --out_dir=<out_dir>
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
  
  # Build spec
  lm_spec <- linear_reg() |>
    set_engine("lm") |>
    set_mode("regression")
  
  # Build model
  bike_recipe_2 <- recipe(bike_count ~ solar_radiation, data = bike_training)
  
  lm2_model <- workflow() |>
    add_recipe(bike_recipe_2) |>
    add_model(lm_spec) |>
    fit(data = bike_training)
  
  # Extract intercept + slope
  intercept_2 <- lm2_model |>
    tidy() |>
    slice(1) |>
    pull(estimate)
  
  slope_2 <- lm2_model |>
    tidy() |>
    slice(2) |>
    pull(estimate)
  
  # Find rmse value
  lm_rmse_2 <- lm2_model |>
    predict(bike_training) |>
    bind_cols(bike_training) |>
    metrics(truth = bike_count, estimate = .pred) |>
    filter(.metric == "rmse") |>
    select(.estimate) |>
    pull()
  
  # Save model & equation coefficients
  saveRDS(lm2_model, file = paste0(out_dir, "/lm2_model.rds"))
  saveRDS(slope_2, file = paste0(out_dir, "/slope_2.rds"))
  saveRDS(intercept_2, file = paste0(out_dir, "/intercept_2.rds"))
}

main(opt[["--train_data"]], opt[["--out_dir"]])
  