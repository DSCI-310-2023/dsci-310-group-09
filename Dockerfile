FROM jupyter/r-notebook

RUN Rscript -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN Rscript -e "remotes::install_version('tidyverse', version = '1.3.2', repos = 'https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('tidymodels', version = '1.0.0', repos = 'https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('GGally', version = '2.1.2', repos = 'https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('kknn', version = '1.3.1', repos = 'https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('testthat', version = '3.1.6', repos = 'https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_github("rstudio/ggcheck", upgrade = "never")"
