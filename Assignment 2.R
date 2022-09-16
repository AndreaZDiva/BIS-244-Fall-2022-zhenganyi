#Assignment 2 by ZhengAnyi
#Read the file "us-states.csv" into an R data frame.
#install.packages("dplyr")
#library(dplyr)
Temp <- getwd()
setwd("./covid-19-data/")
DF<- read.csv("us-states.csv")
setwd(Temp)
#Process the data frame using dplyr functions to keep only observations for Pennsylvania.
DF_Penn <- filter(DF, state =="Pennsylvania")
#Create 2 new variables, "incr_cases" and "incr_deaths" 
DF_Penn <-mutate(DF_Penn,incr_cases = cases-lag(cases) )
DF_Penn <-mutate(DF_Penn,incr_deaths = deaths-lag(deaths) )
#Calculate the sd() of all incr_cases in PA and print it in the Console.
DF_Penn <- na.omit(DF_Penn)
value <- DF_Penn$incr_cases
print(sd(value))