# Bike Share Analysis and Daily Users Predictor

Contributors: Vera Danilova, Jenna Le Noble, Moira Renata, Yuyang Wang

*Note*: This analysis was originally created by Enoch Hsu, Jenna Le Noble, Sarah Mohammed and Nadine Tabbaa for DSCI 100 in 2022. Refer [here](https://github.com/jennalenoble/dsci-310-group-09/blob/main/consent/consent.jpg) for the consent from each author to use this analysis for our project.

## Summary

The dataset we used for our analysis contains count of public bikes rented at each hour in the Seoul Bike Sharing System. It includes data on weather characteristics such as rain, humidity, temperature, etc. as well as whether the particular day was a holiday or a functioning day. We used the temperature and solar radiation as the environmental factors to build regression models that predicted the number of bikes rented on a given day. We built both linear regression and k-nn regression models to determine which model had the lowest prediction error, as measured by root mean square prediction error (RMSPE). We found that the k-nn regression model using nine neighbours with two predictors (both temperature and solar radiation) was the best model with the lowest RMSPE value of 3782 bikes rented on a given day. This model could help prospective bike sharing companies to determine how many bikes they need to have available daily depending on the weather conditions.

The data we used to build our models was gathered in 2017 and 2018 in Seoul, Korea. The data was found from https://archive.ics.uci.edu/ml/datasets/Seoul+Bike+Sharing+Demand and sourced from https://data.seoul.go.kr/index.do.  

## Report 

The analysis report can be found [here](https://github.com/jennalenoble/dsci-310-group-09/blob/main/analysis/bike_share_analysis.Rmd).

## Usage

We use a Docker container image to make the computational environment for this project reproducible. Download docker application [here](https://hub.docker.com). Create an account and open the docker application.

Follow the steps below to run and explore the project in RStudio:

* Clone this GitHub repository by clicking the green `code` button, copy the url that looks like `https://github.com/jennalenoble/dsci-310-group-09.git`, and run `git clone <url>` in terminal.
* Navigate to the root of this project by running `cd dsci-310-group-09` in terminal.
* Run the following command in your terminal: 

  ``` 
  docker run -p 8787:8787 --rm -v /$(pwd):/home/rstudio/work jennalenoble/dsci-310-group-09:latest
  ```

    * Note: run the project interactively by using `-it`: e.g. 
    ```
    docker run -it --rm -v /$(pwd):/home/rstudio/work jennalenoble/dsci-310-group-09:latest
    ```
    * Note: if running in Windows terminal, the command should be:
    ```
    docker run --rm -it -v /$(pwd):<PATH_ON_CONTAINER> <IMAGE_NAME>
    ```
    * Note: if running in Power Shell then the command should be: 
    ```
    docker run --rm -it -v <ABSOLUTE_PATH_TO_CONTAINER>:<PATH_ON_CONTAINER> <IMAGE_NAME>
    ``` 
    and the path should be formatted like `C:\Users\tiffany.timbers\Documents\project\:/home/project`.
    
* Copy the password that is given in the terminal.
* Open a new web browser and go to `localhost:8787`.
* Use `rstudio` as the username and the copied passcode from terminal as the password to sign in.
* Navigate to the root project folder using `cd` in RStudio terminal.
* Run `make all` in Rstudio's terminal to run the entire analysis pipeline and render an html file of the report found in `analysis/bike_share_analysis.html`.
    * Note: run `make clean` to easily “undo” the analysis (e.g., delete all generate data and files).
* To run the analysis in Rstudio, open `ln.knn.regression.Rproj` project to set the working directory, then navigate to `analysis/bike_share_analysis.Rmd`.
* Click the arrow drop down beside `run` and select `Restart R and Run All Chunks` to reproduce the results.
 
## Dependencies

R version 4.2.2

R-packages: 
* tidyverse 1.3.2
* tidymodels 1.0.0
* GGally 2.1.2
* kknn 1.3.1
* here 1.0.1
* knitr 1.42
* bookdown 0.33
* tinytex 0.44
* docopt 0.7.1
* ln.knn.regression 0.0.0.9000

The ln.knn.regression package can be found [here](https://github.com/DSCI-310/dsci-310-group-09-pkg). 

## License 

This project is offered under the [Attribution 4.0 International (CC BY 4.0) License](https://creativecommons.org/licenses/by/4.0/). The software provided in this project is offered under the [MIT open source license](https://opensource.org/license/mit/). Refer to the [license file](https://github.com/jennalenoble/dsci-310-group-09/blob/main/LICENSE.md) for more information.
