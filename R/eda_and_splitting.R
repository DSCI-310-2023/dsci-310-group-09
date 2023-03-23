source("./R/data_loading_cleaning.R")

bike_param <- bike_data_clean %>%
  summarize(mean = mean(bike_count),
            med = median(bike_count),
            sd = sd(bike_count))
bike_param

set.seed(2020)
bike_split <- initial_split(bike_data_clean, prop = 0.7, strata = bike_count)
bike_training <- training(bike_split)
bike_testing <- testing(bike_split)
bike_training_summary <- summarize_column(bike_training, bike_training$bike_count)
bike_testing_summary <- summarize_column(bike_testing, bike_testing$bike_count)

bike_cors <- cor(bike_training)[1,] |>
  as_tibble()
colnames(bike_cors) <- c("r")
bike_cors$factors <- as.factor(names(bike_data_clean))
bike_cors <- filter(bike_cors, factors != "bike_count") |>
  mutate(r = abs(r))