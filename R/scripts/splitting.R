"
Split training and testing data.
Usage: R/scripts/splitting.R --data=<data> --out_dir=<out_dir> 
Options:
--data=<data>         Path to clean data
--out_dir=<out_dir>   Path to directory where training/testing sets should be saved
" -> doc

source(here::here("R/functions/summarize_column.R"))

library(docopt)
library(tidyverse)
library(tidymodels)
library(GGally)
library(kknn)
library(here)
library(knitr)
library(bookdown)
library(tinytex)

set.seed(2020)

opt <- docopt(doc)
main <- function(data, out_dir){
    bike_data_clean <- read_csv(data)
    
    #split training and testing data
    bike_split <- initial_split(bike_data_clean, prop = 0.7, strata = bike_count)
    bike_training <- training(bike_split)
    bike_testing <- testing(bike_split)
    
    #write csv data to create table 
    write_csv(bike_training, paste0(out_dir, "/bike_training.csv"))
    write_csv(bike_testing, paste0(out_dir, "/bike_testing.csv"))
}

main(opt[["--data"]], opt[["--out_dir"]])