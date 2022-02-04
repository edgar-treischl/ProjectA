example_plot <- function(variables) {
  mean_gdps <- gapminder_07 %>% 
    group_by(continent)%>% 
    summarise(mean_gdp = mean(gdpPercap)/1000,
              mean_lifeExp = mean(lifeExp))
  
  
  p1 <- ggplot(gapminder_07, aes(x=gdpPercap, y=lifeExp)) +
    geom_point(position = "jitter", color = "gray") +    
    geom_smooth(color = "red") +
    labs(x = "GDP (per 1000 Dollar)", 
         y = "Life expectancy")
  
  
  p2 <- ggplot(gapminder_07, aes(x=gdpPercap, y=lifeExp)) +
    geom_point(position = "jitter", color = "gray") + 
    geom_smooth(color = "black", se = F, size = 0.5) +
    facet_wrap( ~ continent, ncol=2, scales="free")+
    geom_vline(data = mean_gdps, mapping = aes(xintercept = mean_gdp),
               color = "red", linetype = 2) +
    geom_hline(data = mean_gdps, mapping = aes(yintercept = mean_lifeExp),
               color = "red", linetype = 2) +
    labs(x = "GDP (per 1000 Dollar)", 
         y = "Life expectancy")+
    theme(strip.text.x = element_text(size = 12))
  
  
  p1 + p2
  
}