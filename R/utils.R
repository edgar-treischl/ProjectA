library(tidyverse)
library(gapminder)

gapminder_07 <- gapminder %>%
  filter (year == 2007 & continent != "Oceania") %>%
  mutate(pop = pop/1000000,
         gdpPercap = gdpPercap/1000)