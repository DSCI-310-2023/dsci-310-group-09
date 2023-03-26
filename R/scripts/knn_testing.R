"
Calculate error of knn model.
Usage: R/knn_testing.R --test_data=<test_data> --out_dir=<out_dir>
Options:
--test_data=<test_data>       Path to testing data
--out_dir=<out_dir>   Path to directory where knn rmspe value should be saved
" -> doc

library(docopt)
library(tidyverse)
library(tidymodels)

opt <- docopt(doc)
main <- function(test_data, out_dir){
  
  # Load the test data
  bike_testing <- read_csv(test_data)
  
  # Load knn model
  knn_model <- readRDS("results/knn_model.rds")
  
  # Find RMSPE
  bike_summary <- knn_model |>
    predict(bike_testing) |>
    bind_cols(bike_testing) |>
    metrics(truth = bike_count, estimate = .pred) |>
    filter(.metric == "rmse")  
  
  knn_rmspe <- bike_summary |>
    pull(.estimate)
  
  # Save RMSPE value
  saveRDS(knn_rmspe, file = paste0(out_dir, "/knn_rmspe.rds"))
}

main(opt[["--test_data"]], opt[["--out_dir"]])