###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################

install.packages("sqldf") ## after installation, add # in front to put it in comment 
# install.packages("RSQLite") 
library("sqldf")

sqldf("SELECT mpg, cyl FROM mtcars")

sqldf("SELECT mpg cyl FROM mtcars") # this gives you wrong answer; use ,

sqldf("SELECT * FROM mtcars")
sqldf("select * from mtcars")
sqldf('select * from mtcars')

sqldf("SELECT MPG, CYL FROM mtcars") # not case-sensitive except the name of the dataset
# sqldf("select * from MTCARS") # this does not work

sqldf("SELECT 'MPG', 'CYL' FROM mtcars") # this does not work
sqldf('SELECT "MPG", "CYL" FROM mtcars') # this works

sqldf("SELECT mpg as miles_gallon, cyl as N_cylinders FROM mtcars") ## too long so I did the following for seperate lines

sqldf("SELECT mpg as miles_gallon,  
              cyl as N_cylinders
      FROM mtcars")

## don't have to have   as
sqldf("SELECT mpg miles_gallon,     
              cyl N_cylinders
      FROM mtcars")



sqldf('SELECT * FROM mtcars LIMIT 5')

sqldf("SELECT * FROM mtcars ORDER BY mpg LIMIT 5")

sqldf("SELECT * FROM mtcars ORDER BY mpg ASC LIMIT 5")

sqldf("SELECT * FROM mtcars ORDER BY mpg ASC, cyl DESC LIMIT 5")


sqldf('SELECT * FROM mtcars WHERE cyl = 8')

sqldf("select cyl, count(*) from mtcars group by am")

sqldf("select cyl, am, count(*) from mtcars group by am")

sqldf("select cyl, am, count(*) as frequency from mtcars group by am")

sqldf('select distinct am    
       from mtcars')

sqldf('select distinct *    
       from mtcars')

##  int, real, char,
sqldf('select 
          cast(drat as int) dratint,    
          mpg 
      from mtcars LIMIT 5')


############################
# {sqldf}
# In class exercise
############################

head(Orange)

### please list age and circumference for Tree type 1 and sort circumference in an ascending order

