library(readr)
library(tidyverse)
library(here)
library(dplyr)
library(ggplot2)
install.packages('patchwork') 
wot <- read_csv(here("Assignment 4","WOT.csv"))
wot <- filter(wot,Battles > 3)
wot$WR <- as.numeric(gsub("%","",wot$WR))
p1 <- ggplot(wot,aes(x=as.factor(Nation), y=WR)) + 
  geom_boxplot() + 
  labs(title = "Stats by Nation Played",
       x = "Nation Played",
       y = "Win Rate(WR)")
p2 <- ggplot(wot,aes(x=as.factor(Class), y=WR)) + 
  geom_boxplot() + 
  labs(title = "Stats by Type Played",
       x = "Type Played",
       y = "Win Rate(WR)")
library(patchwork)
p1 + p2

