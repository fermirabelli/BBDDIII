#Ejecutar un Arbol 

  install.packages("party")

  library("party")

  #Entreno modelo
  model <- ctree(target_variable ~ .,data=nombre_dataframe)

  #Grafico el Arbol
  plot (model)


  #Matriz de confusion
  table(predict(model), nombre_dataframe$target_variable)

  #Aplicar el modelo a un dataframe para clasificar 
  #  y guardar la prediccion en  una nueva variable llamada prediction

  data_clasif$prediction <- predict(model, newdata=data_clasif)

  # Precisión del clasificador.
  x.evaluate$correct <- x.evaluate$prediction == x.evaluate$compro.f
  print(paste("% de predicciones de clasificacion correctas", mean(x.evaluate$correct)))
  


