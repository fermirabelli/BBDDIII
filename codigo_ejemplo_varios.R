#Ver dataframe
View(sample2)

#Ver cantidad de filas y columnas
dim(sample2)

#Ver nombres de columnas
names (sample2)

#Ver primeras filas del Data Frae
head (sample2)


#Eliminar Atributos de un data frame

drops <- c("nombre de atributo")
data<-data[,!(names(data) %in% drops)]


# transformar una variable numerica en 2 factores nominales constantes "A" y "B"

data$var_f <- factor(data$var, labels = c("A", "B"))


# Separar un data set 75% entrenamiento y 25% test con muestreo aleatorio 

x <- data[sample(1:nrow(data), nrow(data), replace = F),]
x.train <- data[1:floor(nrow(x)*.75), ]
x.test <- data[(floor(nrow(x)*.75)+1):nrow(x), ]


# crear un dataframe seleccionando filas con algun criterio (tipo where de sql)
newdata <- subset(data, variable1=="Y" )



#Eliminar espacios al principio y al final de un texto 

trimfunc <- function (x) gsub("^\\s+|\\s+$", "", x)

#Para usar la funcion 
    
df$text <- trim(df$text)

                  