"
Calculate error of knn model.
Usage: R/knn1_testing.R --test_data=<test_data> --out_dir=<out_dir>
Options:
--test_data=<test_data>       Path to testing data
--out_dir=<out_dir>   Path to directory where knn rmspe value should be saved
" -> doc

library(docopt)
library(tidyverse)
library(tidymodels)
library(ln.knn.regression)

opt <- docopt(doc)
main <- function(test_data, out_dir){
  
  # Load the test data
  bike_testing <- read_csv(test_data)
  
  # Load bike training set
  bike_training <- read_csv("data/bike_training.csv")
  
  # Load knn model
  knn_model_1 <- readRDS("results/knn_model_1.rds")
  
  # Find RMSPE
  knn_rmspe_1 <- model_rmspe(knn_model_1, bike_testing, "bike_count")
  
  # Save RMSPE value
  saveRDS(knn_rmspe_1, file = paste0(out_dir, "/knn_rmspe_1.rds"))
  
  # create plot
  knn_prediction_1 <- knn_model_1 |>
    stats::predict(bike_training) |>
    dplyr::bind_cols(bike_training)
  
  knn_bike_count_temp <- scatter_plot(knn_prediction_1, 
                                          temperature, 
                                          bike_count, 
                                          "Temperature (°C)", 
                                          "Number of Bikes Rented Per Day",     
                                          "KNN model for Bike Count", 
                                          15, 
                                          "knn")
  
  # Save plot
  ggsave(paste0(out_dir, "/knn_bike_count_temp.png"), knn_bike_count_temp)
}

main(opt[["--test_data"]], opt[["--out_dir"]])