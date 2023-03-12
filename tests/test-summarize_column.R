library(testthat)
library("dplyr")

source("~/dsci-310-group-09/R/summarize_column.R")

test_that("summarize_column function returns a df or df extension", {
  expect_s3_class(summarize_column(mtcars, "mpg"), "data.frame")
})

test_that("summarize_column function returns a df with three columns:
mean, med, sd",{
  expect_equivalent(colnames(summarize_column(mtcars, "mpg")),
                    c("mean","med","sd"))
})


test_that("summarize_column calculates mean, med, sd correctly", {
  expect_equivalent(summarize_column(mtcars,"mpg"), list(mean("mpg"),
                                                      median("mpg"),
                                                      sd("mpg")))
  expect_equivalent(summarize_column(mtcars,"hp"), list(mean("hp"),
                                                        median("hp"),
                                                        sd("hp")))
})


test_that("summarize_column returns an empty df, along with columns:mean,med,
sd if input is an empty df", {
  expect_equivalent(summarize_column(mtcars[FALSE,], "mpg"), list(mean = numeric(0),
                                                        med = numeric(0),
                                                        sd = numeric(0)))
  expect_equivalent(summarize_column(mtcars[FALSE,], "qsec"), list(mean = numeric(0),
                                                                  med = numeric(0),
                                                                  sd = numeric(0)))
})












