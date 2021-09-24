library(tidyverse)
library(ggplot)
library(ggplot2)
library(ggeasy)


co2 <- read.csv("E:/Desktop/FoodConsumption/food_consumption.csv")

co2 %>% 
  group_by(country) %>% 
  summarise(sum_of_consumption = sum(consumption)) %>% 
  arrange(desc(sum_of_consumption)) %>%
  head(20) %>%
  mutate(country = fct_reorder(country,-sum_of_consumption)) %>% 
  ggplot() + geom_col(aes(x = country,
                          y = sum_of_consumption), fill = "blue") +
  ggeasy::easy_rotate_x_labels() +
labs(title = "Total co2 consumption by Country",
     caption = "Source: Tidy Tuesday")
