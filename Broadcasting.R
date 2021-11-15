###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################

############ go to Blackboard and download score_data.RData from R6

load("score_data.RData")
#load("/Users/min/Dropbox/R book/GitR/BST625/data/score_data.RData")

library(tidyverse) # if you have error you have to run the following first
# install.packages("tidyverse")

?mpg # check the data

ggplot(mpg) +
  aes(x = hwy) +
  geom_histogram(bins = 20)

ggplot(mpg) +
  geom_histogram(aes(x = displ))

ggplot(data = mpg) +
  aes(x = displ, y = hwy) + 
  geom_point(aes(colour = cyl)) + 
  # Default smoother is LOESS (Locally Weighted Scatterplot Smoothing)
  geom_smooth() +
  geom_smooth(method = "lm", colour = "red") 

ggsave(height = 4, width = 4*1.9,
       file = "scatterexample.pdf")

# load("score_data.RData")

## make a scatter plot using score1 score2

ggplot(data = dat) +
  aes(x = score1, y = score2) + 
  geom_point(aes(colour = score3)) + 
  geom_smooth() +
  geom_smooth(method = "lm", colour = "red") 

ggplot(data = mpg) +
  aes(x = displ, y = hwy) + 
  geom_point(aes(colour = drv,
                 size = cyl),
             alpha = 0.5) + 
  geom_smooth() +
  geom_smooth(method = "lm", colour = "red") 

ggplot(data = dat) +
  aes(x = score1, y = score2) + 
  geom_point(aes(colour = gender,
                 size = score3)) + 
  geom_smooth() +
  geom_smooth(method = "lm", colour = "red") 

dat %>% mutate(
  Total_Score = rowSums(select(., score1:score3), na.rm = TRUE), 
  Avg_Score = rowMeans(select(.,score1:score3), na.rm = TRUE), 
  grade = case_when( 
    Avg_Score < 60 ~ "F", 
    (60 <= Avg_Score)&(Avg_Score < 70) ~ "D", 
    (70 <= Avg_Score)&(Avg_Score < 80) ~ "C", 
    (80 <= Avg_Score)&(Avg_Score < 90) ~ "B", 
    Avg_Score >= 90 ~ "A"),
  pass = case_when(
    grade == "F"~"Fail", 
    TRUE ~"Pass"))  %>%
  ggplot() +
  aes(x = score1, y = score2) + 
  geom_point(aes(colour = Avg_Score)) + 
  geom_smooth() +
  geom_smooth(method = "lm", colour = "red")

dat %>% mutate(
  Total_Score = rowSums(select(., score1:score3), na.rm = TRUE), 
  Avg_Score = rowMeans(select(.,score1:score3), na.rm = TRUE), 
  grade = case_when( 
    Avg_Score < 60 ~ "F", 
    (60 <= Avg_Score)&(Avg_Score < 70) ~ "D", 
    (70 <= Avg_Score)&(Avg_Score < 80) ~ "C", 
    (80 <= Avg_Score)&(Avg_Score < 90) ~ "B", 
    Avg_Score >= 90 ~ "A"),
  pass = case_when(
    grade == "F"~"Fail", 
    TRUE ~"Pass")) %>%
  rename(GRE = score1,
         GPA_stats_I = score2,
         GPA_stats_II = score3) %>%
  ggplot() +
  aes(x = GRE, y = GPA_stats_II) + 
  geom_point(aes(colour = GPA_stats_I)) + 
  # Default smoother is LOESS
  geom_smooth() +
  geom_smooth(method = "lm", colour = "red")+
  labs(x = "GRE", y="GPA stats II")

dat %>% mutate(
  Total_Score = rowSums(select(., score1:score3), na.rm = TRUE), 
  Avg_Score = rowMeans(select(.,score1:score3), na.rm = TRUE), 
  grade = case_when( 
    Avg_Score < 60 ~ "F", 
    (60 <= Avg_Score)&(Avg_Score < 70) ~ "D", 
    (70 <= Avg_Score)&(Avg_Score < 80) ~ "C", 
    (80 <= Avg_Score)&(Avg_Score < 90) ~ "B", 
    Avg_Score >= 90 ~ "A"),
  pass = case_when(
    grade == "F"~"Fail", 
    TRUE ~"Pass")) %>%
  ggplot() +
  geom_bar(mapping = aes(x = grade), fill = "blue") +
  labs(x = "Grade", y="Count Number")

dat %>% mutate(
  Total_Score = rowSums(select(., score1:score3), na.rm = TRUE), 
  Avg_Score = rowMeans(select(.,score1:score3), na.rm = TRUE), 
  grade = case_when( 
    Avg_Score < 60 ~ "F", 
    (60 <= Avg_Score)&(Avg_Score < 70) ~ "D", 
    (70 <= Avg_Score)&(Avg_Score < 80) ~ "C", 
    (80 <= Avg_Score)&(Avg_Score < 90) ~ "B", 
    Avg_Score >= 90 ~ "A"),
  pass = case_when(
    grade == "F"~"Fail", 
    TRUE ~"Pass")) %>%
  ggplot() +
  geom_count(mapping = aes(x = grade, y = gender)) +
  labs(x = "Grade", y="Female/Male")

########################################### slide # 6
dat %>% mutate(
  Total_Score = rowSums(select(., score1:score3), na.rm = TRUE), 
  Avg_Score = rowMeans(select(.,score1:score3), na.rm = TRUE), 
  grade = case_when( 
    Avg_Score < 60 ~ "F", 
    (60 <= Avg_Score)&(Avg_Score < 70) ~ "D", 
    (70 <= Avg_Score)&(Avg_Score < 80) ~ "C", 
    (80 <= Avg_Score)&(Avg_Score < 90) ~ "B", 
    Avg_Score >= 90 ~ "A"),
  pass = case_when(
    grade == "F"~"Fail", 
    TRUE ~"Pass")) %>%
  count(grade, gender) %>%  
  ggplot(mapping = aes(x = grade, y = gender)) +
  geom_tile(mapping = aes(fill = n))+
  labs(x = "Grade", y="Female/Male")

load("score_data.RData")
dat %>% mutate(
  Total_Score = rowSums(select(., score1:score3), na.rm = TRUE), 
  Avg_Score = rowMeans(select(.,score1:score3), na.rm = TRUE), 
  grade = case_when( 
    Avg_Score < 60 ~ "F", 
    (60 <= Avg_Score)&(Avg_Score < 70) ~ "D", 
    (70 <= Avg_Score)&(Avg_Score < 80) ~ "C", 
    (80 <= Avg_Score)&(Avg_Score < 90) ~ "B", 
    Avg_Score >= 90 ~ "A"),
  pass = case_when(
    grade == "F"~"Fail", 
    TRUE ~"Pass")) %>%
  ggplot(aes(gender, Avg_Score, fill = factor(major))) +
  geom_boxplot()  +
  theme_classic()

########################################### slide # 8
ggplot(data = mpg) +
  aes(x = displ, y = cty, colour = class) + 
  geom_point() +
  facet_grid(drv ~ cyl) +
  ggtitle("Plot of mpg data \n using ggplot2") +
  xlab("Engine displacement, in litres") + ylab("City miles per gallon") +
  theme(axis.text = element_text(size = 10),
        axis.title = element_text(size = 14, face = "bold"),
        plot.title = element_text(size = rel(2)),
        legend.title = element_text(face = "bold"),
        panel.background = element_rect(fill = "white", colour = "grey50"))

dat %>% mutate(   
  Total_Score = rowSums(select(., score1:score3), na.rm = TRUE), 
  Avg_Score = rowMeans(select(.,score1:score3), na.rm = TRUE), 
  grade = case_when( 
    Avg_Score < 60 ~ "F", 
    (60 <= Avg_Score)&(Avg_Score < 70) ~ "D", 
    (70 <= Avg_Score)&(Avg_Score < 80) ~ "C", 
    (80 <= Avg_Score)&(Avg_Score < 90) ~ "B", 
    Avg_Score >= 90 ~ "A"),
  pass = case_when(
    grade == "F"~"Fail", 
    TRUE ~"Pass")) %>%
  ggplot(aes(x = factor(1), fill = factor(grade))) +
  geom_bar(stat = "count") +  #### now the magic happens
  coord_polar(theta = 'y') +
  labs(fill = "Grade") +
  xlab(" ") + 
  theme(legend.title = element_text(size=18),
        axis.text = element_text(size = 12),
        axis.title = element_text(size = 14, face = "bold"))

####################
# {base}
####################
Age <- c(50, 55, 60, 65, 70)                                     # Age groups  
Male <- c(15.4, 24.3, 37.0, 54.6, 71.1)                          # Death rates for males  
Female <- c(8.4, 13.6, 19.3, 35.1, 50.0)                         # Death rates for females  
Deathrate <- matrix(c(Male,Female), nrow = length(Age), ncol = 2, 
                    dimnames = list(Age, c("Male","Female")))         
# Create a matrix Deathrate with the data  
Deathrate2 = t(Deathrate)                                       # Transpose the Deathrate matrix  

# SIMPLE BARPLOT                                        # Open a new window for the plot  

barplot(Deathrate2,                             # Data (bar heights) to plot  
        beside = TRUE,                            # Plot the bars beside one another; default is to plot stacked bars  
        space = c(0.2,0.8),                       # Amount of space between i) bars within a group, ii) bars between groups  
        names.arg = c("65-69", "60-64", "55-59", "50-54", "70-74"),    #Names for the bars  
        col = c("blue", "red"),                   # Color of the bars  
        border = "black",                         # Color of the bar borders  
        main = c("Death rates in Virginia"),      # Main title for the plot  
        xlab = "Age group",                       # X-axis label  
        ylab = "Death rate",                      # Y-axis label  
        font.lab = 2)                             # Font to use for the axis labels: 1=plain text, 2=bold, 3=italic, 4=bold italic  

legend("topleft",                               # Add a legend to the plot  
       legend=c("Male", "Female"),             # Text for the legend  
       fill=c("blue", "red"))                  # Fill for boxes of the legend  

####################
# {base}
####################
dat <- read.csv("http://courses.washington.edu/b517/Datasets/shoulder.csv")
dat <- reshape(dat, v.names = "pain", idvar = "id",
               timevar = "time", direction = "wide")
dat$age_grp <- cut(dat$age, breaks = c(0,(2.4:7.4)*10,range(dat$age)[2]),
                   labels = c("24-", "25-34", "35-44", "45-54", "55-64","65-74","75+"),
                   ordered_result = TRUE)
dat$ct_grp <- factor(dat$trt, levels = 1:2, labels = c("control", "treatment"), ordered = TRUE)
table(dat$age_grp,dat$ct_grp)
dat$Avg_Pain <- rowMeans(dat[,paste("pain", 1:6, sep = ".")], na.rm = TRUE)

cols <- c("darkgreen", "orange")

boxplot(Avg_Pain ~ trt + sex, data = dat)