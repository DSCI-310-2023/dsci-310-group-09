
#' Scatter Plot 
#'
#' Creates a scatter plot using two variables in data frame
#' 
#' #' This function takes in a data set, a variable x from the data set, 
#' a variable y from the data set, an x-axis label, a y-axis label, 
#' a title for the plot and the text size.
#'
#' @param data A data frame 
#' @param var1 the y variable in the relationship 
#' @param var2 the variable y in the relationship 
#' @param xlab the label of the x-axis 
#' @param ylab the label of the y-axis
#' @param title the title of the scatter plot with the regression line
#' @param text_size the size of text of the labels/title 
#'
#' @return A scatter plot where  
#'   The x-axis are for the x variable specified 
#'   The x-axis are for the x variable specified 
#'   
#'
#' @examples
#' scatter_plot(mtcars, mpg, hp, "Miles Per Gallon", "Horse Power", "Scatter Plot for MPG vs HP", 10)
#' 

scatter_plot <- function(data,var1,var2,xlab,ylab,title,text_size){
  x = dplyr::pull(data, {{var1}})
  y = dplyr::pull(data, {{var2}})
  if (!is.data.frame(data)){
    stop("Parameter data must be a dataframe.")
  }
  
  else if(!is.numeric(x)){
    stop("Please put in a numeric variable for x.")
    }
  else if(!is.numeric(y)){
    stop("Please put in a numeric variable for y.")
    }
    else if(!is.character(xlab)){
      stop("Please put in a string parameter for xlab.")
      }
    else if(!is.character(xlab)){
      stop("Please put in a string parameter for ylab.")
      }
    else if(!is.character(title)){
      stop("Please put in a string parameter for title.")
    }
    else if(!is.numeric(text_size)){
      stop("Parameter text_size must be a numeric value.")
  }
    else {
      return (
        ggplot(data,aes(x=x,y=y)) +
        geom_point()+
        labs(x=xlab,y=ylab)+
        ggtitle(title)+
        theme(text=element_text(size=text_size)))
  }
}
