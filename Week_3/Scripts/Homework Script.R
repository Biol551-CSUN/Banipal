#### load libraries #####
library(palmerpenguins)
library(tidyverse)
library(here)
library(beyonce)

### homework ###
glimpse(penguins)
penguins$year

ggplot(penguins, aes(x=sex, y=body_mass_g, fill=sex)) +
  geom_boxplot()+
  facet_wrap(~species, scale="free")+
  scale_x_discrete(labels = c("Male","Female","Non binary"))+
  labs( title = "Bodymass per Species",
        y ="Body mass (g)",
        x = "Sex")+
  theme_bw()+
  theme(legend.position="none",
        axis.title = element_text(size = 15,
                                  color = "black"),
        panel.background = element_rect(fill = "linen"),
        strip.text = element_text(face="italic", size = 13),
        title = element_text(size = 17,
                             color = "black"))
ggsave(here("Week_3","output","homework.png"), width = 7, height = 5)
