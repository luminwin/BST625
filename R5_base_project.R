dta.state <- read.csv("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv", header = TRUE)
head(dta.state, 10)
tail(dta.state)


###############################################
dta.FL <- dta.state[dta.state$state == "Florida",]
########### Now I want to calculate daily cases and deaths

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
head(statepop)

nrow(statepop)
length(unique(dta.state$fips))

unique(dta.state$state)

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

j = 1
all.data[[j]] <- dta.state[which(dta.state$fips == all.fip[j]),]
all.pop[j] <- statepop[which(statepop$fips == all.fip[j]),]$pop_2015

all.data[[j]]$daily.cases.prc <- 100*diffx(all.data[[j]]$cases)/all.pop[j]
all.data[[j]]$daily.deaths.prc <- 100*diffx(all.data[[j]]$deaths)/all.pop[j]

all.data[[j]]$idx <- idx[Time %in% all.data[[j]]$date]

head(all.data[[j]])
