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
