###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################

checkuse <-function(x){
  
  if(x %in% rownames(installed.packages()) == FALSE) {
    
    install.packages(x)
    
  }
  
  library(x, character.only = TRUE)
  
}

############################################
# {sqldf}
# Basic manipulation 
############################################
checkuse("sqldf")

sqldf("SELECT mpg, cyl FROM mtcars")

sqldf("SELECT mpg cyl FROM mtcars") # this gives you wrong answer; use ,

sqldf("SELECT * FROM mtcars")
sqldf("select * from mtcars")
sqldf('select * from mtcars')

sqldf("SELECT MPG, CYL FROM mtcars") # not case-sensitive except the name of the dataset
# sqldf("select * from MTCARS") # this does not work

sqldf("SELECT 'MPG', 'CYL' FROM mtcars") # this does not work
sqldf('SELECT "MPG", "CYL" FROM mtcars') # this works

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

sqldf("select cyl, am, count(*) from mtcars group by am")

sqldf("select am, count(*) as frequency from mtcars group by am")

sqldf('select distinct mpg    
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

sqldf("SELECT age, circumference FROM Orange 
      WHERE tree = 1
      ORDER BY circumference ASC")


sqldf("select case
                  when vs == 1 then 'straight'
                  when vs == 0 then 'V-shaped'
              end as vschar
       from mtcars limit 5")

library(tidyverse)
mtcars %>% 
  mutate(vschar = case_when(
    vs == 1 ~ 'straight',
    vs == 0 ~ 'V-shaped'
  ))

## it looks strange if you don't give it a new name
sqldf("select case
                  when vs == 1 then 'straight'
                  when vs == 0 then 'V-shaped'
              end 
       from mtcars limit 5")