source(here::here("R/eda_and_splitting.R"))

"
Usage: R/train_regression_model.R --train=<train> --out_dir=<out_dir>

Options:
--data=<data>         Path to training data 
--out_dir=<out_dir>   Path to test model 
" -> doc

library(tidyverse)
library(tidymodels)
library(kknn)
library(docopt)

opt <- docopt(doc)
main <- function(data, out_dir) {
    bike_training <- read.csv(train)
    
    
    set.seed(1000)
    
    # LM Model 1
    
    lm_spec <- linear_reg() |>
        set_engine("lm") |>
        set_mode("regression")
    
    bike_recipe_1 <- recipe(bike_count ~ temperature, data = bike_training)
    
    bike_fit_1 <- workflow() |>
        add_recipe(bike_recipe_1) |>
        add_model(lm_spec) |>
        fit(data = bike_training)
    
    lm_rmse_1 <- bike_fit_1 |>
        predict(bike_training) |>
        bind_cols(bike_training) |>
        metrics(truth = bike_count, estimate = .pred) |>
        filter(.metric == "rmse") |>
        select(.estimate) |>
        pull()
    
    
    # LM Model 2
    
    bike_recipe_2 <- recipe(bike_count ~ solar_radiation, data = bike_training)
    
    bike_fit_2 <- workflow() |>
        add_recipe(bike_recipe_2) |>
        add_model(lm_spec) |>
        fit(data = bike_training)
    
    lm_rmse_2 <- bike_fit_2 |>
        predict(bike_training) |>
        bind_cols(bike_training) |>
        metrics(truth = bike_count, estimate = .pred) |>
        filter(.metric == "rmse") |>
        select(.estimate) |>
        pull()
    
    
    # LM Model 3
    
    bike_recipe_3 <- recipe(bike_count ~ temperature + solar_radiation, data = bike_training)
    
    bike_fit_3 <- workflow() |>
        add_recipe(bike_recipe_3) |>
        add_model(lm_spec) |>
        fit(data = bike_training)
    
    lm_rmse_3 <- bike_fit_3 |>
        predict(bike_training) |>
        bind_cols(bike_training) |>
        metrics(truth = bike_count, estimate = .pred) |>
        filter(.metric == "rmse") |>
        select(.estimate) |>
        pull()
    
    
    #KNN Model 1
    set.seed(1000)
    
    
    bike_spec_1 <- nearest_neighbor(weight_func = "rectangular", neighbors = tune()) |> 
        set_engine("kknn") |>
        set_mode("regression") 
    
    bike_recipe_1 <- recipe(bike_count ~ temperature, data = bike_training) |>
        step_scale(all_predictors()) |>
        step_center(all_predictors())
    
    bike_vfold_1 <- vfold_cv(bike_training, v = 10, strata = bike_count)
    
    bike_workflow_1 <- workflow() |>
        add_recipe(bike_recipe_1) |>
        add_model(bike_spec_1)
    
    gridvals <- tibble(neighbors = seq(from = 1, to = 100))
    
    bike_results_1 <- bike_workflow_1 |>
        tune_grid(resamples = bike_vfold_1, grid = gridvals) |>
        collect_metrics() 
    
    bike_min_1 <- bike_results_1 |>
        filter(.metric == "rmse") |>
        arrange(mean) |> 
        slice(1)
    
    k_min_1 <- bike_min_1 |>
        pull(neighbors)
    
    knn_rmse_1 <- bike_min_1 |>
        pull(mean)
    
    bike_best_spec_1 <- nearest_neighbor(weight_func = "rectangular", neighbors = k_min_1) |>
        set_engine("kknn") |>
        set_mode("regression")
    
    bike_best_fit_1 <- workflow() |>
        add_recipe(bike_recipe_1) |>
        add_model(bike_best_spec_1) |>
        fit(data = bike_training)
    
    bike_summary_1 <- bike_best_fit_1 |>
        predict(bike_testing) |>
        bind_cols(bike_testing) |>
        metrics(truth = bike_count, estimate = .pred) |>
        filter(.metric == "rmse")       
    
    #KNN Model 2
    bike_spec_2 <- nearest_neighbor(weight_func = "rectangular", neighbors = tune()) |> 
        set_engine("kknn") |>
        set_mode("regression") 
    
    bike_recipe_2 <- recipe(bike_count ~ solar_radiation, data = bike_training) |>
        step_scale(all_predictors()) |>
        step_center(all_predictors())
    
    bike_vfold_2 <- vfold_cv(bike_training, v = 10, strata = bike_count)
    
    bike_workflow_2 <- workflow() |>
        add_recipe(bike_recipe_2) |>
        add_model(bike_spec_2)
    
    gridvals <- tibble(neighbors = seq(from = 1, to = 100))
    
    bike_results_2 <- bike_workflow_2 |>
        tune_grid(resamples = bike_vfold_2, grid = gridvals) |>
        collect_metrics() 
    
    bike_min_2 <- bike_results_2 |>
        filter(.metric == "rmse") |>
        arrange(mean) |> 
        slice(1)
    
    k_min_2 <- bike_min_2 |>
        pull(neighbors)
    
    knn_rmse_2 <- bike_min_2 |>
        pull(mean)
    
    bike_best_spec_2 <- nearest_neighbor(weight_func = "rectangular", neighbors = k_min_2) |>
        set_engine("kknn") |>
        set_mode("regression")
    
    bike_best_fit_2 <- workflow() |>
        add_recipe(bike_recipe_2) |>
        add_model(bike_best_spec_2) |>
        fit(data = bike_training)
    
    #KNN Model 3
    bike_spec_3 <- nearest_neighbor(weight_func = "rectangular", neighbors = tune()) |> 
        set_engine("kknn") |>
        set_mode("regression") 
    
    bike_recipe_3 <- recipe(bike_count ~ temperature + solar_radiation, data = bike_training) |>
        step_scale(all_predictors()) |>
        step_center(all_predictors())
    
    bike_vfold_3 <- vfold_cv(bike_training, v = 10, strata = bike_count)
    
    bike_workflow_3 <- workflow() |>
        add_recipe(bike_recipe_3) |>
        add_model(bike_spec_3)
    
    gridvals <- tibble(neighbors = seq(from = 1, to = 100))
    
    bike_results_3 <- bike_workflow_3 |>
        tune_grid(resamples = bike_vfold_3, grid = gridvals) |>
        collect_metrics() 
    
    bike_min_3 <- bike_results_3 |>
        filter(.metric == "rmse") |>
        arrange(mean) |> 
        slice(1)
    
    k_min_3 <- bike_min_3 |>
        pull(neighbors)
    
    knn_rmse_3 <- bike_min_3 |>
        pull(mean)
    
    bike_best_spec_3 <- nearest_neighbor(weight_func = "rectangular", neighbors = k_min_3) |>
        set_engine("kknn") |>
        set_mode("regression")
    
    bike_best_fit_3 <- workflow() |>
        add_recipe(bike_recipe_3) |>
        add_model(bike_best_spec_3) |>
        fit(data = bike_training)
    
    saveRDS(ln_knn_model, file = paste0(out_dir, "/ln_knn_model.rds"))
}

main(opt[["--data"]], opt[["--out_dir"]])

