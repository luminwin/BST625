dta.state <- read.csv("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv", header = TRUE)
head(dta.state)

###############################################
dta.FL <- dta.state[dta.state$state == "Florida",]
########### Now I want to calculate daily cases and deaths

## I can do something like
diff(dta.FL$cases)
## then
dta.FL$daily.cases <- c(0, diff(dta.FL$cases))
## but I don't want to type in c(0, diff(dta.FL$XXXX)) again and again
## so I create my own function
diffx <- function(x) c(0,diff(x))
########################
#  create poplulation data
########################
# install.packages("usmap")
library(usmap) ## get state population of US
statepop$fips <- as.numeric(statepop$fips) ## fips in dta.state is numeric so I want to match that
statepop[52:55,1] <- c(66,69,72,78)
statepop[52:55,2] <- c("G","NMI","PR","VI")
statepop[52:55,3] <- c("Guam","Northern Mariana Islands","Puerto Rico","Virgin Islands")
statepop[52:55,4] <- c(161853,55780,3.473*10^6,107710)


##########################
#  create state level data
##########################
all.fip <- unique(dta.state$fips)
N <- length(all.fip)
all.data <- list(); all.pop <- c()

Time <- dta.state[dta.state$state == "Washington", "date"]
idx <- 1:length(Time)
for ( j in 1:N){
  all.data[[j]] <- dta.state[which(dta.state$fips == all.fip[j]),]
  all.pop[j] <- statepop[which(statepop$fips == all.fip[j]),]$pop_2015
  
  all.data[[j]]$daily.cases.prc <- 100*diffx(all.data[[j]]$cases)/all.pop[j]
  all.data[[j]]$daily.deaths.prc <- 100*diffx(all.data[[j]]$deaths)/all.pop[j]
  
  all.data[[j]]$idx <- idx[Time %in% all.data[[j]]$date]
}

names(all.data) <- unique(dta.state$state)


plot(x = all.data$Washington$idx,
     y = all.data$Washington$daily.cases.prc, type = "l")
lines(x = all.data$Florida$idx,
      y = all.data$Florida$daily.cases.prc, type = "l", col = "red")




myplot <- function(x = c('Florida', 'Washington'), all.data){
  y <- lapply(x, 
              function(i) {all.data[[i]][,c("idx","daily.cases.prc")]})
  N <- length(x)
  all.y <- do.call("rbind",y)[,2]
  plot(y[[1]], type = "l", ylim = range(all.y))
  if (N > 1) {
    for (i in 2:N)
  lines(y[[i]],col = i) 
  }
  legend("topright", legend = x, col = 1:N, pch = 15)
}

myplot(c('Florida', 'Washington','New York'), 
       all.data)


myplot <- function(x = c('Florida', 'Washington'), all.data, cols = c("idx","daily.cases.prc")){
  y <- lapply(x, 
              function(i) {all.data[[i]][,cols]})
  N <- length(x)
  all.y <- do.call("rbind",y)[,2]
  plot(y[[1]], type = "l", ylim = range(all.y))
  if (N > 1) {
    for (i in 2:N)
      lines(y[[i]],col = i) 
  }
  legend("topright", legend = x, col = 1:N, pch = 15)
}

myplot(c('Florida', 'Washington','New York'), 
       all.data,
       cols = c("idx","daily.deaths.prc"))