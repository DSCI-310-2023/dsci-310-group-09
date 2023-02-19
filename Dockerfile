FROM jupyter/r-notebook

RUN Rscript -e "install.packages('tidyverse', version = '1.3.2', repos='https://cloud.r-project.org')"
RUN Rscript -e "install.packages('tidymodels', version = '1.0.0', repos='https://cloud.r-project.org')"
RUN Rscript -e "install.packages('GGally', version = '2.1.2', repos = 'https://cloud.r-project.org')"
RUN Rscript -e "install.packages('kknn', version = '1.3.1', repos= 'https://cloud.r-project.org')"
