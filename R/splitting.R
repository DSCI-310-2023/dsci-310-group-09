source(here::here("R/data_loading_cleaning.R"))
source(here::here("R/functions/summarize_column.R"))

"
Usage: R/train_regression_model.R <data> <out_dir>

" -> doc


set.seed(2020)

opt <- docopt(doc)
main <- function(data, out_dir){
    bike_data_clean <- read.csv(data)
    
    #split training and testing data
    bike_split <- initial_split(bike_data_clean, prop = 0.7, strata = bike_count)
    bike_training <- training(bike_split)
    bike_testing <- testing(bike_split)
    
    #write csv data to create table 
    write_csv(bike_training, paste0(out_dir, "/bike_training.csv"))
    write_csv(bike_testing, paste0(out_dir, "/bike_testing.csv"))
}

main(opt[["--data"]], opt[["--out_dir"]])
