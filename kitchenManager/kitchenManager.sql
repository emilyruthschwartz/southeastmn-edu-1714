USE [master]
GO
/****** Object:  Database [KitchenManager]    Script Date: 9/25/2022 12:42:59 PM ******/
CREATE DATABASE [KitchenManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KitchenManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\KitchenManager.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KitchenManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\KitchenManager_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [KitchenManager] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KitchenManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KitchenManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KitchenManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KitchenManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KitchenManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KitchenManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [KitchenManager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KitchenManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KitchenManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KitchenManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KitchenManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KitchenManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KitchenManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KitchenManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KitchenManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KitchenManager] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KitchenManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KitchenManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KitchenManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KitchenManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KitchenManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KitchenManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KitchenManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KitchenManager] SET RECOVERY FULL 
GO
ALTER DATABASE [KitchenManager] SET  MULTI_USER 
GO
ALTER DATABASE [KitchenManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KitchenManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KitchenManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KitchenManager] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KitchenManager] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KitchenManager] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'KitchenManager', N'ON'
GO
ALTER DATABASE [KitchenManager] SET QUERY_STORE = OFF
GO
USE [KitchenManager]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 9/25/2022 12:42:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Address_ID] [int] IDENTITY(1,1) NOT NULL,
	[Street_1] [nchar](50) NOT NULL,
	[Street_2] [nchar](50) NULL,
	[City] [nchar](50) NOT NULL,
	[State] [nchar](10) NOT NULL,
	[Zip] [int] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Address_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 9/25/2022 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Brand_ID] [int] IDENTITY(1,1) NOT NULL,
	[Brand_Name] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Brand_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 9/25/2022 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Contact_ID] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [nchar](30) NOT NULL,
	[Last_Name] [nchar](30) NOT NULL,
	[Middle_Initial] [nchar](1) NULL,
	[Phone_Number] [nchar](10) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Contact_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 9/25/2022 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[Food_ID] [int] IDENTITY(1,1) NOT NULL,
	[Food_Name] [nchar](50) NOT NULL,
	[Brand_ID] [int] NOT NULL,
	[Vendor_ID] [int] NOT NULL,
	[Grams_Per_Unit] [int] NOT NULL,
	[Cost_Per_Unit] [money] NOT NULL,
 CONSTRAINT [PK_Food] PRIMARY KEY CLUSTERED 
(
	[Food_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 9/25/2022 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[Inventory_ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[Inventory_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory_Item]    Script Date: 9/25/2022 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory_Item](
	[Inventory_Item_ID] [int] IDENTITY(1,1) NOT NULL,
	[Inventory_ID] [int] NOT NULL,
	[Food_ID] [int] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Inventory_Item] PRIMARY KEY CLUSTERED 
(
	[Inventory_Item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 9/25/2022 12:43:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor](
	[Vendor_ID] [int] IDENTITY(1,1) NOT NULL,
	[Vendor_Name] [nchar](50) NOT NULL,
	[Address_ID] [int] NOT NULL,
	[Contact_ID] [int] NOT NULL,
 CONSTRAINT [PK_Vendor] PRIMARY KEY CLUSTERED 
(
	[Vendor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Address_ID], [Street_1], [Street_2], [City], [State], [Zip]) VALUES (1, N'30 Copeland Ave                                   ', NULL, N'La Crosse                                         ', N'WI        ', 54603)
INSERT [dbo].[Address] ([Address_ID], [Street_1], [Street_2], [City], [State], [Zip]) VALUES (2, N'3107 Market Pl                                    ', NULL, N'Onalaska                                          ', N'WI        ', 54650)
INSERT [dbo].[Address] ([Address_ID], [Street_1], [Street_2], [City], [State], [Zip]) VALUES (3, N'9515 WI-16 Trunk                                  ', NULL, N'Onalaska                                          ', N'WI        ', 54650)
INSERT [dbo].[Address] ([Address_ID], [Street_1], [Street_2], [City], [State], [Zip]) VALUES (4, N'315 5th Ave S                                     ', NULL, N'La Crosse                                         ', N'WI        ', 54601)
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([Brand_ID], [Brand_Name]) VALUES (1, N'Great Value                                       ')
INSERT [dbo].[Brand] ([Brand_ID], [Brand_Name]) VALUES (2, N'Essential Everday                                 ')
INSERT [dbo].[Brand] ([Brand_ID], [Brand_Name]) VALUES (3, N'Bob''s Red Mill                                    ')
INSERT [dbo].[Brand] ([Brand_ID], [Brand_Name]) VALUES (4, N'Field Day                                         ')
INSERT [dbo].[Brand] ([Brand_ID], [Brand_Name]) VALUES (5, N'Organic Valley                                    ')
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([Contact_ID], [First_Name], [Last_Name], [Middle_Initial], [Phone_Number]) VALUES (3, N'Bob                           ', N'Christenson                   ', N'B', N'5075555102')
INSERT [dbo].[Contact] ([Contact_ID], [First_Name], [Last_Name], [Middle_Initial], [Phone_Number]) VALUES (4, N'Kathy                         ', N'Black                         ', N'O', N'5075553498')
INSERT [dbo].[Contact] ([Contact_ID], [First_Name], [Last_Name], [Middle_Initial], [Phone_Number]) VALUES (5, N'Sally                         ', N'Johnson                       ', N'R', N'5075559012')
INSERT [dbo].[Contact] ([Contact_ID], [First_Name], [Last_Name], [Middle_Initial], [Phone_Number]) VALUES (6, N'Chris                         ', N'Smith                         ', N'E', N'5075558901')
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([Food_ID], [Food_Name], [Brand_ID], [Vendor_ID], [Grams_Per_Unit], [Cost_Per_Unit]) VALUES (1, N'Flour                                             ', 3, 6, 454, 8.9900)
INSERT [dbo].[Food] ([Food_ID], [Food_Name], [Brand_ID], [Vendor_ID], [Grams_Per_Unit], [Cost_Per_Unit]) VALUES (2, N'Eggs                                              ', 1, 4, 600, 2.9900)
INSERT [dbo].[Food] ([Food_ID], [Food_Name], [Brand_ID], [Vendor_ID], [Grams_Per_Unit], [Cost_Per_Unit]) VALUES (3, N'Milk                                              ', 5, 5, 800, 3.4900)
INSERT [dbo].[Food] ([Food_ID], [Food_Name], [Brand_ID], [Vendor_ID], [Grams_Per_Unit], [Cost_Per_Unit]) VALUES (4, N'Salt                                              ', 2, 3, 453, 1.9900)
INSERT [dbo].[Food] ([Food_ID], [Food_Name], [Brand_ID], [Vendor_ID], [Grams_Per_Unit], [Cost_Per_Unit]) VALUES (5, N'Beans                                             ', 4, 6, 425, 0.8500)
INSERT [dbo].[Food] ([Food_ID], [Food_Name], [Brand_ID], [Vendor_ID], [Grams_Per_Unit], [Cost_Per_Unit]) VALUES (6, N'Tomato Paste                                      ', 1, 4, 170, 0.8500)
INSERT [dbo].[Food] ([Food_ID], [Food_Name], [Brand_ID], [Vendor_ID], [Grams_Per_Unit], [Cost_Per_Unit]) VALUES (7, N'Cinnamon                                          ', 2, 3, 69, 1.1900)
INSERT [dbo].[Food] ([Food_ID], [Food_Name], [Brand_ID], [Vendor_ID], [Grams_Per_Unit], [Cost_Per_Unit]) VALUES (8, N'Oats                                              ', 3, 6, 907, 7.5900)
INSERT [dbo].[Food] ([Food_ID], [Food_Name], [Brand_ID], [Vendor_ID], [Grams_Per_Unit], [Cost_Per_Unit]) VALUES (9, N'Baking Soda                                       ', 2, 3, 454, 0.9900)
INSERT [dbo].[Food] ([Food_ID], [Food_Name], [Brand_ID], [Vendor_ID], [Grams_Per_Unit], [Cost_Per_Unit]) VALUES (10, N'Baking Powder                                     ', 2, 3, 397, 2.1900)
SET IDENTITY_INSERT [dbo].[Food] OFF
GO
SET IDENTITY_INSERT [dbo].[Inventory] ON 

INSERT [dbo].[Inventory] ([Inventory_ID], [Date]) VALUES (1, CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Inventory] ([Inventory_ID], [Date]) VALUES (2, CAST(N'2022-08-03' AS Date))
INSERT [dbo].[Inventory] ([Inventory_ID], [Date]) VALUES (3, CAST(N'2022-09-01' AS Date))
SET IDENTITY_INSERT [dbo].[Inventory] OFF
GO
SET IDENTITY_INSERT [dbo].[Inventory_Item] ON 

INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (1, 1, 1, 3)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (2, 1, 2, 0)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (3, 1, 3, 1)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (4, 1, 4, 1)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (5, 1, 5, 4)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (6, 1, 6, 2)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (7, 1, 7, 1)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (8, 1, 8, 2)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (9, 1, 9, 1)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (10, 1, 10, 0)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (11, 2, 1, 2)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (12, 2, 2, 2)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (13, 2, 3, 1)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (14, 2, 4, 1)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (15, 2, 5, 3)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (16, 2, 6, 1)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (17, 2, 7, 1)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (18, 2, 8, 1)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (19, 2, 9, 1)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (20, 2, 10, 2)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (21, 3, 1, 3)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (22, 3, 2, 2)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (23, 3, 3, 1)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (24, 3, 4, 2)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (25, 3, 5, 3)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (26, 3, 6, 3)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (27, 3, 7, 2)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (28, 3, 8, 2)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (29, 3, 9, 2)
INSERT [dbo].[Inventory_Item] ([Inventory_Item_ID], [Inventory_ID], [Food_ID], [Quantity]) VALUES (30, 3, 10, 2)
SET IDENTITY_INSERT [dbo].[Inventory_Item] OFF
GO
SET IDENTITY_INSERT [dbo].[Vendor] ON 

INSERT [dbo].[Vendor] ([Vendor_ID], [Vendor_Name], [Address_ID], [Contact_ID]) VALUES (3, N'Festival Foods Copeland                           ', 1, 3)
INSERT [dbo].[Vendor] ([Vendor_ID], [Vendor_Name], [Address_ID], [Contact_ID]) VALUES (4, N'Walmart                                           ', 2, 4)
INSERT [dbo].[Vendor] ([Vendor_ID], [Vendor_Name], [Address_ID], [Contact_ID]) VALUES (5, N'Woodmans                                          ', 3, 5)
INSERT [dbo].[Vendor] ([Vendor_ID], [Vendor_Name], [Address_ID], [Contact_ID]) VALUES (6, N'People''s Food Coop                                ', 4, 6)
SET IDENTITY_INSERT [dbo].[Vendor] OFF
GO
USE [master]
GO
ALTER DATABASE [KitchenManager] SET  READ_WRITE 
GO
