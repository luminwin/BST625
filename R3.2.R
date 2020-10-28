########################################################
library(tidyverse)
dat <- read_csv("score_data999.csv", 
                col_types = cols(score1 = col_integer(), 
                                 score2 = col_integer(), score3 = col_integer(), 
                                 gender = col_factor(levels = c("m", "f"))))

dat[dat == 999] <- NA  

write_csv(x = dat, file = "score_data.csv")
write.csv(dat, file = "score_data.csv", row.names = FALSE)


remove.packages("xlsx")
#install.packages("xlsx")
library("xlsx")
# Write the first data set in a new workbook
write.xlsx(dat, file = "myworkbook.xlsx",
           sheetName = "SCOREDATA", append = FALSE)
# Add a second data set in a new worksheet
write.xlsx(mtcars, file = "myworkbook.xlsx", 
           sheetName="MTCARS", append=TRUE)