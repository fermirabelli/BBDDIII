#Concateno en windows todos los logs en un solo archivo para importar 

copy /a *.txt concat.txt

#importo archivos en R 

#Clean and Parse fields

library(stringr)
library 

logs = cbind(concat, as.Date( str_match(concat[,2], "[0-9]{1,2}\\/[A-Za-z]{3}\\/[0-9]{4}"), format="%d/%b/%Y"))


logs = cbind(logs, str_match(logs[,2], "[0-9]{4}:([0-9]{2}):"))

logs = logs[,-(ncol(logs)-1)] #remove the match 0 of the regular expression from above

logs = cbind(logs, weekdays(logs[,(ncol(logs) - 1)]))

logs = logs[,-2]#remove the original date column
logs = logs[,-2]#remove the original date column
logs = logs[,-3]#remove the original date column
logs = logs[,-3]#remove the original date column

head(logs)
colnames(logs) = c( "Webpage","IP","Operation", "Status", "Size", "Referrer", "User Agent", "Date", "Hour", "Weekday") #Set the column names

#armado de graficos 


vpd = tapply(logs[,1], logs[,8], length)#tabulate the the visits per day

marginDefaults = par()$mar;

par(mar=c(9,4,4,4))

barplot(vpd, main="Visits Per Day", col="lightgreen", las=2, border="gray")

par(mar = marginDefaults);

reqs=as.data.frame(table(logs$Date))

table(logs$Status)

ggplot(data=reqs, aes(x=as.Date(Date), y=Freq))

+ geom_line() + xlab('Date') + ylab('Requests') + opts(title='Traffic to Site')

##Create a data frame containing necessary information about days of the week and counts on those days

tally = tapply(logs[,1], logs[,8], length)

tally = data.frame(matrix(c(tally, names(tally)), ncol=2))

tally = cbind(tally, weekdays(as.Date(tally[,2])))

colnames(tally) = c("Count", "Date", "Day")

tally[,1] = as.numeric(as.character(tally[,1]))#force this column to be numeric

fit = aov(Count ~ Day, tally);#Use analysis of variance to test of there is a difference between classes

summary(fit)

##The above demonstrates a more rigorous statistical approach - in this case there does appear to be a difference in visits throughout the week (p < 0.00013). You could also view this as a pie chart: 
  

pie(tapply(logs[,"IP"], logs[,"Weekday"], length), main="Visits")


##Using similar techniques as shown above, one can do a whole lot more: tally the visits per hour, the most popular pages, the most popular referring pages, bandwidth usages, look at page 'stickiness', typical user navigations, etc...

###Visits on an hourly basis tallied across each day

vph = tapply(logs[,"IP"], logs[,"Hour"], length)

barplot(vph, main="Visits Per Hour", col="lightgreen", border="gray")
        
        ##Top visited pages
        
        logs = cbind(logs, str_match(logs[,"Webpage"], "\\.com\\/([^\\.]+\\.(php|html))"));#Extract the actual webpage
        
        pop = tapply(logs[,1], logs[,10], length)#assuming 9 is the newly bound column above, tally by the webpage
        
        head(pop[rev(order(pop))])
        
        