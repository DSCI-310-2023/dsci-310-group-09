library(testthat)
library(tidyverse)
library(ggcheck)

source("./R/bar_graph.R")
source("./tests/bar_graph_tests_helper.R")

#test for input variables
test_that("Function can only accept certain data types for arguments", {
    expect_error(bar_graph(test_data, y, y, "x", "y", "x", "title"))
    expect_error(bar_graph(test_data, x, x, "x", "y", "x", "title"))
    expect_error(bar_graph(test_data, x, y, 100, "y", "x","title"))
    expect_error(bar_graph(test_data, x, y, "x", 100, "x","title"))
    expect_error(bar_graph(test_data, x, y, "x", "y", 100,"title"))
    expect_error(bar_graph(test_data, x, y, "x", "y", "x",100))
})

#test for output variables 
test_that("Checks the output of the graph", {
    plot <- bar_graph(test_data, test_data$x, test_data$y, "x", "y", "x", "Bar Graph Test")
    expect_true(is.ggplot(plot))
    expect_equal(xlab(plot)$label, xlab(test_data)$label)
    expect_equal(ylab(plot)$label, ylab(test_data)$label)
    expect_equal(ggtitle(plot)$label, ggtitle(test_data)$label)
    
})

