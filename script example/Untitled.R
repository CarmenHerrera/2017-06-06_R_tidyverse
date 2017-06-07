# We are loading the tidyverse package

library("tidyverse")

gapminder <- read_csv(file = "Data/gapminder-FiveYearData.csv")

gapminder

ggplot(data = gapminder) +
  geom_point(mapping=aes(x=gdpPercap,y=lifeExp))

ggplot(data = gapminder) +
  geom_jitter(mapping=aes(x=gdpPercap,y=lifeExp,color=continent))

ggplot(data = gapminder) +
  geom_point(mapping=aes(x=log(gdpPercap),y=lifeExp), 
             alpha=0.1, size=2, color="blue")
ggplot(data = gapminder) +
  geom_boxplot(mapping=aes(x=continent,y=lifeExp))
ggplot(data = gapminder) +
geom_jitter(mapping=aes(x=continent,y=lifeExp, color=continent))+
  geom_boxplot(mapping=aes(x=continent,y=lifeExp, color=continent))
ggplot(data = gapminder, 
       mapping=aes(x=continent,y=lifeExp, color=continent) +
  geom_jitter()+
  geom_boxplot()
  ggplot(data = gapminder, 
         mapping=aes(x=continent,y=lifeExp, color=continent) +
         geom_boxplot()+
         geom_jitter()

ggplot(data = gapminder, 
                mapping=aes(x=log(gdpPercap),y=lifeExp, color=continent))+
  geom_jitter(alpha=0.1)+
  geom_smooth(method="lm")
ggplot(data = gapminder, 
       mapping=aes(x=log(gdpPercap),y=lifeExp))+
  geom_jitter(mapping=aes(color=continent),alpha=0.1)+
  geom_smooth(method="lm")

#challenge6

ggplot(data = gapminder)+ 
         geom_boxplot(mapping=aes(x=as.factor(year), y=lifeExp))
ggplot(data = gapminder)+ 
  geom_boxplot(mapping=aes(x=as.factor(year), y=log(gdpPercap)))
ggplot(data = gapminder)+ 
  geom_density2d(mapping=aes(x=lifeExp, y=log(gdpPercap)))

ggplot(data = gapminder, mapping=aes(x=gdpPercap, y=lifeExp))+ 
  geom_point()+
geom_smooth() +
  scale_x_log10()+
  facet_wrap(~continent)

ggplot(data = gapminder, mapping=aes(x=gdpPercap, y=lifeExp))+ 
  geom_point()+
  geom_smooth(method="lm") +
  scale_x_log10()+
  facet_wrap(~year)

ggplot(data = gapminder, mapping=aes(x=gdpPercap, y=lifeExp))+ 
  geom_point()+
  geom_smooth(method="lm") +
  scale_x_log10()+
  facet_wrap(~continent)

To specfy a small set of data:
filter(gapminder, year==2007)

to wrapped in ggplot:
ggplot(data=filter(gapminder, year==2007))+
  geom_bar(mapping=aes(x=continent), stat="count")

filter(, year==2007, continent=="Asia")
ggplot(data=filter(gapminder, year==2007, continent=="Asia"))+
  geom_bar(mapping=aes(x=country, y=pop), stat="identity")
ggplot(data=filter(gapminder, year==2007, continent=="Asia"))+
  geom_col(mapping=aes(x=country, y=pop))

ggplot(data=filter(gapminder, year==2007, continent=="Asia"))+
geom_col(mapping=aes(x=country, y=pop))+
  coord_flip()

ggplot(data = gapminder, mapping=aes(x=gdpPercap, y=lifeExp, color=continent))+ 
  geom_point()+
  scale_x_log10()+
  facet_wrap(~year)

ggplot(data = gapminder, mapping=aes(x=gdpPercap, y=lifeExp, color=continent, size=pop/10^6))+ 
  geom_point()+
  scale_x_log10()+
  facet_wrap(~year)+
labs(title="Life Expectancy vs gdp per capita over time",
     subtitle="jhwdk",
     caption="msdjhus",
     x="GDP per capita, in 000 USD",
      y="Life Expectacy in years",
     color="continent",
     size="Population, in millions"
     
ggsave("my_fancy_plot.png")


library(tidyverse)
gapminder<-read_csv("data/gapminder_FiveYearDta.csv")

a function that repeat :
rep("This is an example", times=3)
"This is an example" %>% rep(times=3)


year_country_gdp <- select(gapminder,year,country,gdpPercap)
head(year_country_gdp)
year_country_gdp <- gapminder %>% select(year,country,gdpPercap)

gapminder %>%
  filter(year==2002) %>% 
  ggplot(mapping=aes(x=continent,y=pop))+
  geom_boxplot()

year_country_gdp_euro <- gapminder %>% 
  filter(continent=="Europe") %>% 
select(year,country,gdpPercap)


country_lifeExp_Norway<-gapminder %>% 
  filter(country=="Norway") %>% 
  select(year,lifeExp,gdpPercap)
country_lifeExp_Norway

gapminder %>% 
  group_by(continent)

gapminder %>% 
  group_by(continent) %>% 
  summarize(mean_gdpPercap=mean(gdpPercap))

gapminder %>% 
  group_by(continent) %>% 
  summarize(mean_gdpPercap=mean(gdpPercap)) %>% 
  ggplot(mapping=aes(x=continent,y=mean_gdpPercap))+
  geom_point()

continent_lifeExp_Asia<-gapminder %>% 
  filter(continent=="Asia") %>% 
  select(year,lifeExp,gdpPercap)

gapminder %>% 
  filter(continent=="Asia") %>% 
  group_by(country) %>% 
  summarize(mean_lifeExp=mean(lifeExp)) %>% 
  filter(mean_lifeExp==min(mean_lifeExp)|mean_lifeExp==max(mean_lifeExp))

another way to do it:

gapminder %>% 
  filter(continent=="Asia") %>% 
  group_by(country) %>% 
  summarize(mean_lifeExp=mean(lifeExp)) %>% 
  ggplot(mapping=aes(x=country,y=mean_lifeExp))+
  geom_point()+
  coord_flip()

mutate: una funcion q sirve para crear un nuevo variable (ecuaciones matematicas por ejemplo)

gapminder %>% 
  mutate(gdp_billion=gdpPercap*pop/10^9) %>% 
  group_by(continent,year) %>% 

summarize function: stadistics for the new variable that we just created

gapminder %>% 
  mutate(gdp_billion=gdpPercap*pop/10^9) %>% 
  group_by(continent,year) %>% 
  summarize(mean_gdp_billion=mean(gdp_billion))

gapminder_country_summary <-gapminder %>%
  group_by(country) %>% 
  summarise(mean_lifeExp=mean(lifeExp))
  
library(maps)
map_data("world") %>% 
 rename(country=region) %>% 
  esto es para cambiar el nombre de region por country ya que son lo mismo y deben tener el mismo nombre
library(maps)
map_data("world") %>% 
  rename(country=region) %>% 
  left_join(gapminder_country_summary, by="country") %>% 
  ggplot()+
  geom_polygon(aes(x=long,y=lat,group=group,fill=mean_lifeExp))+
  scale_fill_gradient(low = "blue",high="red")+
  coord_equal()

