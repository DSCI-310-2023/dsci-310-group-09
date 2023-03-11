
#' Scatter Plot 
#'
#' Creates a scatter plot using two variables in data frame
#' 
#' #' This function takes in a data set, a variable x from the data set, 
#' a variable y from the data set, an x-axis label, a y-axis label, 
#' a title for the plot and the text size.
#'
#' @param data A data frame 
#' @param x the y variable in the relationship 
#' @param y the variable y in the relationship 
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

scatter_plot <- function(data,x,y,xlab,ylab,title,text_size){
  if(!isnumeric(x)){
    stop("Please put in a numeric variable for x.")
    }
  else if(!isnumeric(y)){
    stop("Please put in a numeric variable for y.")
    }
    else if(!is.character(xlab)){
      stop("Please put in a string parameter for xlab.")
      }
    else if(!is.character(xlab)){
      stop("Please put in a string parameter for ylab.")
      }
    else if(!is.character(xlab)){
      stop("Please put in a string parameter for title.")
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
