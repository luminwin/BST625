################### slide 12
age <- c(10, 12, 25, 50, 55, 80)
attributes(age)
attributes(age) <- list(collectDate = "20200101", Collectedby = "Tom Hanks")
attributes(age) 
class(age)

x <- data.frame(a = 1:3, pi = pi) # data frame with dimnames
attributes(x)

rownames(x) <- paste("row", 1:3, sep = ".")
attributes(x)
x$pi

x <- list(a = 1:3, pi = pi)
x$pi