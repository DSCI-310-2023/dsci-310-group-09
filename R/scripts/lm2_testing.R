"
Calculate error of lm model.
Usage: R/lm2_testing.R --test_data=<test_data> --out_dir=<out_dir>
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
  lm2_model <- readRDS("results/lm2_model.rds")
  
  # Load bike training set
  bike_training <- read_csv("data/bike_training.csv")
  
  # find rmspe value
  lm_rmspe_2 <- model_rmspe(lm2_model, bike_testing, "bike_count")
  
  # create plot
  lm_bike_count_solar_rad <- scatter_plot(bike_training, 
                                          solar_radiation, 
                                          bike_count, 
                                          "Solar Radiation (MJ/m2)", 
                                          "Number of Bikes Rented Per Day",     
                                          "Best Fit Line for Bike Count vs Solar Radiation", 
                                          15, 
                                          "lm")
  
  
  # Save plot
  ggsave(paste0(out_dir, "/lm_bike_count_solar_rad.png"), lm_bike_count_solar_rad)
  
  # Save RMSPE value
  saveRDS(lm_rmspe_2, file = paste0(out_dir, "/lm_rmspe_2.rds"))
}

main(opt[["--test_data"]], opt[["--out_dir"]])
