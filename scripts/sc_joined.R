# Description
# Joins and writes the South Carolina cities and boundaries data to an rds file.
# Author: Neil Singh
# Version: 2020-01-30

# Libraries
library(tidyverse)

# Parameters
cities_in <- here::here("data/sc_cities.rds")
boundaries_in <- here::here("data/sc_boundaries.rds")
file_out <- here::here("data/sc_joined.rds")

#Read in data:
cities <- read_rds(cities_in)
boundaries <- read_rds(boundaries_in)
#===============================================================================

left_join(
  cities,
  boundaries,
  by = c(
    "geoid" = "city_id",
    "name" = "city_name"
  )
) %>%
  write_rds(file_out)

