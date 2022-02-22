#### Banipal
### This is my for script for week 4 of Bio551. 
### Created by: Manroop Banipal
### Created on: 2022-02-15

#### load libraries #####
library(palmerpenguins)
library(tidyverse)
library(here)
library(beyonce)
library(devtools) # load the development tools library
devtools::install_github("jhollist/dadjoke")

### Load data ######
# The data is part of the package and is called penguins
glimpse(penguins)

### playing with dplyr #

filter(.data = penguins,
       year %in% c("2008","2009"))
filter(.data = penguins,
       island != c("Dream"))    
filter(.data = penguins,
       species %in% c("Adelie","Gentoo"))    

data2 = mutate(.data = penguins, 
              body_mass_kg = body_mass_g/1000)


data2<-mutate(.data = penguins, 
              body_mass_kg = body_mass_g/1000,
              bill_length_depth = bill_length_mm/bill_depth_mm)


### working with ifelse and mutating ####
data2<- mutate(.data = penguins,
               after_2008 = ifelse(year>2008, "After 2008", "Before 2008"))


data2<-mutate(.data = penguins, 
              flipper_mass = flipper_length_mm + body_mass_g, 
              size = ifelse(flipper_mass>4000, "Big", "Small")) 

data3 <- penguins %>% 
  filter(sex == "female") %>% 
  mutate(log_mass = log(body_mass_g))%>% 
  select(Species = species, Island = island, Sex = sex, LOG_mass = log_mass)

penguins %>% 
  summarise(mean_flipper = mean(flipper_length_mm, na.rm=TRUE),
            min_flipper = min(flipper_length_mm, na.rm=TRUE))

penguins %>%
  group_by(island, sex) %>%
  drop_na(sex) %>%
  summarise(mean_bill_length = mean(bill_length_mm, na.rm = TRUE),
            max_bill_length = max(bill_length_mm, na.rm=TRUE))


