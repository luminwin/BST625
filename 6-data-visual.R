###################################################################	
### <October 4 2020> Min Lu
###
###  
###
###################################################################	
### 
### Topic 6 
### R section for BST 625
### Statistical Computing
### Fall 2020
### ------------------------------------------------------------
###  Min Lu, PhD                     m.lu6@umiami.edu
###                                  phone: 305-243-5473
###  Research Assistant Professor, Division of Biostatistics           
###  Clinical Research Building
###  1120 NW 14th Street, Room 1059
###  University of Miami, Miami FL 33136
###
###  -------------------------------------------------------------
###  THIS PROGRAM SHOULD NOT BE COPIED, USED, MODIFIED, OR 
###  DISSEMINATED IN ANY WAY WITHOUT SPECIFIC WRITTEN PERMISSION 
###  FROM THE AUTHOR.
###
###################################################################


library(tidyverse) # if you have error you have to run the following first
# install.packages("tidyverse")


################################

?mpg # check the data
ggplot(data = mpg) +
  aes(x = displ, y = hwy) + 
  geom_point(aes(colour = cyl)) + 
  # Default smoother is LOESS
  geom_smooth() +
  geom_smooth(method = "lm", colour = "red") +
  ggsave(height = 4, width = 4*1.9,
                file = "scatterexample.jpg")


###################################################
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
  ggplot() +
     geom_bar(mapping = aes(x = grade)) +
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
    ggplot(aes(gender, Avg_Score, fill = factor(major))) +
        geom_boxplot()           



################################
ggplot(data = mpg) +
  aes(x = displ, y = cty, colour = class) + 
  geom_point() +
  facet_grid(drv ~ cyl) +
  ggtitle("Plot of mpg data \n using ggplot2") +
  xlab("Engine displacement, in litres") + ylab("City miles per gallon") +
  theme(axis.text = element_text(size = 9),
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


################################### 
# some {base} if you are interested
###################################
# GENERATE THE DATA  

Age = c(50, 55, 60, 65, 70)                                     # Age groups  
Male = c(15.4, 24.3, 37.0, 54.6, 71.1)                          # Death rates for males  
Female = c(8.4, 13.6, 19.3, 35.1, 50.0)                         # Death rates for females  
Deathrate = matrix(c(Male,Female), nrow=length(Age), ncol=2, 
                   dimnames=list(Age, c("Male","Female")))         
# Create a matrix Deathrate with the data  
Deathrate2 = t(Deathrate)                                       # Transpose the Deathrate matrix  

# SIMPLE BARPLOT                                        # Open a new window for the plot  

barplot(Deathrate2,                             # Data (bar heights) to plot  
        beside=TRUE,                            # Plot the bars beside one another; default is to plot stacked bars  
        space=c(0.2,0.8),                       # Amount of space between i) bars within a group, ii) bars between groups  
        names.arg=c("65-69", "60-64", "55-59", "50-54", "70-74"),    #Names for the bars  
        col=c("blue", "red"),                   # Color of the bars  
        border="black",                         # Color of the bar borders  
        main=c("Death rates in Virginia"),      # Main title for the plot  
        xlab="Age group",                       # X-axis label  
        ylab="Death rate",                      # Y-axis label  
        font.lab=2)                             # Font to use for the axis labels: 1=plain text, 2=bold, 3=italic, 4=bold italic  

legend("topleft",                               # Add a legend to the plot  
       legend=c("Male", "Female"),             # Text for the legend  
       fill=c("blue", "red"))                  # Fill for boxes of the legend  


