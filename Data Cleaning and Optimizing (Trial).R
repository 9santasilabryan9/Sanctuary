
# ------------------Data Cleaning ------------

library(tidyverse)
view(starwars)

#variable types

glimpse(starwars)
class(starwars$gender)
unique(starwars$gender)

starwars$gender <- as.factor(starwars$gender)
class(starwars$gender)

levels(starwars$gender)

starwars$gender<- factor((starwars$gender), levels = c("masculine", "feminine"))
levels(starwars$gender)

#select variables

names(starwars)
starwars %>% 
  select(name, height, ends_with('color')) %>% 
  names()

unique(starwars$hair_color)

starwars %>% 
  select(name, height, ends_with("color")) %>% 
  filter(hair_color %in% c("blond", "brown") & height < 180)

mean(starwars$height, na.rm = TRUE)

starwars %>% 
  select(name, gender, height, hair_color) %>% 
  na.omit()

starwars %>% 
  select(name, gender, height, hair_color) %>% 
  filter(!complete.cases(.)) %>% 
  mutate(hair_color = replace_na(hair_color, 'none'))


data()
view(msleep)

glimpse(msleep)

min(msleep$awake)
summary(msleep)
summary(msleep$awake)
msleep %>% 
  select(sleep_total, brainwt) %>% summary

msleep %>% 
  drop_na(vore) %>% 
  group_by(vore) %>% 
  summarise(lower = min(sleep_total),
            average = mean(sleep_total),
            upper = max(sleep_total),
            difference = max(sleep_total)- min(sleep_total)) %>% 
  arrange(average) %>% view()

# ------------ Data Describe and summary ------------
library(MASS)
attach(Cars93)

glimpse(Cars93)

table(Origin)
table(AirBags, Origin)
addmargins(table(AirBags, Origin),1)

table(AirBags, Origin)
prop.table(table(AirBags, Origin))*100
#Add all to 100%

prop.table(table(AirBags, Origin),2)*100
# add the each column to 100% , 1 for rows

round(prop.table(table(AirBags, Origin),2)*100)
# round 

Cars93 %>% 
  group_by(Origin, AirBags) %>% 
             summarise(number = n()) %>% 
             pivot_wider(names_from = Origin, 
                         values_from = number)

# ------ Data Visulisation -------

