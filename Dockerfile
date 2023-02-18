FROM ubcdsci/jupyterlab:v6.5.2

# Install R packages with specific versions from conda-forge
# Packages and versions specified in environment.yml
COPY environment.yml .
RUN conda env update --file environment.yml
