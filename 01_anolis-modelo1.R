library(readr)
library(dplyr)
library(ggplot2)

anoles <- read_csv("Toro_et-al_2004dat.csv")

ggplot(anoles)+
  geom_point(aes(mass,pwr),size=5,pch=21,fill="gray")+
  labs(x="masa corporal",y="poder de salto")+
  theme_classic(base_size = 18)

lm(pwr~mass,data = anoles)
summary(lm(pwr~mass,data = anoles))
