USE [dce05_ejemplos_estrella1]
CREATE TABLE [dbo].[Usuarios] ( 
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [varchar](50) NOT NULL,
	[ContraseñaUsuario] [int] NOT NULL
) ON [PRIMARY]

ALTER TABLE Usuarios ADD CONSTRAINT PK_Usuarios
PRIMARY KEY (Codigo) 

ALTER TABLE Usuarios ADD CONSTRAINT UQ_Usuarios
UNIQUE (NombreUsuario) 


SELECT * FROM Usuarios