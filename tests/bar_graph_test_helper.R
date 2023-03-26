#helper function  

library(tidyverse)
library(ggplot2)


test_data <- data.frame(x = c("a", "a", "c", "b"), y = c(5, 6, 7, 8))
test_data$x <- as.factor(test_data$x)


expected_bar_graph <- ggplot(test_data, aes(x = x, y = y, fill = x)) +
    geom_bar(stat = "identity", position = "dodge") +
    labs(x = "x", y = "y", fill = "x") + 
    ggtitle("Bar Graph Test") + 
    theme(axis.text.x = element_text(angle = 90, hjust = 1),
          text = element_text(size = 15),
          panel.background = element_rect(fill = 'darkgrey', color = 'purple'),
          plot.title = element_text(hjust = 0.5)) +
    scale_fill_brewer(palette = 'GnBu')
expected_bar_graph

