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

####################################################### ####### New 
library(tidyr)
library(tidyverse)
library(tidyverse)
dat <- read_csv("score_data999.csv", 
                col_types = cols(score1 = col_integer(), 
                                 score2 = col_integer(), score3 = col_integer(), 
                                 gender = col_factor(levels = c("m", "f"))))

dat[dat == 999] <- NA 
# The arguments to gather():
# - data: Data object
# - key: Name of new key column (made from names of data columns)
# - value: Name of new value column
# - ...: Names of source columns that contain values
# - factor_key: Treat the new key column as a factor (instead of character vector)
data_long <- gather(dat, key = time, value = score, score1:score3, factor_key=TRUE)
data_long_2 <- dat %>% 
        gather(key = time, value = score, score1:score3, factor_key = FALSE)

# The arguments to spread():
# - data: Data object
# - key: Name of column containing the new column names
# - value: Name of column containing values
data_wide <- spread(data_long, key = time, value = score)

################################
# merge two datasets
################################
######################## slide 12
a <- tibble(X1 = LETTERS[1:3],
            X2 = 1:3)
b <- tibble(X1 = c("A", "B", "D"),
            X3 = c("T", "F", "T"))

left_join(a, b, by = "X1")
a %>% left_join(b, by = "X1")

right_join(a, b, by = "X1")

inner_join(a, b, by = "X1")

full_join(a, b, by = "X1")


