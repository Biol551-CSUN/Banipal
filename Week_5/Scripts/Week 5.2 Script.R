### Banipal
### This is my second for script for week 5 of Bio551. 
### Created by: Manroop Banipal
### Created on: 2022-02-22

### Load Libraries ###
library(tidyverse)
library(here)
library(lubridate)


### Load data ###
CondData <- read_csv(here("Week_5","Data","CondData.csv"))
DepthData <- read_csv(here("Week_5","Data","DepthData.csv"))

glimpse(CondData)
glimpse(DepthData)


### Analysis ###

now() 
now(tzone = "EST")  
now(tzone = "GMT")
today() 
today(tzone = "GMT")
am(now()) 
leap_year(now())
ymd("2021-02-24")
mdy("02/24/2021")
mdy("February 24 2021")
dmy("24/02/2021")
ymd_hms("2021-02-24 10:22:20 PM")
mdy_hms("02/24/2021 22:22:20")
mdy_hm("February 24 2021 10:22 PM")



datetimes<-c("02/24/2021 22:22:20",
             "02/25/2021 11:21:10",
             "02/26/2021 8:01:52")


datetimes <- mdy_hms(datetimes)

month(datetimes)  
month(datetimes, label = TRUE) 
month(datetimes, label = TRUE, abbr = FALSE) 
day(datetimes) 
wday(datetimes, label = TRUE) 
hour(datetimes)  
minute(datetimes) 
second(datetimes) 

datetimes + hours(4) 
datetimes + days(2) 

round_date(datetimes, "minute") 
round_date(datetimes, "5 mins") 

CondData <- read_csv(here("Week_5","Data","CondData.csv")) %>% 
  mutate(datetime = mdy_hms(depth)) %>% 
  drop_na()

