
library(tidyverse)
library(ggplot2)
library(gt)
library(readxl)

masterscience <- read_excel("~/Desktop/R-Studio-prosjekt/arbeidskrav-1-reliability/Data/samlet/Formatert-komplett.xlsx")



figur <- masterscience %>% 
  select(id, timepoint, weight, vo2.rel.max, vo2.max) %>% 
  pivot_longer(names_to = "Variable",
               values_to = "value",
               cols = weight:vo2.max) %>% 
  pivot_wider(names_from = timepoint,
              values_from = value) %>%
  rename(pre = "1", post = "2") %>% 
  mutate(diff = pre - post) %>% 
  filter(Variable == "vo2.max") 

scatter <- ggplot(figur, aes(x = id, y = pre)) +
  geom_point(aes(color = "pre"), size = 3) +
  geom_point(aes(y = post, color = "post"), size = 3) 

scatter



# -------------------------------------------------------------------------

  
 

  


