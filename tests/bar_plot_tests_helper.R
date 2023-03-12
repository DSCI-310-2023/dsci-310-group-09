#helper function  

source("./R/bar_plot.R")
bar_iris <- bar_graph(iris, iris$Species, iris$Sepal.Width, "Species", "Sepal Width", "Species", "Iris Graph")
