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
resultadoslm <- tidy(modeloanoles) %>% mutate(p.value=scales::pvalue(p.value))
write.csv(resultadoslm,quote = FALSE,row.names = FALSE)



as_flextable(lm(pwr~mass,data = anoles))
tablalm <- as_flextable(lm(pwr~mass,data = anoles))
save_as_docx(tablalm,path = "anoleslm.docx")

report(lm(pwr~mass,data = anoles))
report_table(lm(pwr~mass,data = anoles))
