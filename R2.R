age <- c(10, 12, 25, 50, 55, 80)
systolic <- c(120, 118, 122, 160, 149, 140)
## get information
age # just type in the name to get information
head(age) ## quick check for the first 6 elements/rows from data
length(age) ## length of a vector
summary(age)

is.numeric(age) # is it numeric or not? is.character(), is.na(), is.logical()...
is.list(age)
is.vector(age) # Is it a vector or not?
class(age)

age[c(5,2:7)] 
age[5]


dosageWeek1 <- c(2, 8, 9, 13, 25) 
dosageWeek2 <- c(1, 7, 6, 12, 23) 
dosage <- dosageWeek1 / dosageWeek2 
dosage 
summary(dosage) 

names <- c("Raymond", "Lori", "Mary", "Andrew")

id1 <- as.character(1:4)
id2 <- paste(5:8) 
paste("X", 5:8, collapse = "_") 
paste("X", 5:8, sep = "_") 
id <- c(id1, id2) 

dosage <- c("0-9g/day", "10-19", "20-29", "30+", "0-9g/day", "10-19", "20-29", "30+", "0-9g/day") 
summary(dosage) 
table(dosage)

condition <- c(FALSE, TRUE)
is.logical(condition)
typeof(condition)
x <- c(6, 3, 8, 10) 
y <- 6:9 
x == y # check if x equals to y through comparing each element 
age <- c(10, 12, 25, 50, 55, 80)
age[c(FALSE,TRUE,TRUE,TRUE,TRUE,TRUE)]

age[c(FALSE,TRUE,TRUE)] 
age[c(FALSE,TRUE,TRUE,FALSE,TRUE,TRUE)] 

age <- c(10, 12, 25, 50, 55, 80)
systolic <- c(120, 118, 122, 160, 149, 140)
age[systolic== 118]

cancer <- c(0, 1, 0, 1, 1) 
as.factor(cancer) 
is.ordered(esoph$agegp) 
is.factor(esoph$agegp) 

