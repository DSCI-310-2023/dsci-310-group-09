# Project Title

Authors: Vera Danilova, Jenna Le Noble, Moira Renata, Yuyang Wang

## Summary

The dataset we used for our analysis contains count of public bikes rented at each hour in Seoul Bike Sharing System and includes data on weather such as rain, humidity, temperature, etc. and holiday information. We used temperature and solar radiation as the environmental factors to build regression models that predicted the number of bikes rented on a given day. We built both linear regression and k-nn regression models to determine which model had the lowest prediction error, as measured by root mean square prediction error (RMSPE). We found that the k-nn regression model using 9 neighbours with two predictors (temperature and solar radiation) was the best model with the lowest RMSPE value of 3782 bikes rented on a given day. This model could help prospective bike sharing companies to determine how many bikes they need to have available daily depending on weather conditions.

The data we used to build was gathered in 2017 and 2018 in Seoul, Korea. The data was collected from https://data.seoul.go.kr/index.do

## Report 

## Usage

## Dependencies

## License 

DSCI310 Project © 2023 by GRUOP 9 is licensed under Attribution 4.0 International 


Copyright <2023><Yuyang Wang, Moira Renata, Jenna Le Noble, Vera Danilova>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

