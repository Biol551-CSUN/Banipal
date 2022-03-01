### This the lab for Week 5.2 we will be data wrangling with lubridate 
## Created by: Manroop Banipal
## Updated on: 2022.03.03


## Load libraries ##
library(tidyverse)
library(lubridate)
library(here)
library(ggplot)

#### Analysis

CondData <- read_csv(here("Week_5", "Data", "CondData.csv"))
DepthData <- read_csv(here("Week_5", "Data", "DepthData.csv"))

View(CondData)
View(DepthData)

CondData_new <- CondData %>% 
  mutate(datetime = mdy_hms(depth),
         datetime = round_date(datetime, "10 secs")) %>% 
  select("TempInSitu","Serial","SalinityInSitu_1pCal","datetime")

View(CondData_new)

DepthData_new <- DepthData %>% 
  mutate(datetime = ymd_hms(date),
         datetime = round_date(datetime, "10 secs")) %>% 
  select("AbsPressure","Depth","datetime")

View(DepthData_new)

Combined <- inner_join(CondData_new, DepthData_new, by = "datetime") %>%
  mutate(hour = hour(datetime),
         minute = minute(datetime)) %>% 
  group_by(minute) %>%
  summarise(avgdate = mean(Depth.Data, na.rm = TRUE), # calculates averages
            avgdepth = mean(Date.Time, na.rm = TRUE),
            avgtemp = mean(Temp.Situ, na.rm = TRUE))
View(FullData)

#### GGplot
ggplot(aes(x = Depth.Data, 
           y = SalinityInSitu_1pCal,
           color = TempInSitu)) +
  geom_point() + 
  labs(title = "Salinity In Situ in Relatinon to Depth and Temperature", 
       x = "Salinity In Situ", 
       y = "Depth", 
       color = "Temperature in °C") 
