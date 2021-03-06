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
library(tidyverse)
# library(tidyr)
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
library(tidyverse)
a <- tibble(X1 = LETTERS[1:3],
            X2 = 1:3)
b <- tibble(X1 = c("A", "B", "D"),
            X3 = c("T", "F", "T"))

left_join(a, b, by = "X1")
a %>% left_join(b, by = "X1")

right_join(a, b, by = "X1")

inner_join(a, b, by = "X1")

full_join(a, b, by = "X1")

dat <- as.data.frame(dat)
dat_long <- reshape(dat, idvar = "name", 
                    varying = paste("score", 1:3, sep = ""), 
                    # or you can specify varying = list(2:4) to refer the 2nd to the 4th columns
                    v.names = "score", direction = "long")
data_long
head(dat_long)
data_long$time
dat_long$time
dat_wide <- reshape(dat_long, v.names = "score", idvar = "name",
                    # sep = "_",  # you can use this to customerize your names
                    # instead of score.1, you have score_1
                    # you can write sep = "",
                    timevar = "time", direction = "wide")

######################## slide 14
## merge in rows
############ I fake two data sets to merge
dat_top <- head(dat)
dat_bot <- tail(dat)


rbind(dat_top, dat_bot)

## r is very smart, even the names ordered differently
dat_bot <- dat_bot[, 5:1]
rbind(dat_top, dat_bot)

cbind(dat_top[,1:2], dat_top[,3:5])



