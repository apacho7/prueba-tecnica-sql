--Creación de la base de datos
CREATE DATABASE [pruebaDBA]
 ON  PRIMARY 
( NAME = N'pruebaDBA', FILENAME = N'Y:\SQL Server\Data\pruebaDBA.mdf' , SIZE = 2048KB , FILEGROWTH = 256KB )
 LOG ON 
( NAME = N'pruebaDBA_log', FILENAME = N'Y:\SQL Server\Logs\pruebaDBA_log.ldf' , SIZE = 2048KB , FILEGROWTH = 256KB  )
GO
ALTER DATABASE [pruebaDBA] SET COMPATIBILITY_LEVEL = 150
GO

/*Creación de las tablas */

USE [pruebaDBA]
GO

CREATE TABLE departamentos (
	departamento_id INT IDENTITY(1,1) PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL
	);

CREATE TABLE [dbo].[empleados](
	[empleado_id] [int] IDENTITY(1,1) PRIMARY KEY,
	[primer_nombre] [varchar](50) NOT NULL,
	[segundo_nombre] [varchar](50)  NULL,
	[primer_apellido] [varchar](50) NOT NULL,
	[segundo_apellido] [varchar](50)  NULL,
	[genero] [varchar] (1) NOT NULL,  
	[salario] [decimal](10, 2) NOT NULL,
	[fecha_ingreso] [date] NOT NULL,
	[activo] [bit] NOT NULL,
	[departamento_id] [int] NOT NULL,
	FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id)
 );

 CREATE TABLE [dbo].[ausencias](
	[ausencia_id] [int] IDENTITY(1,1) PRIMARY KEY,
	[empleado_id] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[tipo] [varchar](50) NULL,
	FOREIGN KEY (empleado_id) REFERENCES empleados (empleado_id)
 )
