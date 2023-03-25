"
Assess model's accuracy on a test data set.
Usage: R/regression_results.R --test=<train> --out_dir=<out_dir>
Options:
--test=<test>       Path to testing data
--out_dir=<out_dir>   Path to directory where the plots should be saved
" -> doc

opt <- docopt(doc)
main <- function(test, out_dir){
  
  # Load testing data
  bike_testing <- read_csv(test)
  
  # LM 1
  
  lm_rmspe_1 <- bike_fit_1 |>
    predict(bike_testing) |>
    bind_cols(bike_testing) |>
    metrics(truth = bike_count, estimate = .pred) |>
    filter(.metric == "rmse") |>
    select(.estimate) |>
    pull()
  
  # LM 2
  
  lm_rmspe_2 <- bike_fit_2 |>
    predict(bike_testing) |>
    bind_cols(bike_testing) |>
    metrics(truth = bike_count, estimate = .pred) |>
    filter(.metric == "rmse") |>
    select(.estimate) |>
    pull()
  
  # LM 3
  
  lm_rmspe_3 <- bike_fit_3 |>
    predict(bike_testing) |>
    bind_cols(bike_testing) |>
    metrics(truth = bike_count, estimate = .pred) |>
    filter(.metric == "rmse") |>
    select(.estimate) |>
    pull()
  
  # KNN 1
  
  bike_summary_1 <- bike_best_fit_1 |>
    predict(bike_testing) |>
    bind_cols(bike_testing) |>
    metrics(truth = bike_count, estimate = .pred) |>
    filter(.metric == "rmse")       
  
  knn_rmspe_1 <- bike_summary_1 |>
    pull(.estimate)
  
  # KNN 2
  
  bike_summary_2 <- bike_best_fit_2 |>
    predict(bike_testing) |>
    bind_cols(bike_testing) |>
    metrics(truth = bike_count, estimate = .pred) |>
    filter(.metric == "rmse")   
  
  knn_rmspe_2 <- bike_summary_2 |>
    pull(.estimate)
  
  # KNN 3 
  
  bike_summary_3 <- bike_best_fit_3 |>
    predict(bike_testing) |>
    bind_cols(bike_testing) |>
    metrics(truth = bike_count, estimate = .pred) |>
    filter(.metric == "rmse")  
  
  knn_rmspe_3 <- bike_summary_3 |>
    pull(.estimate)
  
