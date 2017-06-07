download.file(url = c("http://docs.google.com/spreadsheet/pub?key=phAwcNAVuyj0TAlJeCEzcGQ&output=xlsx", 
                      "http://docs.google.com/spreadsheet/pub?key=phAwcNAVuyj0NpF2PTov2Cw&output=xlsx"), 
destfile = c("Data/indicator undata total_fertility.xlsx", "Data/indicator gapminder infant_mortality.xlsx"))

library("readxl")
raw_fert<-read_excel(path="Data/indicator undata total_fertility.xlsx", sheet = "Data")
raw_infantMort<-read_excel(path = "Data/indicator gapminder infant_mortality.xlsx")

gapminder <- read_csv(file = "Data/gapminder-FiveYearData.csv")
gapminder
it is in tidy format

raw_fert<-read_excel(path="Data/indicator undata total_fertility.xlsx", sheet = "Data")
raw_infantMort<-read_excel(path = "Data/indicator gapminder infant_mortality.xlsx")

raw_fert

the function to tidy up is called gather
first we need to provide to gather with 3 paramenter:
give a name for the column that contain the variable, cambiar el nombre de la columna que queremos mantener, ej: country
name which column we want to collect in this way, ej: year y decir los valores que queremos q incluya. excluimos que lo haga en la columna de countries)
mutate function para que integre los datos de year.

fert<-raw_fert %>% 
  rename(country=`Total fertility rate`) %>% 
  gather(key=year,value=fert,-country) %>% 
  mutate(year=as.integer(year))
fert

# GAPMINDER PLUS 
download.file(url = "https://raw.githubusercontent.com/dmi3kno/SWC-tidyverse/master/data/gapminder_plus.csv", 
              destfile = "Data/gapminder_plus.csv")

library("tidyverse")
gapminder_plus<-read_csv(file = "Data/gapminder_plus.csv")

gapminder_plus %>% filter(continent=="Africa",year==2007) %>% 
mutate(babiesDead=infantMort*pop/10^3) %>% 
filter(babiesDead>2e6) %>% 
select(country) %>% 
left_join(gapminder_plus) %>% 
mutate(babiesDead=infantMort*pop/10^3, gdp_bln=gdpPercap*pop/1e9, pop_mln=pop/1e6) %>% 
select(-continent,-pop,-babiesDead) %>% 
gather(key=variables, value=values, -c(country, year)) %>% 
ggplot()+
geom_text(data=. %>% filter(year==2007) %>% group_by(variables) %>%
            mutate(max_value=max(values)) %>% 
            filter(values==max_value),
          aes(x=year, y=values, label=country, color=country))+
geom_line(mapping=aes(x=year,y=values,color=country))+
facet_wrap(~variables,scales="free_y")+
labs(title="hoy",
    subtitle="jj",
    caption="hh",
    y=NULL,
    x="Year")+
  theme_bw()+
  theme(legend.position="none")
       

  

