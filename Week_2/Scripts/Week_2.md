# Banipal
### This is my first script.  I am learning how to import data
### Created by: Manroop Banipal
### Created on: 2022-02-06
###############################################
### Load libraries ########### 
library (tidyverse) 
library (here)

#### read in data ###
WeightData<-read_csv(here("Week_2","Data","weightdata.csv"))

# data analysis ###
head (WeightData) # look at top 6 lines 
tail (WeightData) # look at bottom 6 lines
view (WeightData) # view full data set 




