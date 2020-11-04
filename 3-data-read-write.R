dat <- read_csv("~/Dropbox/R book/GitR/BST625/score_data.csv", 
           col_types = cols(score1 = col_integer(), 
                            score2 = col_integer(), score3 = col_integer(), 
                            gender = col_factor(levels = c("m","f"))))

##### dat is a tibble
write_csv(dat, file = "score_data.csv")
save(dat, file = "score_data.RData")


dat <- read.csv("~/Dropbox/R book/GitR/BST625/score_data.csv")

##### dat is a data.frame
write.csv(dat, file = "score_data.csv", row.names = FALSE)