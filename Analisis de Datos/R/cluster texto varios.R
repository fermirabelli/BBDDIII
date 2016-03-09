require(RJSONIO)    

json_file <- "C:/Users/fmirabelli.ELINPAR/Documents/R/Code/exportar_agite.json"
json_data <- fromJSON(paste(readLines(json_file, warn = FALSE), collapse=""))

json_file <-  '[{"name":"Doe, John","group":"Red","age (y)":24,"height (cm)":182,"wieght (kg)":74.8,"score":null},
    {"name":"Doe, Jane","group":"Green","age (y)":30,"height (cm)":170,"wieght (kg)":70.1,"score":500},
    {"name":"Smith, Joan","group":"Yellow","age (y)":41,"height (cm)":169,"wieght (kg)":60,"score":null},
    {"name":"Brown, Sam","group":"Green","age (y)":22,"height (cm)":183,"wieght (kg)":75,"score":865},
    {"name":"Jones, Larry","group":"Green","age (y)":31,"height (cm)":178,"wieght (kg)":83.9,"score":221},
    {"name":"Murray, Seth","group":"Red","age (y)":35,"height (cm)":172,"wieght (kg)":76.2,"score":413},
    {"name":"Doe, Jane","group":"Yellow","age (y)":22,"height (cm)":164,"wieght (kg)":68,"score":902}]'


json_file <- fromJSON(json_file)

json_file <- lapply(json_file, function(x) {
  x[sapply(x, is.null)] <- NA
  unlist(x)
})

do.call("rbind", json_file)


library(jsonlite)

readlines <- readLines('C:/Users/fmirabelli.ELINPAR/Documents/R/Code/exportar_agite3.json', warn = FALSE)
substring(readlines, 1, 100)

readlines <- str_replace_all(readlines,"^[:alnum:]"," ")
readlines <- str_replace_all(readlines,"»¿"," ")
parse <- fromJSON(readlines)


dim(readlines)



data <- fromJSON('C:/Users/fmirabelli.ELINPAR/Documents/R/Code/exportar_agite.json')

# Copiar texto del JSON, utilizar la pagina http://jsonlint.com/
# Cuando es valido, guardar en un archivo

library(jsonlite)

#leer el archivo
readlines <- readLines('C:/Users/fmirabelli.ELINPAR/Documents/R/Code/exportar_agite4.json', warn = FALSE)

#readlines <- str_replace_all(readlines,"^[:alnum:]"," ")
#readlines <- str_replace_all(readlines,"»¿"," ")

# Parse con la funcion fromJSON de jsonlite
parse <- fromJSON(readlines)

substring(readlines[1:50], 1, 100)

class(parse)
names(parse)
head(parse)

library("sqldf")
ws<-as.data.frame(sqldf('select [from],count(*) from parse group by [from]'))
dim (ws)
ws$cantidad<-ws[,2]

drops <- c("count(*)")
ws<-ws[,!(names(ws) %in% drops)]

ws_ordenado<- ws[order(-ws$cantidad),]

newdata <- subset(parse, is.na(from) )


dat <- lapply(parse, function(j) {
  as.data.frame(replace(j, sapply(j, is.list), NA))
})


library(plyr)
res <- rbind.fill(dat)


library(dplyr)
#dt <- data.frame(age=rchisq(20,10), group=sample(1:2,20, rep=T))
grp <- group_by(parse,from)
summarise(grp, mean=(age), sd=sd(age))



#agrupacion pro similitud

agrep("lasy", "1 lazy 2")
agrep("lasy", c(" 1 lazy 2", "1 lasy 2"), max = list(sub = 0))
agrep("laysy", c("1 lazy", "1", "1 LAZY"), max = 2)
agrep("laysy", c("1 lazy", "1", "1 LAZY"), max = 2, value = TRUE)
agrep("laysy", c("1 lazy", "1", "1 LAZY","liyyqq dsdfsdddfefefefv"), max = 2, ignore.case = TRUE)


#clustering de textos

# quito na


ws$from[(is.na(ws$from))] <- 'Fer'

# Modifico nombres

ws$from[(ws$from=='Fer')] <- 'Yo'

ws$from[(ws$from=='dario')] <- 'Dario Quaglia'
ws$from[(ws$from=='capi')] <- 'capi Vanneta'

ws$from[(ws$from=='foty')] <- 'Andres Foty'

ws$from[grep("Germ+",ws$from, perl=TRUE, value=FALSE)]<-'Moner'

ws$from[grep("San+",ws$from, perl=TRUE, value=FALSE)]<-'Santiago Remon'

ws$from[grep("Dias+",ws$from, perl=TRUE, value=FALSE)]<-'Pato'



ws_ordenado<- ws[order(ws$from),]

cbind(ws_ordenado,length(ws_ordenado$from))



#Eliminar espacios al principio y al final de un texto 

trimfunc <- function (x) gsub("^\\s+|\\s+$", "", x)

#Para usar la funcion 

ws$from <- trimfunc(ws$from)

# Levenshtein Distance
d  <- adist(ws$from)
rownames(d) <- ws$from

# armo el dendograma 
hc <- hclust(as.dist(d))
plot(hc)

# Defino las marcas para 18 clusters
rect.hclust(hc,k=18)
df <- data.frame(ws,cutree(hc,k=18))




#clustering de textos

# quito na


parse$from[(is.na(parse$from))] <- 'Fer'

# Modifico nombres

parse$from[(parse$from=='Fer')] <- 'Yo'

parse$from[(parse$from=='dario')] <- 'Dario Quaglia'
parse$from[(parse$from=='capi')] <- 'capi Vanneta'

parse$from[(parse$from=='foty')] <- 'Andres Foty'

parse$from[grep("Germ+",parse$from, perl=TRUE, value=FALSE)]<-'Moner'

parse$from[grep("San+",parse$from, perl=TRUE, value=FALSE)]<-'Santiago Remon'

parse$from[grep("Dias+",parse$from, perl=TRUE, value=FALSE)]<-'Pato'



ws_ordenado<- ws[order(ws$from),]

cbind(ws_ordenado,length(ws_ordenado$from))



#Eliminar espacios al principio y al final de un texto 

trimfunc <- function (x) gsub("^\\s+|\\s+$", "", x)

#Para usar la funcion 

parse$from <- trimfunc(parse$from)

# Levenshtein Distance
d  <- adist(parse$from)
rownames(d) <- parse$from

# armo el dendograma 
hc <- hclust(as.dist(d))
plot(hc)

# Defino las marcas para 18 clusters
rect.hclust(hc,k=18)
df <- data.frame(parse,cluster=cutree(hc,k=18))
head(df)
table(df$from,df$cluster)
subset(df,cluster==17)[1,]$from
names(parse)

table(df$jid,df$cluster) #algunos cambiaron de telefono 
table(parse$status)
table(parse$dir)

r<-sort(table(parse$type),decreasing=T)[1]
class(r)

df$from[df$cluster==1,]
df[df$cluster==1]$name <- 3
df<-cbind(df,name="dfff")

drops <- c("name")
df<-df[,!(names(df) %in% drops)]


ll<-data.frame(table(df[df$cluster==1,]$from))
ll[which.max(ll$Freq),]$Var1

ll<-table(df[df$cluster==1,]$from)

names[which.max(names$Freq),]$Var1
names(ll[which.max(ll)])


name_m<-table(df[df$cluster==1,]$from)
r<-names(name_m[which.max(name_m)])

class(df$name)
cat(paste("cluster ", i, ": ",r, sep = ""))

setDT(df)[cluster==1,  name := r ]

library(data.table)

k<-18
for (i in 1:k) {
  

  name_m<-table(df[df$cluster==i,]$from)
  r<-names(name_m[which.max(name_m)])

  cat(paste("cluster ", i, ": ",r, sep = ""))
  
  setDT(df)[cluster==i,  name := r ]
  
  # print the tweets of every cluster
  
  # print(tweets[which(kmeansResult£cluster==i)])
  
}
df
ws
warnings()

table(df$name)
