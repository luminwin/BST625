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