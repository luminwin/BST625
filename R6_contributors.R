#install.packages("hrbrthemes") 
#install.packages("gmodels") 
#install.packages("fortunes")
#install.packages("maps")
#install.packages("nycflights13")
#install.packages("lubridate")


library(nycflights13)
library(tidyverse)
dat <- read_csv("http://courses.washington.edu/b517/Datasets/shoulder.csv")
flights <- flights


############ New product from tidyverse for gather
relig_income %>%
  pivot_longer(-religion, 
               names_to = "income", 
               values_to = "count")

############ New product from tidyverse for spread
fish_encounters %>%
  pivot_wider(names_from = station, 
              values_from = seen)


############ Practice on shoulder data
datw <- dat %>% 
  pivot_wider(names_from = time, 
              values_from = pain, 
              names_prefix = "pain")


############ nodupkey in SAS, pretending gear is id
mtcars %>%
  group_by(gear) %>% 
  slice(1)  



###################################################################	
### 
### BST 625 Contributors' work
###
###################################################################

##########################################################################
# contributor: Victoria Pinilla, Chigozie Nnoruka, Brittney Peterkin {base}
###########################################################################
Pain_long <- dat$pain

hist(Pain_long)
barplot(Pain_long)

#####################################
# contributor: Min Lu
#  hist() is for continuous var
#  barplot() is for categorical var
#  we can have this
#####################################

barplot(table(Pain_long),
        xlab = "Pain level",
        ylab = "Frequency")

#####################################
# contributor: Min Lu {add-on package}
#  hist() is for continuous var
#  our "pain" variable is not continuous enough
#  Let me fake a continuous pain
#####################################
#  install.packages("hrbrthemes")
library(hrbrthemes)

# Build dataset with different distributions
datf <- data.frame(
  time = c( rep("Time 1", 500), rep("Time 2", 500),
            rep("Time 3", 500), rep("Time 4", 500) ),
  Pain = c( rnorm(500, mean = 0), rnorm(500, mean=5),
            rnorm(500, mean = 10), rnorm(500, mean=15))
)

# Represent it
datf %>%
  ggplot( aes(x = Pain, fill = time)) +
  geom_histogram( color="#e9ecef", alpha=0.6, position = 'identity') +
  # scale_fill_manual(values=c("#69b3a2", "#404080")) +
  theme_ipsum() +
  labs(fill="")

detach("package:hrbrthemes", unload=TRUE)


##################################################
# contributor: Jeronimo-Alexander Maradiaga {base}
##################################################
getmode <- function(Pain_long) {
  uniq <- unique(Pain_long)
  uniq[which.max(tabulate(match(Pain_long, uniq)))]
}
result <- getmode(Pain_long)
print(result)

################################################################
# contributor: Min Lu {base}
#  table() is equavelant to tabulate(match(Pain_long, uniq))
################################################################

getmode <- function(Pain_long) {
  uniq <- unique(Pain_long)
  uniq[which.max(table(Pain_long))]
}
result <- getmode(Pain_long)
print(result)


###########################################
# contributor: Qinran Liu (HW4) {base}
###########################################
table(Pain_long)

#########################################################
# contributor: Karlon Johnson, Farouq Selkhi (HW4) {base}
#########################################################
age <- dat$age
unique(age) ## unique() is from {base}, which is equivalent 
## to distinct() from {tidyverse}

############################################
# contributor: Nathaniel Castor (HW4) {base}
############################################
head(dat, 10)

###########################################
# contributor: Lauren Nahodyl (HW4) {base}
###########################################
tail(dat, 10)

###########################################
# contributor: Antonela Peña (HW4) {base}
###########################################
range(Pain_long) 
min(Pain_long)
range(Pain_long)[1]
#The range is 4 since the highest pain level is 4 and 
# the lowest pain level is 0


#############################################
# contributor: Katy Haller {add-on packages}
# P.S Katy's example is always impressive!!!
#############################################

#install.packages("gmodels") 
library(gmodels)
sex<-dat$sex
CrossTable(sex, Pain_long, 
           digits=3, 
           prop.r=FALSE, 
           prop.c=FALSE, 
           prop.chisq = FALSE)  

##install.packages("fortunes")
library(fortunes)
fortune("silly")

#this command tells you a funny quote, joke or fortune.
# if you want a result with a specific word, you can replace "silly" with 
# another word or simply leave it empty for a random one.

#install.packages("maps")
#install.packages("nycflights13")
library(maps)
library(nycflights13)
#making basemap
map("world", regions = c("usa"), fill = T, 
    col = "grey8", bg = "grey15", 
    ylim = c(21.0,50.0), xlim = c(-130.0,-65.0))
#overlaying airports
points(airports$lon,
       airports$lat, 
       pch=3, cex=0.1, col="chocolate1")

detach("package:gmodels", unload=TRUE)
detach("package:fortunes", unload=TRUE)
detach("package:maps", unload=TRUE)



###########################################
# contributor: Antonela Peña {tidyverse}
###########################################

ggplot(flights[1:20,], aes(x=origin, y=dest)) +
  geom_line(aes(group=1), colour="#000099") +
  geom_point(size=3, colour="#CC0000")


###########################################
# contributor: Armando Bonheur {base}
###########################################

lmPain <- lm(pain ~ sex, data = dat)
summary(lmPain)
## ----| This function creates a linear regression to 
## analyze the relationship between the pain assessment recorded 
## by as a result of the sex of the participant. 

#####################################################################
# contributor: Min Lu {base}
#  The data is in long format with repeated measures. The observations
#  are therefore not independent. We should do this
######################################################################
datw$Avg_pain <- rowMeans(datw[, paste("pain", 1:6, sep = "")])

lmPainw<- lm(Avg_pain ~ sex, data = datw)
summary(lmPainw)


################################################
# contributor: Victoria Pinilla {add-on package}
#################################################
library(lubridate) ## belongs to tidyverse but you have to library it
# flights <- read_csv("C:/Users/mlu6/Dropbox/R book/R3/flights.csv")
flights %>%
  mutate(
    date = make_date(year, month, day),
    wday = wday(date, label = TRUE)
  ) %>%
  ggplot(aes(y = distance, x = wday)) +
  geom_boxplot() +
  labs(x = "Day of Week", y = "Average Distance")

detach("package:lubridate", unload=TRUE)


###########################################
# contributor: Akina_Natori {tidyverse}
###########################################

ggplot(flights, aes(fill=flights$carrier, y=flights$dep_delay, x=flights$origin)) + 
  geom_bar(position="dodge", stat="identity")

#########################################################################
# contributor: Min Lu
#  You can but you don't have to use $ for {tidyverse} command, we can do
#########################################################################

ggplot(flights, aes(fill = carrier, 
                    y = dep_delay, 
                    x = origin)) + 
  geom_bar(position = "dodge", stat = "identity")


#########################################################################
# contributor: Weiliang Wang {base}
#########################################################################

rnorm(n=100, mean=15, sd=2)

# random generation from the normal distribution with mean equals to 15 and
##standard deviation equals to 2.

#########################################################################
# contributor: Niara Williams {base}
#########################################################################

one.way <- aov(dep_delay ~ arr_time, data = flights)
summary(one.way)

#########################################################################
# contributor: Zeyu Li {tidyverse}
#########################################################################
## From HW5 I have learned that some of the commands' order matter. For question 5,
## if I move "select" command before mutate command (create a new indicator) 
## I will recieve an error message even the mutate command is next line.

#########################################################################
# contributor: Tashimaimaiti Teliman {tidyverse}
#########################################################################

## ----| R markdown is good and interesting,
## and export Rmarkdown as word document is better than PDF file. 

#########################################################################
# contributor: Abir Abu Subeh {base}
#########################################################################
flights[flights$day==24 & flights$month==12,]



#########################################################################
# contributor: Qinran Liu {tidyverse}
#########################################################################

flights %>%
  count(origin, dest) %>%
  arrange(desc(n)) %>%
  head(10)

###  Min's comment: this is very useful pipeline for R Markdown when R Markdown
###    gives you too long output in your knitted document

#########################################################################
# contributor: Karlon Johnson {base}
#########################################################################
f <- data.frame(x1 = c(8, 9, 2, 1),
                x2 = c(12, 13, 6, 7),
                x3 = c(1, 1, 8, 9))

y1 <- c(5, 4, 3, 2)

data.creation <- cbind(f, y1)

## ----|I created a new data frame and a new vector. 
## I use the cbind function to combine the vector and data frame by column. 

#########################################################################
# contributor: Lingwei Zhang {base}
#########################################################################

datw$age <- as.numeric(datw$age) ## coersing non-numeric vector to numeric vector
qqnorm(datw$age, ylab = "age")
qqline(datw$age)
