"
Create EDA plots.
Usage: R/plots.R --input=<input> --out_dir=<out_dir>
Options:
--input=<input>       Training data
--out_dir=<out_dir>   Path to directory where plots should be saved
" -> doc

library(docopt)
library(GGally)
library(tidyverse)
library(tidymodels)
library(ln.knn.regression)

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
  
  ggsave(paste0(out_dir, "/bike_histogram.png"), bike_histogram)
  
  
  #ggpairs plot
  
  bike_correlations_ggpairs <- bike_data_clean %>%
    ggpairs() +
    ggtitle("Predictor Correlations") +
    theme(text = element_text(size = 12))
  
  ggsave(paste0(out_dir, "/bike_correlations_ggpairs.png"), bike_correlations_ggpairs)
  
  # correlation bar plot
  
  bike_cors <- cor(bike_data_clean)[1,] |>
    as_tibble()
  colnames(bike_cors) <- c("r")
  bike_cors$factors <- as.factor(names(bike_data_clean))
  bike_cors <- filter(bike_cors, factors != "bike_count") |>
    mutate(r = abs(r))
  
  bike_count_barplot <- bar_graph(bike_cors, 
                                  bike_cors$factors, 
                                  bike_cors$r, 
                                  "Environmental Factors", 
                                  "Correlational Coefficient", 
                                  "Factors", 
                                  "Correlation Strength Between \nBike Count and Environmental Factors")

  ggsave(paste0(out_dir, "/bike_count_barplot.png"), bike_count_barplot)
}

main(opt[["--input"]], opt[["--out_dir"]])
  

  
  
  
  
  