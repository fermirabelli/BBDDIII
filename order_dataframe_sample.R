# Ejemplo para ordenar un Data Frame
attach(iris)

# Ordenar por Petal.Length
DF_ordenado<- iris[order(Petal.Length),]

#Ver DF
DF_ordenado

# Ordenar por Petal.Length y luego por Petal.Width
DF_ordenado<- iris[order(Petal.Length,Petal.Width),]


#Ver DF 
DF_ordenado


# Ordenar por Petal.Length (ascendente) y luego por Petal.Width (descendente)
DF_ordenado<- iris[order(Petal.Length,-Petal.Width),]


detach(iris)
