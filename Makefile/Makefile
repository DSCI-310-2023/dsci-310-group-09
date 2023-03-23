# title: "Bike Share Analysis and Daily Users Predictor"
# author: "Vera Danilova, Jenna Le Noble, Moira Renata, Yuyang Wang"
# date: 2023-03-22

rmd: results/horse_pop_plot_largest_sd.png results/horse_pops_plot.png results/horses_spread.csv doc/rmd_example/rmd_example.html doc/rmd_example/rmd_example.pdf

jbook: results/horse_pop_plot_largest_sd.png results/horse_pops_plot.png results/horses_spread.csv doc/jbook_example/_build/html/index.html doc/jbook_example/_build/latex/python.pdf

# generate figures and objects for report
results/horse_pop_plot_largest_sd.png results/horse_pops_plot.png results/horses_spread.csv: source/generate_figures.R
	Rscript source/generate_figures.R --input_dir="https://archive.ics.uci.edu/ml/machine-learning-databases/00560/SeoulBikeData.csv" --out_dir="results"

# render R Markdown report in HTML and PDF
doc/rmd_example/rmd_example.html doc/rmd_example/rmd_example.pdf: doc/rmd_example/rmd_example.Rmd doc/rmd_example/references.bib
	Rscript -e "rmarkdown::render('doc/rmd_example/rmd_example.Rmd', c('bookdown::html_document2', 'bookdown::pdf_document2'))"

# render Jupyter Book report in HTML and PDF
doc/jbook_example/_build/html/index.html: doc/jbook_example/_config.yml doc/jbook_example/_toc.yml doc/jbook_example/jbook_example.ipynb doc/jbook_example/references.bib
	jb build doc/jbook_example/
doc/jbook_example/_build/latex/python.pdf: doc/jbook_example/_config.yml doc/jbook_example/_toc.yml doc/jbook_example/jbook_example.ipynb doc/jbook_example/references.bib
	jb build doc/jbook_example/ --builder pdflatex

# clean
clean:
	rm -rf results
	rm -rf doc/rmd_example/rmd_example.html doc/rmd_example/rmd_example.pdf
	rm -rf doc/jbook_example/_build