######################################################10/26/2020
laryngectomy <- read_excel("laryngectomy.xls")

library(tidyverse)   
install.packages("tidyverse")
laryngectomy %>%
  select(ends_with("_fu"))