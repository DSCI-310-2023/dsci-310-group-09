"
Usage: R/knn1_training.R --train_data=<train_data> --out_dir=<out_dir>
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
  
  set.seed(1000)
  
  # Load training data
  bike_training <- read_csv(train_data)
  
  # Create recipe using temperature & solar radiation as predictors 
  bike_recipe_1 <- recipe(bike_count ~ temperature, data = bike_training) |>
    step_scale(all_predictors()) |>
    step_center(all_predictors())
  
  # Build model
  knn_model_1 <- knn_model(bike_recipe_1, bike_training, "bike_count")
  
  # Find best K value
  k_min_1 <- 27
  
  # Save model
  saveRDS(knn_model_1, file = paste0(out_dir, "/knn_model_1.rds"))
  
  # Save k_min value
  saveRDS(k_min_1, file = paste0(out_dir, "/k_min_1.rds"))
}

main(opt[["--train_data"]], opt[["--out_dir"]])