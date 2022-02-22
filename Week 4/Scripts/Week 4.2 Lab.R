#### Banipal
### This is my script for week 4.2 Lab in this script we will be working with tidyr
### Created by: Manroop Banipal
### Created on: 2022-02-17

#### load libraries #####
library(tidyverse)
library(here)
library(beyonce)
library(devtools)

### Load data ######
ChemData<-read_csv(here("Week_4","data", "chemicaldata_maunalua.csv"))
View(ChemData)
glimpse(ChemData)

ChemData_clean<-ChemData %>%
  filter(complete.cases(.))%>% 
  separate(col = Tide_time,
           into = c("Tide","Time"), 
           sep = "_" ,
           remove = TRUE) %>%
  filter(W) %>%
  pivot_longer(cols = Temp_in:percent_sgd, 
               names_to = "Variables", 
               values_to = "Values") %>%
  group_by(Variables, Site, Time) %>%
  summarise(mean_vals = mean(Values, na.rm = TRUE))

ChemData_long %>%
  group_by(Variables, Site) %>%
  ggplot(aes(x = Long, y = Values,
             color = Tide))+
  geom_point()+
  facet_wrap(~Variables, scales = "free")

ggsave (here("Week_4","Output", "chem longxvalues.png"),
        width = 7, height = 5)

View(ChemData_long)


