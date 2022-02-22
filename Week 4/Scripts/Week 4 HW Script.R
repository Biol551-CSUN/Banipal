#### Banipal
### This is my for script for the first homework of week 4 of Bio551. 
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

#### groupwork ####

PenguinSummary <- penguins %>%
  group_by(island, sex, species) %>%
  drop_na(sex) %>%
  summarise(mean_body_mass_g = mean(body_mass_g, na.rm = FALSE),
            var_body_mass_g= var(body_mass_g, na.rm=FALSE))

MassPlot <- penguins %>% 
  filter(sex == "female") %>%
  mutate(log_mass = log(body_mass_g))%>%
  select(Species = species, Island = island, Sex = sex, LOG_mass = log_mass)%>%
         ggplot(aes(x = Species,
                       y = LOG_mass)) +
  geom_boxplot ()
  
ggsave (here("Week_4","Output", "HW4.png"),
        width = 7, height = 5)



