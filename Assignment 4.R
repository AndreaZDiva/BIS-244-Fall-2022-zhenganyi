library(readr)
library(tidyverse)
library(here)
library(dplyr)
library(ggplot2)
install.packages('patchwork') 
wot <- read_csv(here("WOT.csv"))
wot <- filter(wot,Battles > 3)
wot$WR <- as.numeric(gsub("%","",wot$WR))
# Failed to reorder the Nation and Class in plot : -10
#Correct way to do it is below
p1 <- ggplot(wot,aes(x=reorder(Nation,WR), y=WR)) + 
  geom_boxplot() + 
  labs(title = "Stats by Nation Played",
       x = "Nation Played",
       y = "Win Rate(WR)")
p2 <- ggplot(wot,aes(x=reorder(Class,WR), y=WR)) + 
  geom_boxplot() + 
  labs(title = "Stats by Type Played",
       x = "Type Played",
       y = "Win Rate(WR)")
library(patchwork)
p1 + p2

