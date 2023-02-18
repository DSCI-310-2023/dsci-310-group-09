# Bike Share Analysis and Daily Users Predictor

Authors: Vera Danilova, Jenna Le Noble, Moira Renata, Yuyang Wang

## Summary

The dataset we used for our analysis contains count of public bikes rented at each hour in Seoul Bike Sharing System and includes data on weather such as rain, humidity, temperature, etc. and holiday information. We used temperature and solar radiation as the environmental factors to build regression models that predicted the number of bikes rented on a given day. We built both linear regression and k-nn regression models to determine which model had the lowest prediction error, as measured by root mean square prediction error (RMSPE). We found that the k-nn regression model using 9 neighbours with two predictors (temperature and solar radiation) was the best model with the lowest RMSPE value of 3782 bikes rented on a given day. This model could help prospective bike sharing companies to determine how many bikes they need to have available daily depending on weather conditions.

The data we used to build our models was gathered in 2017 and 2018 in Seoul, Korea. The data was found from https://archive.ics.uci.edu/ml/datasets/Seoul+Bike+Sharing+Demand and sourced from https://data.seoul.go.kr/index.do.

## Report 

The analysis report can be found [here](https://github.com/jennalenoble/dsci-310-group-09/blob/main/analysis/bike_share_analysis.ipynb).

## Usage

## Dependencies

## License 

DSCI310 Project © 2023 by GRUOP 9 is licensed under Attribution 4.0 International. Refer to the [lisence file] (https://github.com/jennalenoble/dsci-310-group-09/blob/main/License.md) for more information.

