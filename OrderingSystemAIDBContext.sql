USE [master]
GO
/****** Object:  Database [OrderingSystemAI]    Script Date: 7/26/2023 11:26:06 PM ******/
CREATE DATABASE [OrderingSystemAI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OrderingSystemAI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OrderingSystemAI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OrderingSystemAI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OrderingSystemAI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [OrderingSystemAI] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OrderingSystemAI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OrderingSystemAI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OrderingSystemAI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OrderingSystemAI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OrderingSystemAI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OrderingSystemAI] SET ARITHABORT OFF 
GO
ALTER DATABASE [OrderingSystemAI] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [OrderingSystemAI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OrderingSystemAI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OrderingSystemAI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OrderingSystemAI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OrderingSystemAI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OrderingSystemAI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OrderingSystemAI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OrderingSystemAI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OrderingSystemAI] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OrderingSystemAI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OrderingSystemAI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OrderingSystemAI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OrderingSystemAI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OrderingSystemAI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OrderingSystemAI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OrderingSystemAI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OrderingSystemAI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OrderingSystemAI] SET  MULTI_USER 
GO
ALTER DATABASE [OrderingSystemAI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OrderingSystemAI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OrderingSystemAI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OrderingSystemAI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OrderingSystemAI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OrderingSystemAI] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [OrderingSystemAI] SET QUERY_STORE = OFF
GO
USE [OrderingSystemAI]
GO
/****** Object:  Table [bill]    Script Date: 7/26/2023 11:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_date] [date] NULL,
	[create_time] [varchar](30) NULL,
	[total_price] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bill_detail]    Script Date: 7/26/2023 11:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bill_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bill_id] [int] NULL,
	[food_name] [varchar](100) NULL,
	[food_price] [decimal](18, 0) NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sub_order]    Script Date: 7/26/2023 11:26:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sub_order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[food_name] [varchar](100) NULL,
	[food_price] [decimal](18, 0) NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [bill] ON 

INSERT [bill] ([id], [create_date], [create_time], [total_price]) VALUES (12, CAST(N'2023-07-26' AS Date), N'10:30:25', CAST(20 AS Decimal(18, 0)))
INSERT [bill] ([id], [create_date], [create_time], [total_price]) VALUES (14, CAST(N'2023-07-26' AS Date), N'10:36:26', CAST(80 AS Decimal(18, 0)))
INSERT [bill] ([id], [create_date], [create_time], [total_price]) VALUES (16, CAST(N'2023-07-26' AS Date), N'10:42:18', NULL)
SET IDENTITY_INSERT [bill] OFF
GO
SET IDENTITY_INSERT [bill_detail] ON 

INSERT [bill_detail] ([id], [bill_id], [food_name], [food_price], [quantity]) VALUES (1, 12, N'FriesMedium', CAST(20 AS Decimal(18, 0)), 1)
INSERT [bill_detail] ([id], [bill_id], [food_name], [food_price], [quantity]) VALUES (2, 14, N'FriesMedium', CAST(20 AS Decimal(18, 0)), 3)
INSERT [bill_detail] ([id], [bill_id], [food_name], [food_price], [quantity]) VALUES (3, 16, N'FriesLarge', CAST(25 AS Decimal(18, 0)), 3)
INSERT [bill_detail] ([id], [bill_id], [food_name], [food_price], [quantity]) VALUES (4, 16, N'FriesLarge', CAST(25 AS Decimal(18, 0)), 3)
SET IDENTITY_INSERT [bill_detail] OFF
GO
ALTER TABLE [bill_detail]  WITH CHECK ADD FOREIGN KEY([bill_id])
REFERENCES [bill] ([id])
GO
USE [master]
GO
ALTER DATABASE [OrderingSystemAI] SET  READ_WRITE 
GO
