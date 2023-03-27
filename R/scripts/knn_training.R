"
Usage: R/knn_training.R --train_data=<train_data> --out_dir=<out_dir>
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
  
  # Create knn spec
  bike_spec <- nearest_neighbor(weight_func = "rectangular", neighbors = tune()) |> 
    set_engine("kknn") |>
    set_mode("regression") 
  
  # Create recipe using temperature & solar radiation as predictors 
  bike_recipe <- recipe(bike_count ~ temperature + solar_radiation, data = bike_training) |>
    step_scale(all_predictors()) |>
    step_center(all_predictors())
  
  # Perform cross validation
  bike_vfold <- vfold_cv(bike_training, v = 10, strata = bike_count)
  
  bike_workflow <- workflow() |>
    add_recipe(bike_recipe) |>
    add_model(bike_spec)
  
  gridvals <- tibble(neighbors = seq(from = 1, to = 100))
  
  bike_results <- bike_workflow |>
    tune_grid(resamples = bike_vfold, grid = gridvals) |>
    collect_metrics() 
  
  # Find best K value
  bike_min <- bike_results |>
    filter(.metric == "rmse") |>
    arrange(mean) |> 
    slice(1)
  
  k_min <- bike_min |>
    pull(neighbors)
  
  knn_rmse <- bike_min |>
    pull(mean)
  
  # Create model with optimal K value
  bike_best_spec <- nearest_neighbor(weight_func = "rectangular", neighbors = k_min) |>
    set_engine("kknn") |>
    set_mode("regression")
  
  knn_model <- workflow() |>
    add_recipe(bike_recipe) |>
    add_model(bike_best_spec) |>
    fit(data = bike_training)
  
  # Save model
  saveRDS(knn_model, file = paste0(out_dir, "/knn_model.rds"))
  
  # Save k_min value
  saveRDS(k_min, file = paste0(out_dir, "/k_min.rds"))
}

main(opt[["--train_data"]], opt[["--out_dir"]])
  
  