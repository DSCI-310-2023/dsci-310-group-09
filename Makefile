# title: "Bike Share Analysis and Daily Users Predictor"
# author: "Vera Danilova, Jenna Le Noble, Moira Renata, Yuyang Wang"
# date: 2023-03-22

rmd: results/bike_histogram.png results/bike_correlations_ggpairs.png results/reg_bike_count_temp.png results/reg_bike_count_solar_rad.png results/knn_bike_count_temp.png results/knn_bike_count_solar_rad.png analysis/bike_share_analysis.html analysis/bike_share_analysis.pdf

# generate figures and objects for report
results/bike_histogram.png results/bike_correlations_ggpairs.png results/bike_count_barplot.png results/reg_bike_count_temp.png results/reg_bike_count_solar_rad.png results/knn_bike_count_temp.png results/knn_bike_count_solar_rad.png: source/generate_figures.R
	Rscript source/generate_figures.R --input_dir= "bike_data.csv" --out_dir="results"

# render R Markdown report in HTML and PDF
analysis/bike_share_analysis.html analysis/bike_share_analysis.pdf: analysis/bike_share_analysis.Rmd analysis/references.bib
	Rscript -e "rmarkdown::render('analysis/bike_share_analysis.Rmd', c('bookdown::html_document2', 'bookdown::pdf_document2'))"


# clean
clean:
	rm -rf results
	rm -rf analysis/bike_share_analysis.html analysis/bike_share_analysis.pdf