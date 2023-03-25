# title: "Bike Share Analysis and Daily Users Predictor"
# author: "Vera Danilova, Jenna Le Noble, Moira Renata, Yuyang Wang"
# date: 2023-03-25

all: results/final_model.rds results/bike_histogram.png results/bike_correlations_ggpairs.png 

# Load data
data/bike_data.csv:	R/data_loading.R
	Rscript R/data_loading.R --url=https://archive.ics.uci.edu/ml/machine-learning-databases/00560/SeoulBikeData.csv --out_dir=data

# Clean data
data/bike_data_clean.csv: R/data_cleaning.R data/bike_data.csv
	Rscript data_cleaning.R --input=data/bike_data.csv --out_dir=data

# Create EDA Plots
results/bike_histogram.png results/bike_correlations_ggpairs.png: R/eda_plots.R data/bike_data_clean.csv
	Rscript R/eda_plots.R --input=data/bike_data_clean.csv --out_dir=results

# Split data and train LM & KNN models



# Fit data to predicted models



# Test models 



# Render report

analysis/bike_share_analysis.html: analysis/bike_share_analysis.Rmd
	Rscript -e "rmarkdown::render('analysis/bike_share_analysis.Rmd', 'bookdown::html_document2')"

clean: 
	rm -rf data
	rm -rf results
	rm -rf analysis/bike_share_analysis.html analysis/bike_share_analysis.Rmd

#.PHONY: all 
#all:
#	analysis/bike_share_analysis.Rmd

#.PHONY: report
#report: 
#	make clean
#	Rscript -e "rmarkdown::render('analysis/bike_share_analysis.Rmd', output_dir=here::here('output'))"

#.PHONY: clean
#clean: 
#	rm -f analysis/bike_share.html 
#	rm -f output/bike_share.html



# title: "Bike Share Analysis and Daily Users Predictor"
# author: "Vera Danilova, Jenna Le Noble, Moira Renata, Yuyang Wang"
# date: 2023-03-22

#rmd: results/bike_histogram.png results/bike_correlations_ggpairs.png results/reg_bike_count_temp.png results/reg_bike_count_solar_rad.png results/knn_bike_count_temp.png results/knn_bike_count_solar_rad.png analysis/bike_share_analysis.html analysis/bike_share_analysis.pdf

# generate figures and objects for report
#results/bike_histogram.png results/bike_correlations_ggpairs.png results/bike_count_barplot.png results/reg_bike_count_temp.png results/reg_bike_count_solar_rad.png results/knn_bike_count_temp.png results/knn_bike_count_solar_rad.png: source/generate_figures.R
#	Rscript source/generate_figures.R --input_dir= "bike_data.csv" --out_dir="results"

# render R Markdown report in HTML and PDF
#analysis/bike_share_analysis.html analysis/bike_share_analysis.pdf: analysis/bike_share_analysis.Rmd analysis/references.bib
#	Rscript -e "rmarkdown::render('analysis/bike_share_analysis.Rmd', c('bookdown::html_document2', 'bookdown::pdf_document2'))"


# clean
#clean:
#	rm -rf results
#	rm -rf analysis/bike_share_analysis.html analysis/bike_share_analysis.pdf
