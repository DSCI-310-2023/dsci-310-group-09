FROM jupyter/r-notebook

RUN conda install --yes -c conda-forge r-tidyverse=1.3.2 
RUN conda install --yes -c conda-forge r-tidymodels=1.0.0
RUN conda install --yes -c conda-forge r-GGally=2.1.2
