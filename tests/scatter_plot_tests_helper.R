library(ggplot2)

test_data_scatter <- data.frame(x = c(1, 2, 3, 4), y = c(2, 4, 5, 7))
test_data_scatter


helper_scatter <- ggplot(test_data_scatter,aes(x=x,y=y)) +
                  geom_point()+
                  labs(x="xlab",y="ylab")+
                  ggtitle("Scatterplot Test")+
                  theme(text=element_text(size=10))
helper_scatter
