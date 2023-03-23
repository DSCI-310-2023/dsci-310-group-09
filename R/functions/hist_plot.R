#' Histogram Plot

#' Create a histogram for a given variable
#' 
#' This function takes in a dataset, a variable x from the dataset, an x-axis label, a y-axis label, a title for the plot and the text size.
#' 
#' @param data The dataset that contains the x variable.
#' @param x The name of the numerical variable that will be on the x-axis of the histogram.
#' @param xlab The label of the x-axis.
#' @param ylab The label of the y-xis.
#' @param title The title of the histogram plot.
#' @param text_size The size of the plot's text.
#' 
#' @return A histogram plot for given numerical variable, x
#' 
#' @examples 
#' # hist_plot(mtcars, mpg, "Miles Per Gallon", "Count", "Histogram for MPG of Cars", 10)
#' 

hist_plot <- function(data, var, xlab, ylab, title, text_size){
  x = dplyr::pull(data, {{var}})
  if(!is.numeric(x)){
    stop("Variable x must be a numerical variable.")}
  
  else if(!is.character(xlab)){
    stop("Parameter xlab must be a string.")
  }
  
  else if(!is.character(ylab)){
    stop("Parameter ylab must be a string.")
  }
  
  else if(!is.character(title)){
    stop("Parameter title must be a string.")
  }
  
  else if(!is.numeric(text_size)){
    stop("Parameter text_size must be a numeric value.")
  }
  
  else {
    return(
      ggplot(data, aes(x = x)) +
        geom_histogram() +
        labs(x = xlab, y = ylab) +
        ggtitle(title) +
        theme(text = element_text(size = text_size))
    )
  }
}