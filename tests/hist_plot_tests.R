library(testthat)

source("./R/hist_plot.R")

testthat::expect_error(hist_plot(iris, "Species", "Iris Species", "Count", "Histogram", 10))
testthat::expect_error(hist_plot(mtcars, mpg, MPG, "Count", "Histogram", 10))
testthat::expect_error(hist_plot(mtcars, mpg, "MPG", Count, "Histogram", 10))
testthat::expect_error(hist_plot(mtcars, mpg, "MPG", "Count", Histogram, 10))
testthat::expect_error(hist_plot(mtcars, mpg, "MPG", "Count", "Histogram", "10"))

testthat::expect_true(is.ggplot(hist_plot(mtcars, mpg, "MPG", "Count", "Histogram", 10)))
