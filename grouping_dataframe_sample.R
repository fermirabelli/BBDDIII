#Alternativa 1 
library(doBy)
age    = c(23.0883, 25.8344, 29.4648, 32.7858, 33.6372,
           34.935,  35.2115, 35.2115,  5.2115, 36.7803)
group  = c(1, 1, 1, 2, 1, 1, 2, 2, 2, 1)
df1 = data.frame(age=age, group=group)
summaryBy(age~group, data=df1, FUN=c(mean, sd))


#Alternativa 2
library(dplyr)
df2 <- data.frame(age=rchisq(20,10), group=sample(1:2,20, rep=T))
grp <- group_by(df2, group)
summarise(grp, mean=mean(age), sd=sd(age))


#Alternativa 3
library(sqldf)
df3 <- data.frame(age=rnorm(20,10,5), grp=sample(1:2,20, rep=T))
sqldf('  select grp,avg(age) from df3 group by grp  ')


