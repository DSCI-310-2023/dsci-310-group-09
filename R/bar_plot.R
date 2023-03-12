bar_graph <- function(df, x_variable, y_variable, x_lab, y_lab, fill_lab, plot_title) {
  
  if(!is.factor(x_variable)) {
    stop("Please pass me a discrete variable") 
    } else if (!is.numeric(y_variable)) {
      stop("Please pass me a continuous variable") 
        
    } else if (!is.character(x_lab)) {
      stop("Please pass me a string") 
        
    } else if (!is.character(y_lab)) {
      stop("Please pass me a string") 
        
    } else if (!is.character(fill_lab)) {
      stop("Please pass me a string") 
    
    } else if (!is.character(plot_title)) {
      stop("Please pass me a string")
    }
      else{
        df |> 
          ggplot(aes(x = x_variable, y = y_variable, fill = x_variable)) +
          geom_bar(stat = "identity", position = "dodge") +
          labs(x = x_lab, y = y_lab, fill = fill_lab) + 
          ggtitle(plot_title) + 
          theme(axis.text.x = element_text(angle = 90, hjust = 1),
                text = element_text(size = 15),
                panel.background = element_rect(fill = 'darkgrey', color = 'purple'),
                plot.title = element_text(hjust = 0.5)) +
          scale_fill_brewer(palette = 'GnBu')
      }
}

bar_iris <- bar_graph(iris, iris$Species, iris$Sepal.Width, "Species", "Sepal Width", "Species", "Iris Graph")

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



                      
