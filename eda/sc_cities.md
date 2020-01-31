South Carolina Cities EDA
================
Neil Singh
2020-01-30

``` r
# Libraries
library(tidyverse)

# Parameters
file_in <- here::here("data/sc_cities.rds")
sc_cities <-  read_rds(file_in)
#===============================================================================

# Code
```

## City in South Carolina with the most evictions

``` r
sc_cities %>% 
  count(name, wt = evictions, sort = TRUE) %>% 
  glimpse()
```

    ## Observations: 394
    ## Variables: 2
    ## $ name <chr> "North Charleston", "Columbia", "Charleston", "St. Andrews", "Fl…
    ## $ n    <dbl> 3660.10, 2224.63, 1546.21, 1382.72, 1096.81, 768.76, 728.84, 641…

North Charleston had the most evictions in 2016. Side note, what does
.10 evictions mean?
