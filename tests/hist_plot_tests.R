library(testthat)
library(ggcheck)

source("./R/hist_plot.R")
source("./tests/hist_plot_tests_helper.R")

#test for input variables
test_that("Function can only accept certain data types for arguments", {
  expect_error(hist_plot(iris, "Species", "Iris Species", "Count", "Histogram", 10))
  expect_error(hist_plot(mtcars, mpg, MPG, "Count", "Histogram", 10))
  expect_error(hist_plot(mtcars, mpg, "MPG", Count, "Histogram", 10))
  expect_error(hist_plot(mtcars, mpg, "MPG", "Count", Histogram, 10))
  expect_error(hist_plot(mtcars, mpg, "MPG", "Count", "Histogram", "10"))
})


#test for output variables
test_that("Function returns a plot", {
  expect_true(is.ggplot(p1))
})

test_that("Identifies labels correctly", {
  expect_equal(
    get_labels(p1, c("title", "x", "y")), 
              list(title = "Histogram", x = "Miles per Gallon", y = "Count")
    )
  }
)
