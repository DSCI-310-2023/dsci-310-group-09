# helper histogram plot for hist_plot()

library(ggplot2)

test_data_hist <- data.frame(x= c(5, 6, 7, 8, 5, 5, 6, 7, 7, 7, 7, 7, 8))


test_data_hist

helper_hist <- ggplot(test_data_hist, aes(x = x)) +
    geom_histogram() +
    labs(x = "x", y = "count") +
    ggtitle("Histogram Test") 
helper_hist


