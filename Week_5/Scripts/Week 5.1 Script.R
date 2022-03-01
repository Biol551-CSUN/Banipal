### Banipal
### This is my for script for week 5 of Bio551. 
### Created by: Manroop Banipal
### Created on: 2022-02-22

#### Load Libraries ######
library(tidyverse)
library(here)

### Load data ######
# Environmental data from each site
EnviroData<-read_csv(here("Week_5","data", "site.characteristics.data.csv"))

#Thermal performance data
TPCData<-read_csv(here("Week_5","Data", "Topt_data.csv"))
glimpse(EnviroData)
glimpse(TPCData)

EnviroData_wide <- EnviroData %>% 
  pivot_wider(names_from = parameter.measured, # pivot the data wider
              values_from = values) %>%
  arrange(site.letter) # arrange the dataframe by site
View(EnviroData_wide)

FullData_left<- left_join(TPCData, EnviroData_wide)%>%
  relocate(where(is.numeric), .after = where(is.character))
head(FullData_left)

FullData_left %>% 
  group_by(site.letter) %>%
  summarise_if(is.numeric(), list(mean = mean, var =var), na.rm = TRUE)
 
T1 <- tibble(Site.ID = c("A", "B", "C", "D"), 
             Temperature = c(14.1, 16.7, 15.3, 12.8))
T2 <-tibble(Site.ID = c("A", "B", "D", "E"), 
            pH = c(7.3, 7.8, 8.1, 7.9))
T2

left_join(T1, T2)
right_join(T1, T2)

inner_join(T1, T2)
full_join(T1, T2)

semi_join(T2, T1)
anti_join(T2, T1)

install.packages("cowsay")
library(cowsay)
say("hello", by = "random")
