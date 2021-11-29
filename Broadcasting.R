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