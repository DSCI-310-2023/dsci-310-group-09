library(tidyverse)
library(ggplot2)

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





                      
