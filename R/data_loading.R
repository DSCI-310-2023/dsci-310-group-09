"
Download the data file from the web to the local filepath as a csv file format.
Usage: R/data_loading.R --url=<url> --out_dir=<out_dir>
Options:
--url=<url>           URL from where to download the data
--out_dir=<out_dir>   Path(including filename) of where to write the file locally
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
  data <- read_delim(url, ";")
  write_csv(data, paste0(out_dir, "/raw_bike_data.csv"))
}

main(opt[["--url"]], opt[["--out_dir"]])