#Funciones utiles con fechas

	Sys.Date( ) Devuelve la fecha actual
	date() Devuelve la fecha y hora actual

#Formato de fecha
	
	# print today's date
	today <- Sys.Date()
	format(today, format="%B %d %Y")
	"June 20 2007"

#	Símbolo	Significado 			Ejemplo
#	%d 		day as a number (0-31) 	01-31
#	%a		abbreviated weekday		Mon
#	%A 		unabbreviated weekday 	Monday
#	%m 		month (00-12) 			00-12
#	%b		abbreviated month		Jan
#	%B		unabbreviated month 	January 	
#	%y		2-digit year			07
#	%Y 		4-digit year			2007
	 	
	
#Consideraciones para diferentes tipos de datos de fechas 

    #Cuando solo se manejan fechas es recomendable utilizar Date
    #cuando ademas de fechas hay datos horarios involucrados es recomendable utilizar POSIXct,
    #ademas POSIXlt facilita la extraccion de los componentes de Fecha/Hora
    #y chron es mas simple cuando no es necesario considerar zona horaria u cambios de horarios por estacion.
	
#Alternativa 1 Uso Fechas como tipo de dato POSIXct

	data = read.table("data.txt", header = TRUE, sep = "\t", dec = ".", 
    colClasses =c("numeric","numeric","character","POSIXct","numeric","numeric"));
	
	startDate = as.POSIXct("2012-07-01");
	endDate = as.POSIXct("2012-07-20");
	all_dates = seq(startDate, endDate, 86400); #86400 is num of seconds in a day

	#the following code I'm trying to run inside a loop...
	for (j in 1:length(all_dates)) {
		filterdate = all_dates[j];
		my_subset = data[data$DateTimeUTC == filterdate,]
		#now I want do do some processing on my_subset...
	}

#Alternativa 2 Uso de Fechas con tipo de dato Date

	# use as.Date( ) to convert strings to dates
	mydates <- as.Date(c("2007-06-22", "2004-02-13"))
	
	# Diferencia de Dias entre dos fechas
	
	# number of days between 6/22/07 and 2/13/04
	days <- mydates[1] - mydates[2]
	
	
	
# Calculos con Fechas 

	dt1 <- as.Date("2012-07-22")
	dt1
	## [1] "2012-07-22"
	
	dt2 <- as.Date("04/20/2011", format = "%m/%d/%Y")
	dt2
	## [1] "2011-04-20"
	
	#Ver intervalos de tiempo entre fechas

	dt1 - dt2

	## Diferencia en dias of 459 days

	difftime(dt1, dt2, units = "weeks")

	## difernecia en semanas 65.57 

#Sumar o restar dias

	dt2 + 10

	## [1] "2011-04-30"

	dt2 - 10

	## [1] "2011-04-10"

#Crear un vector de Fechas y encontrar el intervalo de tiempo entre ellos:

	three.dates <- as.Date(c("2010-07-22", "2011-04-20", "2012-10-06"))
	three.dates

	## [1] "2010-07-22" "2011-04-20" "2012-10-06"

	diff(three.dates)

	## diferencia de Tiempo en dias 
	## [1] 272 535

#Crear una secuencia de Fechas:

	six.weeks <- seq(dt1, length = 6, by = "week")
	six.weeks

	## [1] "2012-07-22" "2012-07-29" "2012-08-05" "2012-08-12" "2012-08-19"
	## [6] "2012-08-26"

	six.weeks <- seq(dt1, length = 6, by = 14)
	six.weeks

	## [1] "2012-07-22" "2012-08-05" "2012-08-19" "2012-09-02" "2012-09-16"
	## [6] "2012-09-30"

	six.weeks <- seq(dt1, length = 6, by = "2 weeks")
	six.weeks

	## [1] "2012-07-22" "2012-08-05" "2012-08-19" "2012-09-02" "2012-09-16"
	## [6] "2012-09-30"

#Ver la representacion numerica interna de R

	unclass(dt1)

	## [1] 15543

	dt1 - as.Date("1970-01-01")

	## Time difference of 15543 days
	
	#sigue en http://www.r-bloggers.com/using-dates-and-times-in-r/