getwd()
install.packages("tidyverse")
install.packages("dplyr")
install.packages("tidyr")
install.packages("stringr")
library(stringr)
library(tidyr)
library(dplyr)
library(tidyverse)
storm <- read.csv("C:/Users/unnat/Downloads/storm.csv")
head(storm,6)
myvars <- c("BEGIN_YEARMONTH", "BEGIN_DAY", "BEGIN_TIME", "END_YEARMONTH", "END_TIME", "EPISODE_ID", "EVENT_ID", "STATE", "STATE_FIPS", "EVENT_TYPE", "DATA_SOURCE", "BEGIN_LAT", "BEGIN_LON", "END_LAT", "END_LON")
newdata <- storm[myvars]
head(newdata)
install.packages("lubridate")
library(lubridate)
mutate(DATE_TIME = str_c(BEGIN_DAY, BEGIN_TIME), ARR_DATE_TIME = dmy_hms(ARR_DATE_TIME_text))
str_to_upper(STATE)
filter(newdata, CZ_TYPE == "C")
newdata %>% select(-CZ_TYPE)
str_pad(newdata$STATE_FIPS, width=3, side ="left", pad="0" )
unite(newdata,STATE,CZ_FIPS, sep = "_", remove = TRUE)
rename_all(newdata,toupper)
data("state")
us_state_info<-data.frame(state=state.name, region=state.region, area=state.area)
Newset<- data.frame(table(us_state_info$state))
newset1<-rename(Newset, c("state"="Var1"))
merged <- merge(x=newset1,y=us_state_info,by.x="state", by.y="state")
library(ggplot2)
storm_plot <- ggplot(storm, aes(x = area, y=n)) +
  geom_point(aes(color=region)) +
  labs(x = "Land area (square miles",
       y = "# of storm events in 2017")
storm_plot
ggplot (mpg, aes(displ, hwy, colour = class) +
         geom_point())
       