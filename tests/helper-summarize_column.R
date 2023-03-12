# inputs used for tests for summarize_column function

empty_df <- mtcars[FALSE,]

empty_df_output <- data.frame(mean = numeric(0),
                              med = numeric(0),
                              sd = numeric(0))


mpg <- print(mtcars[, c("mpg")])

hp <- print(mtcars[, c("hp")])

qsec <- print(mtcars[, c("qsec")])

mpg_output <- data.frame(mean(mpg),
                     median(mpg),
                     sd(mpg))

hp_output <- data.frame(mean(hp),
                         median(hp),
                         sd(hp))

qsec_output <- data.frame(mean(qsec),
                         median(qsec),
                         sd(qsec))








