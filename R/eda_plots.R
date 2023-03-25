"
Create all plots from analysis.
Usage: R/plots.R --input=<input> --out_dir=<out_dir>
Options:
--input=<input>       Clean data csv
--out_dir=<out_dir>   Path to training/testing data
" -> doc

source(here::here("R/functions/bar_graph.R"))
source(here::here("R/functions/hist_plot.R"))

opt <- docopt(doc)
main <- function(input, out_dir){
  
  bike_data_clean <- read_csv(input)
  
  #histogram
  
  bike_histogram <- hist_plot(bike_data_clean, 
                              bike_count, 
                              "Number of Rented Bikes per Day", 
                              "Count", 
                              "Distribution of Rented Bikes per Day",
                              15)
  
  ggsave("results/bike_histogram.png", bike_histogram)
  
  
  #ggpairs plot
  
  bike_correlations_ggpairs <- bike_data_clean %>%
    ggpairs() +
    ggtitle("Predictor Correlations") +
    theme(text = element_text(size = 12))
  
  ggsave("output/bike_correlations_ggpairs.png", bike_correlations_ggpairs)
  
}

main(opt[["--input"]], opt[["--out_dir"]])
  

  
  
  
  
  