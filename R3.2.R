########################################################
library(tidyverse)
dat <- read_csv("score_data999.csv", 
                col_types = cols(score1 = col_integer(), 
                                 score2 = col_integer(), score3 = col_integer(), 
                                 gender = col_factor(levels = c("m", "f"))))

dat[dat == 999] <- NA  

write_csv(x = dat, path = "score_data.csv")
write.csv(dat, file = "score_data.csv", row.names = FALSE)