#### Banipal
### This is my script for week 4.2 in this script we will be working with tidyr
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
           remove = FALSE) %>%
  unite(col = "Site_Zone", 
        c(Site,Zone), 
        sep = ".", 
        remove = FALSE)
head(ChemData_clean)

ChemData_long <-ChemData_clean %>%
  pivot_longer(cols = Temp_in:percent_sgd, 
               names_to = "Variables",
               values_to = "Values")
View(ChemData_long)

ChemData_long %>%
  group_by(Variables, Zone, Tide, Site) %>% 
  summarise(Param_means = mean(Values, na.rm = TRUE),
            Param_vars = var(Values, na.rm = TRUE)) 

ChemData_long %>%
  ggplot(aes(x = Site, y = Values))+
  geom_boxplot()+
  facet_wrap(~Variables, scales = "free")

ChemData_wide<-ChemData_long %>%
  pivot_wider(names_from = Variables, 
              values_from = Values)
View(ChemData_wide)

ChemData_clean<-ChemData %>%
  filter(complete.cases(.)) %>% 
  separate(col = Tide_time, 
           into = c("Tide","Time"),
           sep = "_", # separate by _
           remove = FALSE) %>%
  pivot_longer(cols = Temp_in:percent_sgd, 
               names_to = "Variables", 
               values_to = "Values") %>%
  group_by(Variables, Site, Time) %>%
  summarise(mean_vals = mean(Values, na.rm = TRUE))%>%
  pivot_wider(names_from = Variables,
              values_from = mean_vals) %>% 
  write_csv(here("Week_4","Output","summary.csv"))


View(ChemData_clean)
