#Alternativa 1 
library(doBy)
age    = c(43.0883, 55.8344, 29.4708, 32.7858, 33.6372,
           34.935,  35.2115, 35.0115,  5.2115, 36.7803)
group  = c(1, 2, 1, 2, 1, 1, 2, 2, 2, 1)
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


# Solo para contar casos agrupados 

#Alternativa 1 

df4 <- data.frame(age=rpois(20, lambda = 4), grp=sample(1:2,20, rep=T))
data.frame(table(df4$grp))

#Alternativa 2 
df5 <- data.frame(age=rnrom(20,3,1), grp=sample(1:2,20, rep=T))

aggregate(cbind(count = age) ~ grp, 
          data = df5, 
          FUN = function(x){NROW(x)})
