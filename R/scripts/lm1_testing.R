"
Calculate error of lm model.
Usage: R/lm1_testing.R --test_data=<test_data> --out_dir=<out_dir>
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
  
  # Load lm model
  lm1_model <- readRDS("results/lm1_model.rds")
  
  # Load bike training set
  bike_training <- read_csv("data/bike_training.csv")
  
  # Find RMSPE value
  lm_rmspe_1 <- model_rmspe(lm1_model, bike_testing, "bike_count")
  
  # Create scatter plot
  lm_bike_count_temp <- scatter_plot(bike_training, 
                                     temperature, 
                                     bike_count, 
                                     "Temperature (°C)", 
                                     "Number of Bikes Rented Per Day",     
                                     "Best Fit Line for Bike Count vs Temperature", 15, "lm")
  
  # Save plot
  ggsave(paste0(out_dir, "/lm_bike_count_temp.png"), lm_bike_count_temp)
  
  # Save RMSPE value
  saveRDS(lm_rmspe_1, file = paste0(out_dir, "/lm_rmspe_1.rds"))
}

main(opt[["--test_data"]], opt[["--out_dir"]])
