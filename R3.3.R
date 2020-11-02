dat <- read.csv("~/Dropbox/R book/GitR/BST625/score_data.csv")
head(dat)
##  (Total_Score) Total score as the sum of score 1 to 3
##  (Avg_Score) Average score as the mean of the score 1 to 3
##  (grade)         grade A: Avg_Score >= 90
##                        B: Avg_Score [80, 90)
##                        C: Avg_Score [70, 80)
##                        D: Avg_Score [60, 70)
##                        F: Avg_Score [0, 60)
##  (pass) grade A to D: "Pass", grade F: "Fail"

##  create a .csv file in your local machine that contains (name, gender and the above 4 new variables)
##  Data Q1.Score_m contains male students and the students have an average score sorted from low to high.
##  Data Q1.Score_f contains female students and the students have an average score sorted score from high to low.
