# title: "Bike Share Analysis and Daily Users Predictor"
# author: "Vera Danilova, Jenna Le Noble, Moira Renata, Yuyang Wang"
# date: 2023-03-25

.PHONY: run 
run: 
	Rscript R/data_loading_cleaning.R
	Rscript R/eda_and_splitting.R
	Rscript R/linear_regression_analysis.R
	Rscript R/knn_regression_analysis.R
	Rscript R/figures.R

.PHONY: report
report: 
	make clean
	Rscript -e "rmarkdown::render('analysis/bike_share_analysis.Rmd', output_dir=here::here('output'))"

.PHONY: clean
clean: 
	rm -f analysis/bike_share.html 
	rm -f output/bike_share.html




