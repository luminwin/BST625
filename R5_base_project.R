dta.state <- read.csv("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv", header = TRUE)
head(dta.state, 10)
tail(dta.state)


###############################################
dta.FL <- dta.state[dta.state$state == "Florida",]
########### Now I want to calculate daily cases and deaths
