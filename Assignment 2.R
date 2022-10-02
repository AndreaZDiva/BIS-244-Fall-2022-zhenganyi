#Assignment 2 by ZhengAnyi
#Read the file "us-states.csv" into an R data frame.
#install.packages("dplyr")
#library(dplyr)
Temp <- getwd()
setwd("./covid-19-data/")

#   Failure to clone/link COVID-19 repo: -5

#correct way to read csv for future reference
DF <- read.csv(here("covid-19-data","us-states.csv")) 

DF<- read.csv("us-states.csv")
setwd(Temp)
#Process the data frame using dplyr functions to keep only observations for Pennsylvania.
DF_Penn <- filter(DF, state =="Pennsylvania")
#Create 2 new variables, "incr_cases" and "incr_deaths" 

#   Failure to implement increments properly -10 (final answer does not match)

DF_Penn <-mutate(DF_Penn,incr_cases = cases-lag(cases) )
DF_Penn <-mutate(DF_Penn,incr_deaths = deaths-lag(deaths) )
#Calculate the sd() of all incr_cases in PA and print it in the Console.
DF_Penn <- na.omit(DF_Penn)
value <- DF_Penn$incr_cases
print(sd(value))
