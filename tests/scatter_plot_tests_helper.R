library(ggplot2)

test_data_scatter <- data.frame(x = c(1, 2, 3, 4), y = c(2, 4, 5, 7))
test_data_scatter


helper_scatter <- ggplot(test_data_scatter,aes(x=x,y=y)) +
                  geom_point()+
                  labs(x="xlab",y="ylab")+
                  ggtitle("Scatterplot Test")+
                  theme(text=element_text(size=10))
helper_scatter

test_data_scatter2 <- data.frame(x = c("blue", "red", "yellow"), y = c(3,2,1))

test_data_scatter3 <- data.frame(x = c(1,1,1), y = c("yes", "no", "yes"))