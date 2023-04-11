FROM rocker/rstudio:4.1.3

RUN apt update -y
RUN apt install -y libcurl4-openssl-dev libssl-dev libxml2-dev zlib1g-dev
RUN Rscript -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN Rscript -e "remotes::install_version('tidyverse', version = '1.3.2', repos = 'https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('tidymodels', version = '1.0.0', repos = 'https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('GGally', version = '2.1.2', repos = 'https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('here', version = '1.0.1', repos = 'https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('knitr', version = '1.42', repos = 'https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('bookdown', version = '0.33', repos = 'https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('tinytex', version = '0.44', repos = 'https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_version('docopt', version = '0.7.1', repos = 'https://cloud.r-project.org')"
RUN Rscript -e "remotes::install_github('DSCI-310/dsci-310-group-09-pkg')"
