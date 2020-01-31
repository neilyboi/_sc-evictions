# Description
# Downloads and writes the South Carolina boundaries data to an rds file.

# Author: Neil Singh
# Version: 2020-01-30

# Libraries
library(tidyverse)

# Parameters
file_raw <- here::here("data-raw/cities.geojson")
file_out <- here::here("data/sc_boundaries.rds")

#===============================================================================

file_raw %>%
  sf::read_sf() %>%
  select(
    "city_id" = GEOID,
    "city_name" = n,
    geometry
  ) %>%
  mutate_at("city_id", as.integer) %>%
  write_rds(file_out, compress = "gz")
