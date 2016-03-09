transactions <- c("A,B,C", "B,C", "A,B,D", "A,B,C,D", "A", "B")

write.table(transactions, file="transactions", quote=FALSE, row.names = FALSE, col.names = FALSE)

tr<-read.transactions("transactions",format="basket",sep=",")

rules <- apriori(tr, para
                 
                 meter= list(supp=0.5, conf=0.5))

interestMeasure(rules, c("support", "chiSquare", "confidence", "conviction", "cosine", "coverage", "leverage", "lift", "oddsRatio"), tr)


library
(rworldmap)

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


vec <- 1:3
vec <- c(vec,4:5)
vec <- c(vec,6:10)

<- c(3, 2, 10)
rbind(x, y)
z<-rbind(x, y)
class(z)
getwd()
x <- list(2, "a", "b", TRUE)
x[[2]]
w<-3
w
w<-list(2)
w
x <- 1:4 
x
y <- 2:3
x+y
class(x+y)
x <- c(17, 14, 4, 5, 13, 12, 10) 
x
x[x >= 11] <- 4
xinitial <- read.csv(
  +     "hw1_data.csv"init
  +     , nrows =
    +         100
  initial
  colMax()

  cube <- function(x, n) {
    x^3
  }
  cube(3)
  x <- 1:10
  if(x > 5) {
    x <- 0
  }
  
  x <- 5
  y <- if(x < 3) {
    NA
  } else {
    10
  }
  y
  
  f <- function(x) {
    g <- function(y) {
      y + z
    }
    z <- 4
    x + g(x)
  }
  z <- 10
  f(3)
  
  corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
  }