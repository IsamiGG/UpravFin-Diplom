USE [UpravFin1]
GO
/****** Object:  Database [UpravFin]    Script Date: 28.06.2023 22:45:59 ******/
CREATE DATABASE [UpravFin]
 CONTAINMENT = NONE

GO
ALTER DATABASE [UpravFin] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UpravFin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UpravFin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UpravFin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UpravFin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UpravFin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UpravFin] SET ARITHABORT OFF 
GO
ALTER DATABASE [UpravFin] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UpravFin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UpravFin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UpravFin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UpravFin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UpravFin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UpravFin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UpravFin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UpravFin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UpravFin] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UpravFin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UpravFin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UpravFin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UpravFin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UpravFin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UpravFin] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UpravFin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UpravFin] SET RECOVERY FULL 
GO
ALTER DATABASE [UpravFin] SET  MULTI_USER 
GO
ALTER DATABASE [UpravFin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UpravFin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UpravFin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UpravFin] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UpravFin] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UpravFin] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'UpravFin', N'ON'
GO
ALTER DATABASE [UpravFin] SET QUERY_STORE = OFF
GO
USE [UpravFin]
GO
/****** Object:  Table [dbo].[Doc]    Script Date: 28.06.2023 22:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doc](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Vid] [nvarchar](20) NULL,
	[Number] [int] NULL,
	[Date] [date] NULL,
	[Name] [nvarchar](50) NULL,
	[FileDoc] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Doc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinSostoyanie]    Script Date: 28.06.2023 22:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinSostoyanie](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateBegin] [date] NULL,
	[DateEnd] [date] NULL,
	[SK] [int] NULL,
	[VOA] [int] NULL,
	[DKZ] [int] NULL,
	[KKZ] [int] NULL,
	[SZ] [int] NULL,
	[FinanceSostoyanie] [nvarchar](150) NULL,
 CONSTRAINT [PK_FinSostoyanie] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobTittles]    Script Date: 28.06.2023 22:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTittles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_JobTittles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personal]    Script Date: 28.06.2023 22:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personal](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [nvarchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[Pol] [nvarchar](10) NULL,
	[IDJobTittle] [int] NULL,
	[Address] [nvarchar](200) NULL,
	[Telephone] [nvarchar](16) NULL,
	[PassportData] [nvarchar](50) NULL,
	[INN] [nvarchar](12) NULL,
	[SNILS] [nvarchar](14) NULL,
	[Photo] [nvarchar](100) NULL,
 CONSTRAINT [PK_Personal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 28.06.2023 22:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Spravochnik]    Script Date: 28.06.2023 22:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Spravochnik](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [nvarchar](50) NULL,
	[IDJobTittle] [int] NULL,
	[Nkabineta] [int] NULL,
	[Telephone] [nvarchar](16) NULL,
 CONSTRAINT [PK_Spravochnik] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 28.06.2023 22:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nchar](10) NULL,
	[Password] [nchar](10) NULL,
	[IDRole] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Doc] ON 

INSERT [dbo].[Doc] ([ID], [Vid], [Number], [Date], [Name], [FileDoc]) VALUES (7, N'Приказ', 26, CAST(N'2023-05-02' AS Date), N'"О внесении изменений в приказ № 79', N'G:\UprFin\1.doc')
INSERT [dbo].[Doc] ([ID], [Vid], [Number], [Date], [Name], [FileDoc]) VALUES (16, N'Постановление', 106, CAST(N'2023-02-03' AS Date), N'Об утверждении Порядка формирования пере', N'G:\UprFin\2.doc')
INSERT [dbo].[Doc] ([ID], [Vid], [Number], [Date], [Name], [FileDoc]) VALUES (18, N'Решение', 349, CAST(N'2023-12-30' AS Date), N'Об утверждении положения', N'G:\UprFin\3.doc')
INSERT [dbo].[Doc] ([ID], [Vid], [Number], [Date], [Name], [FileDoc]) VALUES (20, N'Приказ', 111, CAST(N'2023-06-29' AS Date), N'Об окончании ПП05', N'G:\\4.doc')
SET IDENTITY_INSERT [dbo].[Doc] OFF
GO
SET IDENTITY_INSERT [dbo].[FinSostoyanie] ON 

INSERT [dbo].[FinSostoyanie] ([ID], [DateBegin], [DateEnd], [SK], [VOA], [DKZ], [KKZ], [SZ], [FinanceSostoyanie]) VALUES (1, CAST(N'2019-01-01' AS Date), CAST(N'2020-01-01' AS Date), 1, -1, 12, 0, 2, N' Абсолютная финансовая устойчивость. Высокий уровень платежеспособности. Предприятие не зависит от внешних кредиторов')
INSERT [dbo].[FinSostoyanie] ([ID], [DateBegin], [DateEnd], [SK], [VOA], [DKZ], [KKZ], [SZ], [FinanceSostoyanie]) VALUES (2, CAST(N'2020-01-01' AS Date), CAST(N'2021-01-01' AS Date), 1, -1, -2, 0, 2, N' Неопределенное состояние')
INSERT [dbo].[FinSostoyanie] ([ID], [DateBegin], [DateEnd], [SK], [VOA], [DKZ], [KKZ], [SZ], [FinanceSostoyanie]) VALUES (4, CAST(N'2021-01-01' AS Date), CAST(N'2022-01-01' AS Date), -19, -15, -2, 0, 90, N'Кризисное (критическое) финансовое состояние. Предприятие полностью неплатежеспособно. И находится на грани банкротства')
SET IDENTITY_INSERT [dbo].[FinSostoyanie] OFF
GO
SET IDENTITY_INSERT [dbo].[JobTittles] ON 

INSERT [dbo].[JobTittles] ([ID], [Name]) VALUES (1, N'Бухгалтер')
INSERT [dbo].[JobTittles] ([ID], [Name]) VALUES (2, N'Главный бухгалтер')
INSERT [dbo].[JobTittles] ([ID], [Name]) VALUES (3, N'Финансист')
INSERT [dbo].[JobTittles] ([ID], [Name]) VALUES (4, N'Глава местного самоуправления')
INSERT [dbo].[JobTittles] ([ID], [Name]) VALUES (5, N'Помощник главы')
INSERT [dbo].[JobTittles] ([ID], [Name]) VALUES (6, N'Заместитель главы администрации')
INSERT [dbo].[JobTittles] ([ID], [Name]) VALUES (7, N'Начальник управления финансов')
SET IDENTITY_INSERT [dbo].[JobTittles] OFF
GO
SET IDENTITY_INSERT [dbo].[Personal] ON 

INSERT [dbo].[Personal] ([ID], [FIO], [DateOfBirth], [Pol], [IDJobTittle], [Address], [Telephone], [PassportData], [INN], [SNILS], [Photo]) VALUES (1, N'Куликова Наталья Вениаминовна', CAST(N'1970-03-20' AS Date), N'Женский', 7, N'р.п. Тоншаево, ул. Мира, д.25', N'8-920-263-26-23', N'2204 №253621', N'125326231', N'125-125-232 51', N'G:\UprFin\1.jpg')
INSERT [dbo].[Personal] ([ID], [FIO], [DateOfBirth], [Pol], [IDJobTittle], [Address], [Telephone], [PassportData], [INN], [SNILS], [Photo]) VALUES (2, N'Перевалов Никита Константинович', CAST(N'2003-11-03' AS Date), N'Мужской', 7, N'р.п. Тоншаево', N'8-951-263-24-54', N'2219 252564', N'12536', N'120-202-23 25', N'file:///G:/UprFin/UpravFin/ah9p4n2-AC8.png')
SET IDENTITY_INSERT [dbo].[Personal] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [Name]) VALUES (1, N'user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (2, N'admin')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Spravochnik] ON 

INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (1, N'Стремин Станислав Юрьевич', 4, 0, N'8-831-512-10-99')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (2, N'Петухова Юлия Сергеевна', 5, 209, N'8-831-512-10-99')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (3, N'Чурашова Марина Рахимовна', 6, 208, N'8-831-512-15-55')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (4, N'Рябов Антон Игоревич', 6, 213, N'8-831-512-16-50')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (5, N'Куликова Наталья Вениаминовна', 7, 203, N'8-831-512-13-33')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (6, N'Перевалов Никита Константинович', 7, 307, N'8-831-512-31-13')
SET IDENTITY_INSERT [dbo].[Spravochnik] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Login], [Password], [IDRole]) VALUES (1, N'admin     ', N'255       ', 2)
INSERT [dbo].[User] ([ID], [Login], [Password], [IDRole]) VALUES (2, N'222       ', N'222       ', 1)
INSERT [dbo].[User] ([ID], [Login], [Password], [IDRole]) VALUES (3, N'nikita    ', N'123       ', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Personal]  WITH CHECK ADD  CONSTRAINT [FK_Personal_JobTittles] FOREIGN KEY([IDJobTittle])
REFERENCES [dbo].[JobTittles] ([ID])
GO
ALTER TABLE [dbo].[Personal] CHECK CONSTRAINT [FK_Personal_JobTittles]
GO
ALTER TABLE [dbo].[Spravochnik]  WITH CHECK ADD  CONSTRAINT [FK_Spravochnik_JobTittles] FOREIGN KEY([IDJobTittle])
REFERENCES [dbo].[JobTittles] ([ID])
GO
ALTER TABLE [dbo].[Spravochnik] CHECK CONSTRAINT [FK_Spravochnik_JobTittles]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [UpravFin] SET  READ_WRITE 
GO
