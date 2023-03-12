library(testthat)

source("./R/hist_plot.R")


#test for input variables
test_that("Function can only accept certain data types for arguments", {
  expect_error(bar_graph(iris, iris$Sepal.Width, iris$Sepal.Length, "Sepal Length", "Species"))
  expect_error(bar_graph(iris, iris$Species, iris$Species, "Sepal Length", "Species", "Species","Iris"))
  expect_error(bar_graph(iris, iris$Sepal.Width, iris$Sepal.Length, 100, "Species", "Species","Iris"))
  expect_error(bar_graph(iris, iris$Sepal.Width, iris$Sepal.Length, "Sepal Length", 100, "Species","Iris"))
  expect_error(bar_graph(iris, iris$Sepal.Width, iris$Sepal.Length, "Sepal Length", "Species", 100,"Iris"))
  expect_error(bar_graph(iris, iris$Sepal.Width, iris$Sepal.Length, "Sepal Length", "Species", "Species",100))
})

#test for output variables 
test_that("Checks the output of the graph", {
  expect_true(is.ggplot(bar_iris))
  expect_equal(get_labels(bar_iris), list(title = "Iris Graph", x = "Species", y = "Sepal Width", fill = "Species"))
})
