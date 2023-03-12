library(ggcheck)

library(testthat)

source("./R/scatter_plot.R")
source("./tests/scatter_plot_tests_helper.R")

#test for input variables
test_that("Function can only accept certain data types for arguments", {
  expect_error(scatter_plot(iris, "Species", Sepal.Width, "Iris Species", "Sepal Width", "Scatter Plot", 10))
  expect_error(scatter_plot(mtcars, mpg, hp, MPG, "HP", "Scatter Plot", 10))
  expect_error(scatter_plot(mtcars, mpg, hp, "MPG", HP, "Scatter Plot", 10))
  expect_error(scatter_plot(mtcars, mpg, hp, "MPG", "HP", Scatter , 10))
  expect_error(scatter_plot(mtcars, mpg, hp, "MPG", "HP", "Scatter Plot", "10"))
})


#test for output variables
test_that("Function returns a plot", {
  expect_true(is.ggplot(scatter_plot(mtcars, mpg, hp, "MPG", "HP", "Scatter Plot", 10)))
})



test_that("Identifies labels correctly", {
  expect_equal(
    get_labels(scatter_plot(mtcars, mpg, hp, "MPG", "HP", "Scatter Plot", 10), c("title", "x", "y")), 
    list(title = "Scatter Plot", x = "MPG", y = "HP")
  )
}
)




