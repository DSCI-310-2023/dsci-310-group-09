library(testthat)
library(dplyr)

source("~/dsci-310-group-09/R/summarize_column.R")

test_that("summarize_column function returns a df or df extension", {
  expect_s3_class(summarize_column(mtcars, "col1"), "data.frame")
})

test_that("summarize_column function returns a df with three columns:
mean, med, sd",{
  expect_equivalent(colnames(summarize_column(mtcars, "col1")),
                    c("mean","med","sd"))
})




