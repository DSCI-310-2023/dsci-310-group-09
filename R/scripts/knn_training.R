"
Usage: R/knn_training.R --train_data=<train_data> --out_dir=<out_dir>
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
  
  set.seed(1008)
  
  # Load training data
  bike_training <- read_csv(train_data)
  
  # Create recipe using temperature & solar radiation as predictors 
  bike_recipe <- recipe(bike_count ~ temperature + solar_radiation, data = bike_training) |>
    step_scale(all_predictors()) |>
    step_center(all_predictors())
  
  # Build model
  knn_model_3 <- knn_model(bike_recipe, bike_training, "bike_count")
  
  # Find best K value
  k_min <- 9
  
  # Save model
  saveRDS(knn_model_3, file = paste0(out_dir, "/knn_model_3.rds"))
  
  # Save k_min value
  saveRDS(k_min, file = paste0(out_dir, "/k_min.rds"))
}

main(opt[["--train_data"]], opt[["--out_dir"]])
  
  