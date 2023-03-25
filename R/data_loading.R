"
Download the data file from the web into csv file format and load libaries.
Usage: R/data_loading.R --url=<url> --out_dir=<out_dir>
Options:
--url=<url>           URL from where data is downloaded from
--out_dir=<out_dir>   Path of where to write the file locally
" -> doc

library(docopt)
library(tidyverse)
library(tidymodels)
library(GGally)
library(kknn)
library(here)
library(knitr)

opt <- docopt(doc)
main <- function(url, out_dir) {
  bike_data <- read_csv(url, 
                        locale=locale(encoding="latin1"))
  write_csv(bike_data, paste0(out_dir, "/bike_data.csv"))
}

main(opt[["--url"]], opt[["--out_dir"]])