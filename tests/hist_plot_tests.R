library(testthat)
library(ggcheck)

source("./R/hist_plot.R")

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
  expect_true(is.ggplot(hist_plot(mtcars, mpg, "MPG", "Count", "Histogram", 10)))
})

test_that("Identifies labels correctly", {
  expect_equal(
    get_labels(hist_plot(mtcars, mpg, "mpg", "count", "histogram", 10), c("title", "x", "y")), 
              list(title = "histogram", x = "mpg", y = "count")
    )
  }
)
