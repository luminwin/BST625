## https://tidyr.tidyverse.org/news/index.html
library(tidyverse)
relig_income
relig_income %>%
  pivot_longer(-religion, names_to = "income", values_to = "count")
## or
relig_income %>%
  pivot_longer(!religion, names_to = "income", values_to = "count")

fish_encounters
fish_encounters %>%
  pivot_wider(names_from = station, values_from = seen)