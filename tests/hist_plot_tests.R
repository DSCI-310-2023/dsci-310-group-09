library(testthat)
library(ggcheck)
library(tidyverse)

source(here::here("R/functions/hist_plot.R"))
source(here::here("tests/hist_plot_tests_helper.R"))

#test for input variables
test_that("Function can only accept certain data types for arguments", {
    expect_error(hist_plot(c(3,2,1), "abc", "x", "y", "title", 10))
    expect_error(hist_plot(test_data_hist, "abc", "x", "y", "title", 10))
    expect_error(hist_plot(test_data_hist, x, 10, "y", "title", 10))
    expect_error(hist_plot(test_data_hist, x, "x", 10, "title", 10))
    expect_error(hist_plot(test_data_hist, x, "x", "y", 10, 10))
    expect_error(hist_plot(test_data_hist, x, "x", "y", "title", "10"))
})

#test for output variables 
test_that("Checks the output of the graph", {
    plot <- hist_plot(test_data_hist, x, "x", "y", "Histogram Test", 10)
    expect_true(is.ggplot(plot))
    expect_equal(xlab(plot)$label, xlab(helper_hist)$label)
    expect_equal(ylab(plot)$label, ylab(helper_hist)$label)
    expect_equal(ggtitle(plot)$labels, ggtitle(helper_hist)$labels)
    
})

