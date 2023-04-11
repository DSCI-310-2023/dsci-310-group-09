"
Calculate error of lm model.
Usage: R/lm_testing.R --test_data=<test_data> --out_dir=<out_dir>
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
  lm_model <- readRDS("results/lm_model.rds")
  
  # Find RMSPE value
  lm_rmspe <- model_rmspe(lm_model, bike_testing, "bike_count")
  
  # Save RMSPE value
  saveRDS(lm_rmspe, file = paste0(out_dir, "/lm_rmspe.rds"))
}

main(opt[["--test_data"]], opt[["--out_dir"]])
  
  