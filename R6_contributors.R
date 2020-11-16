install.packages("hrbrthemes") 
install.packages("gmodels") 
install.packages("fortunes")
install.packages("maps")
install.packages("nycflights13")
install.packages("lubridate")


library(nycflights13)
library(tidyverse)
dat <- read_csv("http://courses.washington.edu/b517/Datasets/shoulder.csv")
flights <- flights


datw <- dat %>% 
  pivot_wider(names_from = time, 
              values_from = pain, 
              names_prefix = "pain")