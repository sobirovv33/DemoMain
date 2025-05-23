USE [master]
GO
/****** Object:  Database [Krokodilo]    Script Date: 18.04.2025 11:25:59 ******/
CREATE DATABASE [Krokodilo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Krokodilo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Krokodilo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Krokodilo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Krokodilo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Krokodilo] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Krokodilo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Krokodilo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Krokodilo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Krokodilo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Krokodilo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Krokodilo] SET ARITHABORT OFF 
GO
ALTER DATABASE [Krokodilo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Krokodilo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Krokodilo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Krokodilo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Krokodilo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Krokodilo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Krokodilo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Krokodilo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Krokodilo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Krokodilo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Krokodilo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Krokodilo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Krokodilo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Krokodilo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Krokodilo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Krokodilo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Krokodilo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Krokodilo] SET RECOVERY FULL 
GO
ALTER DATABASE [Krokodilo] SET  MULTI_USER 
GO
ALTER DATABASE [Krokodilo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Krokodilo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Krokodilo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Krokodilo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Krokodilo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Krokodilo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Krokodilo', N'ON'
GO
ALTER DATABASE [Krokodilo] SET QUERY_STORE = ON
GO
ALTER DATABASE [Krokodilo] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Krokodilo]
GO
/****** Object:  Table [dbo].[HistoryMaterial]    Script Date: 18.04.2025 11:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryMaterial](
	[id] [int] NOT NULL,
	[idMaterial] [int] NULL,
	[idSklad] [int] NULL,
 CONSTRAINT [PK_HistoryMaterial] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialProducts]    Script Date: 18.04.2025 11:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialProducts](
	[id] [int] NOT NULL,
	[idMaterial] [int] NULL,
	[idProduct] [int] NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_MaterialProducts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 18.04.2025 11:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[id] [int] NOT NULL,
	[idType] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[idSupplier] [int] NULL,
	[Amount] [int] NULL,
	[EdIzmer] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[ImageMaterial] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NULL,
	[MinAmount] [int] NULL,
 CONSTRAINT [PK_Materials] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialTypes]    Script Date: 18.04.2025 11:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Brak] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 18.04.2025 11:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idType] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[DirektorFIO] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](225) NOT NULL,
	[INN] [nvarchar](50) NOT NULL,
	[Reiting] [int] NULL,
	[Logo] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnersProducts]    Script Date: 18.04.2025 11:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnersProducts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idProduct] [int] NULL,
	[idPartner] [int] NULL,
	[Amount] [int] NOT NULL,
	[Date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerTypes]    Script Date: 18.04.2025 11:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 18.04.2025 11:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idType] [int] NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Artikul] [nvarchar](50) NOT NULL,
	[MinPriceForPartner] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 18.04.2025 11:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Keff] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 18.04.2025 11:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sklads]    Script Date: 18.04.2025 11:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sklads](
	[id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Sklads] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkladUsers]    Script Date: 18.04.2025 11:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkladUsers](
	[id] [int] NOT NULL,
	[idSklad] [int] NULL,
	[idUser] [int] NULL,
 CONSTRAINT [PK_SkladUsers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 18.04.2025 11:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[id] [int] NOT NULL,
	[idType] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[INN] [nvarchar](50) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierTypes]    Script Date: 18.04.2025 11:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierTypes](
	[id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_SupplierTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplyHistory]    Script Date: 18.04.2025 11:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplyHistory](
	[id] [int] NOT NULL,
	[idHistoryMaterial] [int] NULL,
	[Amount] [int] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_SupplyHistory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 18.04.2025 11:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] NOT NULL,
	[FIO] [nvarchar](200) NULL,
	[DateOfBirthday] [date] NULL,
	[Pasport] [nvarchar](100) NULL,
	[Rekvisits] [nvarchar](100) NULL,
	[isMerried] [bit] NULL,
	[Helth] [nvarchar](50) NULL,
	[idRole] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Partners] ON 

INSERT [dbo].[Partners] ([id], [idType], [Name], [DirektorFIO], [Email], [Phone], [Address], [INN], [Reiting], [Logo]) VALUES (1, 1, N'База Строитель', N'Иванова Александра Ивановна', N'aleksandraivanova@ml.ru', N'493 123 45 67', N'652050, Кемеровская область, город Юрга, ул. Лесная, 15', N'2222455179', 7, NULL)
INSERT [dbo].[Partners] ([id], [idType], [Name], [DirektorFIO], [Email], [Phone], [Address], [INN], [Reiting], [Logo]) VALUES (2, 2, N'Паркет 29', N'Петров Василий Петрович', N'vppetrov@vl.ru', N'987 123 56 78', N'164500, Архангельская область, город Северодвинск, ул. Строителей, 18', N'3333888520', 7, NULL)
INSERT [dbo].[Partners] ([id], [idType], [Name], [DirektorFIO], [Email], [Phone], [Address], [INN], [Reiting], [Logo]) VALUES (3, 3, N'Стройсервис', N'Соловьев Андрей Николаевич', N'ansolovev@st.ru', N'812 223 32 00', N'188910, Ленинградская область, город Приморск, ул. Парковая, 21', N'4440391035', 7, NULL)
INSERT [dbo].[Partners] ([id], [idType], [Name], [DirektorFIO], [Email], [Phone], [Address], [INN], [Reiting], [Logo]) VALUES (4, 4, N'Ремонт и отделка', N'Воробьева Екатерина Валерьевна', N'ekaterina.vorobeva@ml.ru', N'444 222 33 11', N'143960, Московская область, город Реутов, ул. Свободы, 51', N'1111520857', 5, NULL)
INSERT [dbo].[Partners] ([id], [idType], [Name], [DirektorFIO], [Email], [Phone], [Address], [INN], [Reiting], [Logo]) VALUES (5, 1, N'МонтажПро', N'Степанов Степан Сергеевич', N'stepanov@stepan.ru', N'912 888 33 33', N'309500, Белгородская область, город Старый Оскол, ул. Рабочая, 122', N'5552431140', 10, NULL)
SET IDENTITY_INSERT [dbo].[Partners] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnersProducts] ON 

INSERT [dbo].[PartnersProducts] ([id], [idProduct], [idPartner], [Amount], [Date]) VALUES (1, 1, 1, 15500, CAST(N'2023-03-23' AS Date))
INSERT [dbo].[PartnersProducts] ([id], [idProduct], [idPartner], [Amount], [Date]) VALUES (2, 3, 1, 12350, CAST(N'2023-12-18' AS Date))
INSERT [dbo].[PartnersProducts] ([id], [idProduct], [idPartner], [Amount], [Date]) VALUES (3, 4, 1, 37400, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[PartnersProducts] ([id], [idProduct], [idPartner], [Amount], [Date]) VALUES (4, 2, 2, 35000, CAST(N'2022-12-02' AS Date))
INSERT [dbo].[PartnersProducts] ([id], [idProduct], [idPartner], [Amount], [Date]) VALUES (5, 5, 2, 1250, CAST(N'2023-05-17' AS Date))
INSERT [dbo].[PartnersProducts] ([id], [idProduct], [idPartner], [Amount], [Date]) VALUES (6, 3, 2, 1000, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[PartnersProducts] ([id], [idProduct], [idPartner], [Amount], [Date]) VALUES (7, 1, 2, 7550, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[PartnersProducts] ([id], [idProduct], [idPartner], [Amount], [Date]) VALUES (8, 1, 3, 7250, CAST(N'2023-01-22' AS Date))
INSERT [dbo].[PartnersProducts] ([id], [idProduct], [idPartner], [Amount], [Date]) VALUES (9, 2, 3, 2500, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[PartnersProducts] ([id], [idProduct], [idPartner], [Amount], [Date]) VALUES (10, 4, 4, 59050, CAST(N'2023-03-20' AS Date))
INSERT [dbo].[PartnersProducts] ([id], [idProduct], [idPartner], [Amount], [Date]) VALUES (11, 3, 4, 37200, CAST(N'2024-03-12' AS Date))
INSERT [dbo].[PartnersProducts] ([id], [idProduct], [idPartner], [Amount], [Date]) VALUES (12, 5, 4, 4500, CAST(N'2024-05-14' AS Date))
INSERT [dbo].[PartnersProducts] ([id], [idProduct], [idPartner], [Amount], [Date]) VALUES (13, 3, 5, 50000, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[PartnersProducts] ([id], [idProduct], [idPartner], [Amount], [Date]) VALUES (14, 4, 5, 670000, CAST(N'2023-11-10' AS Date))
INSERT [dbo].[PartnersProducts] ([id], [idProduct], [idPartner], [Amount], [Date]) VALUES (15, 1, 5, 35000, CAST(N'2024-04-15' AS Date))
INSERT [dbo].[PartnersProducts] ([id], [idProduct], [idPartner], [Amount], [Date]) VALUES (16, 2, 5, 25000, CAST(N'2024-06-12' AS Date))
SET IDENTITY_INSERT [dbo].[PartnersProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerTypes] ON 

INSERT [dbo].[PartnerTypes] ([id], [Name]) VALUES (1, N'ЗАО')
INSERT [dbo].[PartnerTypes] ([id], [Name]) VALUES (2, N'ООО')
INSERT [dbo].[PartnerTypes] ([id], [Name]) VALUES (3, N'ПАО')
INSERT [dbo].[PartnerTypes] ([id], [Name]) VALUES (4, N'ОАО')
SET IDENTITY_INSERT [dbo].[PartnerTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id], [idType], [Name], [Artikul], [MinPriceForPartner]) VALUES (1, 3, N'Паркетная доска Ясень темный однополосная 14 мм', N'8758385', CAST(4456.90 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([id], [idType], [Name], [Artikul], [MinPriceForPartner]) VALUES (2, 3, N'Инженерная доска Дуб Французская елка однополосная 12 мм', N'8858958', CAST(7330.99 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([id], [idType], [Name], [Artikul], [MinPriceForPartner]) VALUES (3, 1, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', N'7750282', CAST(1799.33 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([id], [idType], [Name], [Artikul], [MinPriceForPartner]) VALUES (4, 1, N'Ламинат Дуб серый 32 класс 8 мм с фаской', N'7028748', CAST(3890.41 AS Decimal(10, 2)))
INSERT [dbo].[Products] ([id], [idType], [Name], [Artikul], [MinPriceForPartner]) VALUES (5, 4, N'Пробковое напольное клеевое покрытие 32 класс 4 мм', N'5012543', CAST(5450.59 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 

INSERT [dbo].[ProductTypes] ([id], [Name], [Keff]) VALUES (1, N'Ламинат', CAST(2.35 AS Decimal(10, 2)))
INSERT [dbo].[ProductTypes] ([id], [Name], [Keff]) VALUES (2, N'Массивная доска', CAST(5.15 AS Decimal(10, 2)))
INSERT [dbo].[ProductTypes] ([id], [Name], [Keff]) VALUES (3, N'Паркетная доска', CAST(4.34 AS Decimal(10, 2)))
INSERT [dbo].[ProductTypes] ([id], [Name], [Keff]) VALUES (4, N'Пробковое покрытие', CAST(1.50 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
GO
ALTER TABLE [dbo].[HistoryMaterial]  WITH CHECK ADD  CONSTRAINT [FK_HistoryMaterial_Materials] FOREIGN KEY([idMaterial])
REFERENCES [dbo].[Materials] ([id])
GO
ALTER TABLE [dbo].[HistoryMaterial] CHECK CONSTRAINT [FK_HistoryMaterial_Materials]
GO
ALTER TABLE [dbo].[HistoryMaterial]  WITH CHECK ADD  CONSTRAINT [FK_HistoryMaterial_Sklads] FOREIGN KEY([idSklad])
REFERENCES [dbo].[Sklads] ([id])
GO
ALTER TABLE [dbo].[HistoryMaterial] CHECK CONSTRAINT [FK_HistoryMaterial_Sklads]
GO
ALTER TABLE [dbo].[MaterialProducts]  WITH CHECK ADD  CONSTRAINT [FK_MaterialProducts_Materials] FOREIGN KEY([idMaterial])
REFERENCES [dbo].[Materials] ([id])
GO
ALTER TABLE [dbo].[MaterialProducts] CHECK CONSTRAINT [FK_MaterialProducts_Materials]
GO
ALTER TABLE [dbo].[MaterialProducts]  WITH CHECK ADD  CONSTRAINT [FK_MaterialProducts_Partners] FOREIGN KEY([idProduct])
REFERENCES [dbo].[Partners] ([id])
GO
ALTER TABLE [dbo].[MaterialProducts] CHECK CONSTRAINT [FK_MaterialProducts_Partners]
GO
ALTER TABLE [dbo].[MaterialProducts]  WITH CHECK ADD  CONSTRAINT [FK_MaterialProducts_Products] FOREIGN KEY([idProduct])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[MaterialProducts] CHECK CONSTRAINT [FK_MaterialProducts_Products]
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD  CONSTRAINT [FK_Materials_MaterialTypes] FOREIGN KEY([idType])
REFERENCES [dbo].[MaterialTypes] ([id])
GO
ALTER TABLE [dbo].[Materials] CHECK CONSTRAINT [FK_Materials_MaterialTypes]
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD  CONSTRAINT [FK_Materials_Suppliers] FOREIGN KEY([idSupplier])
REFERENCES [dbo].[Suppliers] ([id])
GO
ALTER TABLE [dbo].[Materials] CHECK CONSTRAINT [FK_Materials_Suppliers]
GO
ALTER TABLE [dbo].[Partners]  WITH CHECK ADD FOREIGN KEY([idType])
REFERENCES [dbo].[PartnerTypes] ([id])
GO
ALTER TABLE [dbo].[PartnersProducts]  WITH CHECK ADD FOREIGN KEY([idPartner])
REFERENCES [dbo].[Partners] ([id])
GO
ALTER TABLE [dbo].[PartnersProducts]  WITH CHECK ADD FOREIGN KEY([idProduct])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([idType])
REFERENCES [dbo].[ProductTypes] ([id])
GO
ALTER TABLE [dbo].[SkladUsers]  WITH CHECK ADD  CONSTRAINT [FK_SkladUsers_Sklads] FOREIGN KEY([idSklad])
REFERENCES [dbo].[Sklads] ([id])
GO
ALTER TABLE [dbo].[SkladUsers] CHECK CONSTRAINT [FK_SkladUsers_Sklads]
GO
ALTER TABLE [dbo].[SkladUsers]  WITH CHECK ADD  CONSTRAINT [FK_SkladUsers_Users] FOREIGN KEY([idUser])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[SkladUsers] CHECK CONSTRAINT [FK_SkladUsers_Users]
GO
ALTER TABLE [dbo].[Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_Suppliers_SupplierTypes] FOREIGN KEY([idType])
REFERENCES [dbo].[SupplierTypes] ([id])
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [FK_Suppliers_SupplierTypes]
GO
ALTER TABLE [dbo].[SupplyHistory]  WITH CHECK ADD  CONSTRAINT [FK_SupplyHistory_HistoryMaterial] FOREIGN KEY([idHistoryMaterial])
REFERENCES [dbo].[HistoryMaterial] ([id])
GO
ALTER TABLE [dbo].[SupplyHistory] CHECK CONSTRAINT [FK_SupplyHistory_HistoryMaterial]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([idRole])
REFERENCES [dbo].[Roles] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [Krokodilo] SET  READ_WRITE 
GO
