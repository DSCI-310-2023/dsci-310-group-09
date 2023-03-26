library(testthat)
library(tidyverse)
library(ggcheck)

source("./R/scatter_plot.R")
source("./tests/scatter_plot_tests_helper.R")

#test for input variables
test_that("Function can only accept certain data types for arguments", {
    expect_error(scatter_plot(test_data_scatter, "x", y, "x", "y", "title", 10))
    expect_error(scatter_plot(test_data_scatter, x, "y", "x", "y", "title", 10))
    expect_error(scatter_plot(test_data_scatter, x, y, x, "y", "title", 10))
    expect_error(scatter_plot(test_data_scatter, x, y, "x", y, "title", 10))
    expect_error(scatter_plot(test_data_scatter, x, y, "x", "y", 10, 10))
    expect_error(scatter_plot(test_data_scatter, x, y, "x", "y", "title", "10"))
    
})


#test for output variables 
test_that("Checks the output of the graph", {
    plot <- scatter_plot(test_data_scatter, x, y, "x", "y", "Scatterplot Test", 10)
    expect_true(is.ggplot(plot))
    expect_equal(xlab(plot)$label, xlab(test_data_scatter)$label)
    expect_equal(ylab(plot)$label, ylab(test_data_scatter)$label)
    expect_equal(ggtitle(plot)$label, ggtitle(test_data_scatter)$label)
    
})



