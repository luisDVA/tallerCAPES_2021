library(readr)
library(dplyr)
library(ggplot2)
library(report)
library(flextable)
library(broom)

anoles <- read_csv("Toro_et-al_2004dat.csv")


ggplot(anoles)+
  geom_point(aes(mass,pwr),size=5,pch=21,fill="gray")+
  labs(x="masa corporal",y="poder de salto")+
  theme_classic(base_size = 18)

lm(pwr~mass,data = anoles)
summary(lm(pwr~mass,data = anoles))
modeloanoles <- summary(lm(pwr~mass,data = anoles))
modeloanoles
tidy(modeloanoles) %>% mutate(p.value=scales::pvalue(p.value))
write.csv(tidy(modeloanoles),quote = FALSE,row.names = FALSE)



as_flextable(lm(pwr~mass,data = anoles))
tablalm <- as_flextable(lm(pwr~mass,data = anoles))
save_as_docx(tablalm,path = "anoleslm.docx")


anoles10 <- anoles %>% slice_min(mass,n=10) 
ggplot(anoles10)+
  geom_point(aes(mass,pwr),size=5,pch=21,fill="gray")+
  labs(x="masa corporal",y="poder de salto")+
  theme_classic(base_size = 18)

summary(lm(pwr~mass,data = anoles10))


