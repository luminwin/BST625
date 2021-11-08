###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################

## Go to Blackboard => R => Code for Exercise
## Download
## File 1-data-read-write.R 
## File score_data.RData 
## File score_data.txt 
## File score_data.xlsx 
## File score_data999.csv 
## File score_data.csv 

res <- binom.test(x = 2, n = 25, conf.level = .95)
attriutes(res)
## Exact Confidence Intervals
res$conf.int

## https://luminwin.github.io/Lu/articles/BST625.html