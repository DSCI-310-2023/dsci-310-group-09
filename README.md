# Bike Share Analysis and Daily Users Predictor

Authors: Enoch Hsu, Jenna Le Noble, Sarah Mohammed, Nadine Tabbaa

Contributors: Vera Danilova, Jenna Le Noble, Moira Renata, Yuyang Wang

*Note*: This analysis was originally created by Enoch Hsu, Jenna Le Noble, Sarah Mohammed and Nadine Tabbaa for DSCI 100 in 2022. Refer [here](https://github.com/jennalenoble/dsci-310-group-09/blob/main/consent/consent.jpg) for the consent from each author to use this analysis for our project.

## Summary

The dataset we used for our analysis contains count of public bikes rented at each hour in the Seoul Bike Sharing System. It includes data on weather characteristics such as rain, humidity, temperature, etc. as well as whether the particular day was a holiday or a functioning day. We used the temperature and solar radiation as the environmental factors to build regression models that predicted the number of bikes rented on a given day. We built both linear regression and k-nn regression models to determine which model had the lowest prediction error, as measured by root mean square prediction error (RMSPE). We found that the k-nn regression model using nine neighbours with two predictors (both temperature and solar radiation) was the best model with the lowest RMSPE value of 3782 bikes rented on a given day. This model could help prospective bike sharing companies to determine how many bikes they need to have available daily depending on the weather conditions.

The data we used to build our models was gathered in 2017 and 2018 in Seoul, Korea. The data was found from https://archive.ics.uci.edu/ml/datasets/Seoul+Bike+Sharing+Demand and sourced from https://data.seoul.go.kr/index.do.  

## Report 

The analysis report can be found [here](https://github.com/jennalenoble/dsci-310-group-09/blob/main/analysis/bike_share_analysis.ipynb).

## Usage

We use a Docker container image to make the computational environment for this project reproducible. Follow the steps below to interactively run and explore the project in Jupyter Lab:

* Clone this GitHub repository by clicking the green `code` button, copy the url that looks like `https://github.com/jennalenoble/dsci-310-group-09.git`, and run `git clone <url>` in the terminal.
* Navigate to the root of this project using `cd dsci-310-group-09`.
* Run the command in your terminal:
```docker run -p 8888:8888 --rm -v /$(pwd):/home/jovyan/work jennalenoble/dsci-310-group-09:latest```
 * Note: include `-it` in the code above to run the project interactively. 
* Copy the URL from the terminal that looks like `http://127.0.0.1:8888/lab?token=d9704724bf0267d3d9262698ffbb88123633f8c8f4b1a305` into your web browser to access Jupyter Lab
* Next, in Jupyter lab, navigate to, and open `analysis/bike_share_analysis.ipynb` and click **Kernel** > **Restart and runall** to run the entire analysis.

 
## Dependencies

R version 4.2.2

R-packages: 
* tidyverse 1.3.2
* tidymodels 1.0.0
* GGally 2.1.2
* kknn 1.3.1

## License 

This project is offered under the [Attribution 4.0 International (CC BY 4.0) License](https://creativecommons.org/licenses/by/4.0/). The software provided in this project is offered under the [MIT open source license](https://opensource.org/license/mit/). Refer to the [license file](https://github.com/jennalenoble/dsci-310-group-09/blob/main/LICENSE.md) for more information.

