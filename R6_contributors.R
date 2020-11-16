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
