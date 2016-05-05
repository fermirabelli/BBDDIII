library(arules)
library(arulesViz)

#Generacion de reglas de ejemplo - formato MBA

transactions <- c("A,B,C", "B,C", "A,B,D", "A,B,C,D", "A", "B")

write.table(transactions, file="transactions", quote=FALSE, row.names = FALSE, col.names = FALSE)

tr<-read.transactions("transactions",format="basket",sep=",")
inspect(tr)

#Generacion de reglas de ejemplo - formato relacional (single)

data <- paste(
  "trans1 item1", 
  "trans2 item1",
  "trans2 item2", 
  sep ="\n")
cat(data)
write(data, file = "demo_single")

## read demo data
tr_s <- read.transactions("demo_single", format = "single", cols = c(1,2))
inspect(tr_s)


rules <- apriori(tr, parameter= list(supp=0.5, conf=0.5))
inspect(rules)

interestMeasure(rules, c("support", "chiSquare", "confidence", "conviction", "cosine", "coverage", "leverage", "lift", "oddsRatio"), tr)

##########################################################

library (rworldmap)


newmap <-getMap(resolution ="low")
plot (newmap,main ="World")


map.world<-map_data(map="world")
str(map.world)
(unique(map.world$region))

p1<-ggplot(map.world,aes(x=long,y=lat,group=group, colour = region))
p1<-p1+geom_path()
p1<-p1+labs(title="World, plain")
p1<-p1+theme(legend.position= "none")
print(p1)         

map<-get_map(location="Albuquerque, New Mexico",zoom=10,maptype="watercolor")
  # map typ
p<-ggmap(map)
p<-p+labs(title="NM hybrid"))
print(p)  

