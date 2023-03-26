# title: "Bike Share Analysis and Daily Users Predictor"
# author: "Vera Danilova, Jenna Le Noble, Moira Renata, Yuyang Wang"
# date: 2023-03-25

# Run the entire analysis pipeline in terminal

all: clean data/bike_data.csv data/bike_data_clean.csv results/bike_histogram.png results/bike_correlations_ggpairs.png results/bike_count_barplot.png data/bike_training.csv data/bike_testing.csv results/lm_model.rds results/intercept_3.rds results/slope_3_temp.rds results/slope_3_sol_rad.rds results/lm_rmspe.rds results/knn_model.rds results/k_min.rds results/knn_rmspe.rds results/lm1_model.rds results/slope_1.rds results/intercept_1.rds results/lm_rmspe_1.rds results/lm_bike_count_temp.png results/lm2_model.rds results/slope_2.rds results/intercept_2.rds results/lm_rmspe_2.rds results/lm_bike_count_solar_rad.png analysis/bike_share_analysis.html

# Load data
data/bike_data.csv:	R/scripts/data_loading.R
	Rscript R/scripts/data_loading.R --url=https://archive.ics.uci.edu/ml/machine-learning-databases/00560/SeoulBikeData.csv --out_dir=data

# Clean data
data/bike_data_clean.csv: R/scripts/data_cleaning.R data/bike_data.csv
	Rscript R/scripts/data_cleaning.R --input=data/bike_data.csv --out_dir=data

# Create EDA Plots
results/bike_histogram.png results/bike_correlations_ggpairs.png results/bike_count_barplot.png: R/scripts/eda_plots.R data/bike_data_clean.csv
	Rscript R/scripts/eda_plots.R --input=data/bike_data_clean.csv --out_dir=results

# Split training and testing data
data/bike_training.csv data/bike_testing.csv: R/scripts/splitting.R data/bike_data_clean.csv
	Rscript R/scripts/splitting.R --data=data/bike_data_clean.csv --out_dir=data

# Create LM 1
results/lm1_model.rds results/slope_1.rds results/intercept_1.rds: R/scripts/lm1_training.R data/bike_training.csv
	Rscript R/scripts/lm1_training.R --train_data=data/bike_training.csv --out_dir=results

# Find LM 1 error and create plot
results/lm_rmspe_1.rds results/lm_bike_count_temp.png: R/scripts/lm1_testing.R data/bike_testing.csv results/lm1_model.rds data/bike_training.csv
	Rscript R/scripts/lm1_testing.R --test_data=data/bike_testing.csv --out_dir=results
	
# Create LM 2
results/lm2_model.rds results/slope_2.rds results/intercept_2.rds: R/scripts/lm2_training.R data/bike_training.csv
	Rscript R/scripts/lm2_training.R --train_data=data/bike_training.csv --out_dir=results
	
# Find LM 2 error and create plot
results/lm_rmspe_2.rds results/lm_bike_count_solar_rad.png: R/scripts/lm2_testing.R data/bike_testing.csv results/lm2_model.rds data/bike_training.csv
	Rscript R/scripts/lm2_testing.R --test_data=data/bike_testing.csv --out_dir=results
	
# Create LM 3
results/lm_model.rds results/intercept_3.rds results/slope_3_temp.rds results/slope_3_sol_rad.rds: R/scripts/lm_training.R data/bike_training.csv
	Rscript R/scripts/lm_training.R --train_data=data/bike_training.csv --out_dir=results
	
# Find LM 3 error
results/lm_rmspe.rds: R/scripts/lm_testing.R data/bike_testing.csv results/lm_model.rds
	Rscript R/scripts/lm_testing.R --test_data=data/bike_testing.csv --out_dir=results
	
# Create KNN model
results/knn_model.rds results/k_min.rds: R/scripts/knn_training.R data/bike_training.csv
	Rscript R/scripts/knn_training.R --train_data=data/bike_training.csv --out_dir=results
	
# Find KNN error
results/knn_rmspe.rds: R/scripts/knn_testing.R data/bike_testing.csv results/knn_model.rds
	Rscript R/scripts/knn_testing.R --test_data=data/bike_testing.csv --out_dir=results


# Render report

analysis/bike_share_analysis.html: analysis/bike_share_analysis.Rmd
	Rscript -e "rmarkdown::render('analysis/bike_share_analysis.Rmd', 'bookdown::html_document2')"

clean: 
	rm -f data/bike_data.csv
	rm -f data/bike_data_clean.csv
	rm -f data/bike_training.csv
	rm -f data/bike_testing.csv
	rm -rf results
	rm -rf analysis/bike_share_analysis.html
