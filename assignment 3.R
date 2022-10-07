library(gapminder)
library(tidyverse)
library(here) 
library(dplyr)
#import data and sort in order
Count20 <- read_csv(here("covid-19-data","us-counties-2020.csv"))
Count21 <- read_csv(here("covid-19-data","us-counties-2021.csv"))
Count22<- read_csv(here("covid-19-data","us-counties-2022.csv"))
Recent <- read_csv(here("covid-19-data","us-counties-recent.csv"))
Live <- read_csv(here("covid-19-data","live","us-counties.csv"))
Count <- rbind(Count20,Count21,Count22,Recent,Live)

#filter "Lehigh" county
Lehigh <-filter(Count,state=="Pennsylvania" & county=="Lehigh")
Lehigh <-distinct(Lehigh,date,.keep_all = TRUE)

#add the increase of cases variable
n <- length(Lehigh$date)
Lehigh$incr_cases <- 0
Lehigh$incr_cases[1]<- Lehigh$cases[1]
for (i in 2:n) {
  Lehigh$incr_cases[i] <- Lehigh$cases[i]-Lehigh$cases[i-1]
}
#plot the graph
p<- ggplot(data=Lehigh,
           mapping = aes(x = date,
                         y = incr_cases))
p +  geom_line(color="blue")+  
  labs(x = "Date", y = "New Cases Reported",
       title = "COVID-19 Cases Reported in Lehigh, PA")