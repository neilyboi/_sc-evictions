# Description
# Downloads and writes the South Carolina cities data to an rds file.

# Author: Neil Singh
# Version: 2020-01-30

# Libraries
library(tidyverse)


# Parameters
file_raw <- here::here("data-raw/sc_cities.csv")
file_out <- here::here("data/sc_cities.rds")

vars <-
  cols_only(
    "GEOID" = col_double(),
    "year" = col_integer(),
    "name" = col_character(),
    "evictions" = col_double()
  )

#===============================================================================

file_raw %>%
  vroom::vroom(
    col_types = vars
  ) %>%
  rename_at(vars(GEOID), str_to_lower) %>%
  filter(year == 2016) %>%
  glimpse() %>%
  write_rds(file_out, compress = "gz")

