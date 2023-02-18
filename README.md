# Bike Share Analysis and Daily Users Predictor

Authors: Enoch Hsu, Jenna Le Noble, Sarah Mohammed, Nadine Tabbaa

Contributors: Vera Danilova, Jenna Le Noble, Moira Renata, Yuyang Wang

Note: This analysis was originally created by Enoch Hsu, Jenna Le Noble, Sarah Mohammed and Nadine Tabbaa for DSCI 100 in 2022. Refer [here](https://github.com/jennalenoble/dsci-310-group-09/blob/main/consent/consent.jpg) for the consent from each author to use this analysis for our project.

## Summary

The dataset we used for our analysis contains count of public bikes rented at each hour in Seoul Bike Sharing System and includes data on weather such as rain, humidity, temperature, etc. and holiday information. We used temperature and solar radiation as the environmental factors to build regression models that predicted the number of bikes rented on a given day. We built both linear regression and k-nn regression models to determine which model had the lowest prediction error, as measured by root mean square prediction error (RMSPE). We found that the k-nn regression model using 9 neighbours with two predictors (temperature and solar radiation) was the best model with the lowest RMSPE value of 3782 bikes rented on a given day. This model could help prospective bike sharing companies to determine how many bikes they need to have available daily depending on weather conditions.

The data we used to build our models was gathered in 2017 and 2018 in Seoul, Korea. The data was found from https://archive.ics.uci.edu/ml/datasets/Seoul+Bike+Sharing+Demand and sourced from https://data.seoul.go.kr/index.do.  

## Report 

The analysis report can be found [here](https://github.com/jennalenoble/dsci-310-group-09/blob/main/analysis/bike_share_analysis.ipynb).

## Usage

## Dependencies

R version 4.2.2, Jupyter and R packages listed in [environment.yml](https://github.com/jennalenoble/dsci-310-group-09/blob/main/environment.yml).

## License 

DSCI310 Project © 2023 by GROUP 9 is licensed under Attribution 4.0 International. Refer to the [license file](https://github.com/jennalenoble/dsci-310-group-09/blob/main/License.md) for more information.

