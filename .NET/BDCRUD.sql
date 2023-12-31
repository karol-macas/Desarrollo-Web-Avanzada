USE [master]
GO
/****** Object:  Database [DBCRUD]    Script Date: 28/11/2023 23:10:49 ******/
CREATE DATABASE [DBCRUD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBCRUD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS1\MSSQL\DATA\DBCRUD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBCRUD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS1\MSSQL\DATA\DBCRUD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DBCRUD] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBCRUD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBCRUD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBCRUD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBCRUD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBCRUD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBCRUD] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBCRUD] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DBCRUD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBCRUD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBCRUD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBCRUD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBCRUD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBCRUD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBCRUD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBCRUD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBCRUD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBCRUD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBCRUD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBCRUD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBCRUD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBCRUD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBCRUD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBCRUD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBCRUD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBCRUD] SET  MULTI_USER 
GO
ALTER DATABASE [DBCRUD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBCRUD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBCRUD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBCRUD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBCRUD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBCRUD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DBCRUD] SET QUERY_STORE = ON
GO
ALTER DATABASE [DBCRUD] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DBCRUD]
GO
/****** Object:  Table [dbo].[CARGO]    Script Date: 28/11/2023 23:10:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARGO](
	[IdCargo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMPLEADO]    Script Date: 28/11/2023 23:10:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLEADO](
	[IdEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[NombreCompleto] [varchar](60) NULL,
	[Correo] [varchar](60) NULL,
	[Telefono] [varchar](60) NULL,
	[IdCargo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CARGO] ON 

INSERT [dbo].[CARGO] ([IdCargo], [Descripcion]) VALUES (1, N'Asistente de Ventas')
INSERT [dbo].[CARGO] ([IdCargo], [Descripcion]) VALUES (2, N'Diseñador de marketing')
INSERT [dbo].[CARGO] ([IdCargo], [Descripcion]) VALUES (3, N'Atencion al cliente')
SET IDENTITY_INSERT [dbo].[CARGO] OFF
GO
SET IDENTITY_INSERT [dbo].[EMPLEADO] ON 

INSERT [dbo].[EMPLEADO] ([IdEmpleado], [NombreCompleto], [Correo], [Telefono], [IdCargo]) VALUES (1, N'Jose reyes', N'jose@gmail.com', N'0988002981', 1)
INSERT [dbo].[EMPLEADO] ([IdEmpleado], [NombreCompleto], [Correo], [Telefono], [IdCargo]) VALUES (2, N'jose luis del motes', N'luis@gmail.com', N'09837199999', 2)
SET IDENTITY_INSERT [dbo].[EMPLEADO] OFF
GO
ALTER TABLE [dbo].[EMPLEADO]  WITH CHECK ADD  CONSTRAINT [FK_Cargo] FOREIGN KEY([IdCargo])
REFERENCES [dbo].[CARGO] ([IdCargo])
GO
ALTER TABLE [dbo].[EMPLEADO] CHECK CONSTRAINT [FK_Cargo]
GO
USE [master]
GO
ALTER DATABASE [DBCRUD] SET  READ_WRITE 
GO
