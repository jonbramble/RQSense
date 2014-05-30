library(nlme) # to get Oxboy dataset 
p <- ggplot(Oxboys, aes(age, height, group = Subject)) + 
  geom_line() 
p 