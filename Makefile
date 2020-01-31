# Search path
VPATH = data data-raw eda reports scripts

# Processed data files
DATA = sc_boundaries.rds sc_cities.rds sc_joined.rds

# EDA studies
EDA = sc_cities.md

# Reports
REPORTS =

# All targets
all : $(DATA) $(EDA) $(REPORTS)

# Data dependencies
sc_joined.rds : sc_cities.rds sc_boundaries.rds

# EDA study and report dependencies
sc_cities.md : sc_cities.rds


# Pattern rules
%.rds : %.R
	Rscript $<
%.md : %.Rmd
	Rscript -e 'rmarkdown::render(input = "$<", output_options = list(html_preview = FALSE))'
