
#### load libraries #####
library(palmerpenguins)
library(tidyverse)
library(here)
library(beyonce)

### ggplot ###
ggplot(data = penguins,
       mapping = aes(x = bill_depth_mm,
                   y = bill_length_mm,
                   group = species,
                   color = species)) +
geom_point() +
  geom_smooth(method = "lm") +
  labs(x = "Bill Depth (mm)",
       y = "Bill Length (mm)") +
    # scale_color_viridis_d() 
  scale_color_manual(values = beyonce_palette(9)) 

ggsave (here("Week_3","Output", "penguin.png"),
        width = 7, height = 5)


