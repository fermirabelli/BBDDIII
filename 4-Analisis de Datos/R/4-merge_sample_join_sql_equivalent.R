#Dados dos Dataframes df1 y df2 

#ver nombre y algunos datos del df1
names(df1)
head(df1)
dim(df1)

#ver nombre y algunos datos del df2
names(df2)
head(df2)
dim(df2)

#crear un nuevo dataframe con el resultados del join 

resultado <- merge(df1, df2, by.x = "id_df1", by.y = "id_df2")

#ver nombre y algunos datos del df2
names(resultado)
head(resultado)
dim(resultado)

