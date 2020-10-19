###################################################################	
### <October 21 2020> Min Lu
###
###  
###
###################################################################	
### 
### Topic 2 Data visualization
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

################### from R {base} packages
# pie chart
data(esoph) ## bring esoph data from environment "package:datasets" to environment ".GlobalEnv"
## esoph <- esoph # the same as above
# originalPar <- par() # default setting of figure layout
par(mfrow = c(1, 2)) # Multiple figures in 1 graphic with 1 row and 2 columns
pie(table(esoph$agegp), main = "Age groups from Smoking, \n Alcohol and (O)esophageal Cancer")
par(mfrow = c(1, 1)) # change back to the default setting

# scatter plot

# Simple Scatterplot
attach(mtcars) ## elevate the data to the top environment
head(mtcars)
pdf("Scatter.pdf", width = 5, height = 5)
plot(wt, mpg, main = "Scatterplot Example",
     xlab = "Car Weight ", ylab = "Miles Per Gallon ", pch = 19,col = gear)
abline(lm(mpg ~ wt), col = "red") # regression line (y~x)
lines(lowess(wt, mpg), col = "blue") # lowess line (x,y)
legend("topright", legend = paste("gear =", unique(gear)), 
       col = unique(gear), pch = 19, bty = "n")
legend("right", legend = c("Linear regression", "Lowess"), 
       col = c("red","blue"), lty = 1, bty = "n")
dev.off()

# pairwise comparison Scatterplot
plot(mtcars[, c(1:3,6)], labels = c("Miles/(US) gallon", 
                                    "Number of cylinders", 
                                    "Displacement (cu.in.)",
                                    "Weight (1000 lbs)"), 
     col = gear, pch = 19)



library(ggplot2) # if you have error you have to run the following first
# install.packages("ggplot2")

?mpg # check the data
ggplot(data = mpg) +    
  aes(x = displ, y = hwy) +  
  geom_point(aes(colour = cyl)) + 
  # Default smoother is LOESS
  geom_smooth() +
  geom_smooth(method = "lm", colour = "red")



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

install.packages('ggplot2') 


########################## waffle plot

library("waffle")
p <- waffle(bladder, 
            rows = 4, 
            size = .25,
            colors=c("#ff0000", "#c7d4b6", "#a3aabd", "#000000"),
            title = "Method of Discovery of Bladder Cancer (N=21)",
            xlab = "1 square = 1 man"
)
pdf("waffle.pdf", width = 6, height = 4)
p
dev.off()