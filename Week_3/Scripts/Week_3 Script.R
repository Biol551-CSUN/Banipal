## this is week 3 script we are creating a ggplot for palmer penguins ##
### Created by: Manroop Banipal
### Created on: 2022-02-08
##################################

#### load libraries ####
library (tidyverse) 
library (here)

install.packages("palmerpenguins") #data set we are working 
library(palmerpenguins)

#### data analysis ######
glimpse(penguins) #gives us the data from palmers penguin package 

### ggplot ###
ggplot(data=penguins,                     
       mapping = aes(x = bill_depth_mm,    
                     y = bill_length_mm, 
                     color = species,
                     shape = species,
                     size = body_mass_g,
                     alpha = flipper_length_mm)) +
geom_point()+
  facet_grid(species~sex)+
  labs (title= "Bill Depth and Length",
       subtitle = "Measurements of Adelie, Chinstrap, and Gentoo Penguin",
       x= "Bill Depth (mm) ", y= "Bill Length (mm) ",
       # color= "Species",
      
       caption = "Source: Palmer Station LTER / palmerpenguins package") +
scale_color_viridis_d()







