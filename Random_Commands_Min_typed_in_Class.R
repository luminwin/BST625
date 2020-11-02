search() ## get your "global" environments 
ls() ## list all the objects in your ".GlobalEnv" environment
head(esoph) ## check your data through your R console 
tail(esoph) ## check your data through your R console 
contributors() ## check the Authors of R and core group of R
mean(c("1", "2")) ## warning sign
debugonce(mean) ## go inside of R functions
mean(c("1", "2"))
crazy.mean <- function (x, trim = 0, na.rm = FALSE, ...) 
{
  if (!is.numeric(x) && !is.complex(x) && !is.logical(x)) {
   # warning("argument is not numeric or logical: returning NA")
    return("Happy October Fools Day")
  }
  if (na.rm) 
    x <- x[!is.na(x)]
  if (!is.numeric(trim) || length(trim) != 1L) 
    stop("'trim' must be numeric of length one")
  n <- length(x)
  if (trim > 0 && n) {
    if (is.complex(x)) 
      stop("trimmed means are not defined for complex data")
    if (anyNA(x)) 
      return(NA_real_)
    if (trim >= 0.5) 
      return(stats::median(x, na.rm = FALSE))
    lo <- floor(n * trim) + 1
    hi <- n + 1 - lo
    x <- sort.int(x, partial = unique(c(lo, hi)))[lo:hi]
  }
  .Internal(mean(x))
}

crazy.mean(c("1", "2"))

x <- 5 ## A value is still a vector in R
x
x[3] ## x[3] is NA but it is still there

x <- mtcars$mpg + 1 ## another way to assign a vector
x <- c(mtcars$mpg, mtcars$cyl) ## another way to assign a vector
head(x)
## save your environment in your harddrive. Not useful for most of you because
## you should use the commands in your script to create your objects again when 
## you open a new script
save.image("C:/Users/mlu6/Dropbox/R book/GitR/BST625/evn20201018.RData") 
## the above command is "expensive" in space since it saves all the objects, I often use
save(x, mtcars, file = "evn20201018.RData") ## to save specific objects

dat <- read.csv("http://courses.washington.edu/b517/Datasets/shoulder.csv")
### don't name your data "data" because data is a function
data <- read.csv("http://courses.washington.edu/b517/Datasets/shoulder.csv")

data(mtcars)  
mtcars <- mtcars