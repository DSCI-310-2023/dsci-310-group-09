source("./R/eda_and_splitting.R")

# LM Model 1

lm_spec <- linear_reg() |>
  set_engine("lm") |>
  set_mode("regression")

bike_recipe_1 <- recipe(bike_count ~ temperature, data = bike_training)

bike_fit_1 <- workflow() |>
  add_recipe(bike_recipe_1) |>
  add_model(lm_spec) |>
  fit(data = bike_training)

lm_rmse_1 <- bike_fit_1 |>
  predict(bike_training) |>
  bind_cols(bike_training) |>
  metrics(truth = bike_count, estimate = .pred) |>
  filter(.metric == "rmse") |>
  select(.estimate) |>
  pull()

lm_rmspe_1 <- bike_fit_1 |>
  predict(bike_testing) |>
  bind_cols(bike_testing) |>
  metrics(truth = bike_count, estimate = .pred) |>
  filter(.metric == "rmse") |>
  select(.estimate) |>
  pull()

# LM Model 2

bike_recipe_2 <- recipe(bike_count ~ solar_radiation, data = bike_training)

bike_fit_2 <- workflow() |>
  add_recipe(bike_recipe_2) |>
  add_model(lm_spec) |>
  fit(data = bike_training)

lm_rmse_2 <- bike_fit_2 |>
  predict(bike_training) |>
  bind_cols(bike_training) |>
  metrics(truth = bike_count, estimate = .pred) |>
  filter(.metric == "rmse") |>
  select(.estimate) |>
  pull()

lm_rmspe_2 <- bike_fit_2 |>
  predict(bike_testing) |>
  bind_cols(bike_testing) |>
  metrics(truth = bike_count, estimate = .pred) |>
  filter(.metric == "rmse") |>
  select(.estimate) |>
  pull()

# LM Model 3

bike_recipe_3 <- recipe(bike_count ~ temperature + solar_radiation, data = bike_training)

bike_fit_3 <- workflow() |>
  add_recipe(bike_recipe_3) |>
  add_model(lm_spec) |>
  fit(data = bike_training)

lm_rmse_3 <- bike_fit_3 |>
  predict(bike_training) |>
  bind_cols(bike_training) |>
  metrics(truth = bike_count, estimate = .pred) |>
  filter(.metric == "rmse") |>
  select(.estimate) |>
  pull()

lm_rmspe_3 <- bike_fit_3 |>
  predict(bike_testing) |>
  bind_cols(bike_testing) |>
  metrics(truth = bike_count, estimate = .pred) |>
  filter(.metric == "rmse") |>
  select(.estimate) |>
  pull()
