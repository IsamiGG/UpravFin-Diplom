USE [UpravFinSost]
GO
/****** Object:  Table [dbo].[Doc]    Script Date: 17.06.2024 15:58:29 ******/
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
/****** Object:  Table [dbo].[FinSostoyanie]    Script Date: 17.06.2024 15:58:29 ******/
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
/****** Object:  Table [dbo].[JobTittles]    Script Date: 17.06.2024 15:58:29 ******/
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
/****** Object:  Table [dbo].[Personal]    Script Date: 17.06.2024 15:58:29 ******/
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
/****** Object:  Table [dbo].[PersonalCabinet]    Script Date: 17.06.2024 15:58:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalCabinet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Role] [nvarchar](50) NULL,
	[Date] [date] NULL,
	[Zametki] [nvarchar](50) NULL,
	[DeloOne] [nvarchar](50) NULL,
	[DeloTwo] [nvarchar](50) NULL,
	[DeloThree] [nvarchar](50) NULL,
	[DeloFour] [nvarchar](50) NULL,
	[DeloFive] [nvarchar](50) NULL,
	[DeloSix] [nvarchar](50) NULL,
 CONSTRAINT [PK_PersonalCabinet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 17.06.2024 15:58:29 ******/
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
/****** Object:  Table [dbo].[Spravochnik]    Script Date: 17.06.2024 15:58:29 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 17.06.2024 15:58:29 ******/
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

INSERT [dbo].[Doc] ([ID], [Vid], [Number], [Date], [Name], [FileDoc]) VALUES (7, N'Приказ', 26, CAST(N'2023-05-02' AS Date), N'"О внесении изменений в приказ № 79', N'C:\Users\talant\Downloads\Otchet_PP03_Perevalov.pdf')
INSERT [dbo].[Doc] ([ID], [Vid], [Number], [Date], [Name], [FileDoc]) VALUES (16, N'Постановление', 106, CAST(N'2023-02-03' AS Date), N'Об утверждении Порядка формирования пере', N'C:\Users\talant\Downloads\Otchet_PP03_Perevalov.pdf')
INSERT [dbo].[Doc] ([ID], [Vid], [Number], [Date], [Name], [FileDoc]) VALUES (18, N'Решение', 349, CAST(N'2023-12-30' AS Date), N'Об утверждении положения', N'C:\Users\talant\Downloads\Otchet_PP03_Perevalov.pdf')
INSERT [dbo].[Doc] ([ID], [Vid], [Number], [Date], [Name], [FileDoc]) VALUES (20, N'Приказ', 111, CAST(N'2023-06-29' AS Date), N'Об окончании ПП05', N'C:\Users\talant\Downloads\Otchet_PP03_Perevalov.pdf')
INSERT [dbo].[Doc] ([ID], [Vid], [Number], [Date], [Name], [FileDoc]) VALUES (1015, N'Приказ', 123, CAST(N'2024-05-26' AS Date), N'Об отчислении', N'C:\Users\talant\Downloads\Otchet_PP03_Perevalov.pdf')
INSERT [dbo].[Doc] ([ID], [Vid], [Number], [Date], [Name], [FileDoc]) VALUES (1016, N'Приказ', 228, CAST(N'2024-05-10' AS Date), N'Ну я молю БОГА 2', N'C:\Users\talant\Downloads\Otchet_PP03_Perevalov.pdf')
SET IDENTITY_INSERT [dbo].[Doc] OFF
GO
SET IDENTITY_INSERT [dbo].[FinSostoyanie] ON 

INSERT [dbo].[FinSostoyanie] ([ID], [DateBegin], [DateEnd], [SK], [VOA], [DKZ], [KKZ], [SZ], [FinanceSostoyanie]) VALUES (1, CAST(N'2019-01-01' AS Date), CAST(N'2020-01-01' AS Date), 1, -1, 12, 0, 2, N' Абсолютная финансовая устойчивость. Высокий уровень платежеспособности. Предприятие не зависит от внешних кредиторов')
INSERT [dbo].[FinSostoyanie] ([ID], [DateBegin], [DateEnd], [SK], [VOA], [DKZ], [KKZ], [SZ], [FinanceSostoyanie]) VALUES (2, CAST(N'2020-01-01' AS Date), CAST(N'2021-01-01' AS Date), 1, -1, -2, 0, 2, N' Неопределенное состояние')
INSERT [dbo].[FinSostoyanie] ([ID], [DateBegin], [DateEnd], [SK], [VOA], [DKZ], [KKZ], [SZ], [FinanceSostoyanie]) VALUES (4, CAST(N'2021-01-01' AS Date), CAST(N'2022-01-01' AS Date), -19, -15, -2, 0, 90, N'Кризисное (критическое) финансовое состояние. Предприятие полностью неплатежеспособно. И находится на грани банкротства')
INSERT [dbo].[FinSostoyanie] ([ID], [DateBegin], [DateEnd], [SK], [VOA], [DKZ], [KKZ], [SZ], [FinanceSostoyanie]) VALUES (1002, CAST(N'2024-05-01' AS Date), CAST(N'2024-05-31' AS Date), 345603020, 10801, -27930, 320000, -4229302, N' Абсолютная финансовая устойчивость. Высокий уровень платежеспособности. Предприятие не зависит от внешних кредиторов')
INSERT [dbo].[FinSostoyanie] ([ID], [DateBegin], [DateEnd], [SK], [VOA], [DKZ], [KKZ], [SZ], [FinanceSostoyanie]) VALUES (1023, CAST(N'2024-05-01' AS Date), CAST(N'2024-05-16' AS Date), 123308937, 111111, 12344402, 1230416, -96418, N' Абсолютная финансовая устойчивость. Высокий уровень платежеспособности. Предприятие не зависит от внешних кредиторов')
INSERT [dbo].[FinSostoyanie] ([ID], [DateBegin], [DateEnd], [SK], [VOA], [DKZ], [KKZ], [SZ], [FinanceSostoyanie]) VALUES (1024, CAST(N'2024-05-03' AS Date), CAST(N'2024-05-14' AS Date), -11358024, 751887, 11965554, 7800033, 147596333, N'Кризисное (критическое) финансовое состояние. Предприятие полностью неплатежеспособно. И находится на грани банкротства')
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

INSERT [dbo].[Personal] ([ID], [FIO], [DateOfBirth], [Pol], [IDJobTittle], [Address], [Telephone], [PassportData], [INN], [SNILS], [Photo]) VALUES (1, N'Куликова Наталья Вениаминовна', CAST(N'1970-03-20' AS Date), N'Женский', 7, N'р.п. Тоншаево, ул. Мира, д.25', N'8-920-263-26-23', N'2204 №253621', N'125326231', N'125-125-232 51', N'C:\Users\talant\Desktop\UpravFin-master\zagl.jpg')
INSERT [dbo].[Personal] ([ID], [FIO], [DateOfBirth], [Pol], [IDJobTittle], [Address], [Telephone], [PassportData], [INN], [SNILS], [Photo]) VALUES (2, N'Перевалов Никита Константинович', CAST(N'2003-11-03' AS Date), N'Мужской', 7, N'р.п. Тоншаево', N'8-951-263-24-54', N'2219 252564', N'12536', N'120-202-23 25', N'C:\Users\talant\Desktop\UpravFin-master\zagl.jpg')
INSERT [dbo].[Personal] ([ID], [FIO], [DateOfBirth], [Pol], [IDJobTittle], [Address], [Telephone], [PassportData], [INN], [SNILS], [Photo]) VALUES (3, N'Акутин Дмитрий Дмитриевич', CAST(N'2024-05-05' AS Date), N'М', 1, N'д.Ломовка,Ул.Колхозная,д.15', N'79045698523', N'4512635241', N'123454', N'123456', N'file:///C:/Users/talant/Desktop/UpravFin-master/work.png')
INSERT [dbo].[Personal] ([ID], [FIO], [DateOfBirth], [Pol], [IDJobTittle], [Address], [Telephone], [PassportData], [INN], [SNILS], [Photo]) VALUES (8, N'Рональдо Виктор Александрович', CAST(N'2000-05-12' AS Date), N'М', 3, N'г.Сергач, ул.Жукова, д.25', N'79994886632', N'2240859674', N'123456', N'1235645', N'file:///C:/Users/talant/Downloads/edit.png')
INSERT [dbo].[Personal] ([ID], [FIO], [DateOfBirth], [Pol], [IDJobTittle], [Address], [Telephone], [PassportData], [INN], [SNILS], [Photo]) VALUES (9, N'Рональдо Виктор Олегович', CAST(N'2000-05-12' AS Date), N'М', 3, N'г.Сергач, ул.Жукова, д.25', N'79994886632', N'2240859674', N'123456', N'1235645', N'file:///C:/Users/talant/Downloads/edit.png')
INSERT [dbo].[Personal] ([ID], [FIO], [DateOfBirth], [Pol], [IDJobTittle], [Address], [Telephone], [PassportData], [INN], [SNILS], [Photo]) VALUES (10, N'Попов Глеб Артёмович', CAST(N'1985-05-15' AS Date), N'М', 1, N'г. Москва, ул. Ленина, д. 1', N'89161234567', N'1234 567890', N'123456789012', N'123-456-789 12', N'photo1.jpg')
INSERT [dbo].[Personal] ([ID], [FIO], [DateOfBirth], [Pol], [IDJobTittle], [Address], [Telephone], [PassportData], [INN], [SNILS], [Photo]) VALUES (11, N'Волков Александр Владиславович', CAST(N'1982-08-23' AS Date), N'М', 1, N'ул. Гагарина, д. 2', N'89161234568', N'2345 678901', N'234567890123', N'234-567-890 23', N'photo2.jpg')
INSERT [dbo].[Personal] ([ID], [FIO], [DateOfBirth], [Pol], [IDJobTittle], [Address], [Telephone], [PassportData], [INN], [SNILS], [Photo]) VALUES (12, N'Егоров Мирон Даниилович', CAST(N'1990-12-11' AS Date), N'М', 1, N'ул. Мира, д. 3', N'89161234569', N'3456 789012', N'345678901234', N'345-678-901 34', N'photo3.jpg')
INSERT [dbo].[Personal] ([ID], [FIO], [DateOfBirth], [Pol], [IDJobTittle], [Address], [Telephone], [PassportData], [INN], [SNILS], [Photo]) VALUES (13, N'Ермолаева Владислава Тимофеевна', CAST(N'1987-03-30' AS Date), N'Ж', 1, N'ул. Ленина, д. 4', N'89161234570', N'4567 890123', N'456789012345', N'456-789-012 45', N'photo4.jpg')
INSERT [dbo].[Personal] ([ID], [FIO], [DateOfBirth], [Pol], [IDJobTittle], [Address], [Telephone], [PassportData], [INN], [SNILS], [Photo]) VALUES (14, N'Никольский Тимофей Даниилович', CAST(N'1988-06-22' AS Date), N'М', 1, N'ул. Гагарина, д. 5', N'89161234571', N'5678 901234', N'567890123456', N'567-890-123 56', N'photo5.jpg')
INSERT [dbo].[Personal] ([ID], [FIO], [DateOfBirth], [Pol], [IDJobTittle], [Address], [Telephone], [PassportData], [INN], [SNILS], [Photo]) VALUES (15, N'Максимов Матвей Иванович', CAST(N'1981-09-05' AS Date), N'М', 1, N'ул. Мира, д. 6', N'89161234572', N'6789 012345', N'678901234567', N'678-901-234 67', N'photo6.jpg')
INSERT [dbo].[Personal] ([ID], [FIO], [DateOfBirth], [Pol], [IDJobTittle], [Address], [Telephone], [PassportData], [INN], [SNILS], [Photo]) VALUES (16, N'Воробьев Олег Марсельевич', CAST(N'1992-11-19' AS Date), N'М', 1, N'ул. Ленина, д. 7', N'89161234573', N'7890 123456', N'789012345678', N'789-012-345 78', N'photo7.jpg')
INSERT [dbo].[Personal] ([ID], [FIO], [DateOfBirth], [Pol], [IDJobTittle], [Address], [Telephone], [PassportData], [INN], [SNILS], [Photo]) VALUES (17, N'Лукьянова Ксения Мирославовна', CAST(N'1986-04-14' AS Date), N'Ж', 1, N'ул. Гагарина, д. 8', N'89161234574', N'8901 234567', N'890123456789', N'890-123-456 89', N'photo8.jpg')
INSERT [dbo].[Personal] ([ID], [FIO], [DateOfBirth], [Pol], [IDJobTittle], [Address], [Telephone], [PassportData], [INN], [SNILS], [Photo]) VALUES (18, N'Жукова София Михайловна', CAST(N'1989-01-25' AS Date), N'Ж', 1, N'ул. Мира, д. 9', N'89161234575', N'9012 345678', N'901234567890', N'901-234-567 90', N'photo9.jpg')
INSERT [dbo].[Personal] ([ID], [FIO], [DateOfBirth], [Pol], [IDJobTittle], [Address], [Telephone], [PassportData], [INN], [SNILS], [Photo]) VALUES (19, N'Одинцова Анна Ивановна', CAST(N'1990-02-16' AS Date), N'Ж', 1, N'ул. Ленина, д. 10', N'89161234576', N'0123 456789', N'012345678901', N'012-345-678 01', N'photo10.jpg')
INSERT [dbo].[Personal] ([ID], [FIO], [DateOfBirth], [Pol], [IDJobTittle], [Address], [Telephone], [PassportData], [INN], [SNILS], [Photo]) VALUES (20, N'Киселев Леонид Сергеевич', CAST(N'1985-07-07' AS Date), N'М', 1, N'ул. Гагарина, д. 11', N'89161234577', N'1234 567890', N'123456789012', N'123-456-789 12', N'photo11.jpg')
INSERT [dbo].[Personal] ([ID], [FIO], [DateOfBirth], [Pol], [IDJobTittle], [Address], [Telephone], [PassportData], [INN], [SNILS], [Photo]) VALUES (21, N'Морозова Елена Павловна', CAST(N'1984-09-13' AS Date), N'Ж', 1, N'ул. Мира, д. 12', N'89161234578', N'2345 678901', N'234567890123', N'234-567-890 23', N'photo12.jpg')
INSERT [dbo].[Personal] ([ID], [FIO], [DateOfBirth], [Pol], [IDJobTittle], [Address], [Telephone], [PassportData], [INN], [SNILS], [Photo]) VALUES (22, N'Павлов Артем Юрьевич', CAST(N'1987-05-18' AS Date), N'М', 1, N'ул. Ленина, д. 13', N'89161234579', N'3456 789012', N'345678901234', N'345-678-901 34', N'photo13.jpg')
INSERT [dbo].[Personal] ([ID], [FIO], [DateOfBirth], [Pol], [IDJobTittle], [Address], [Telephone], [PassportData], [INN], [SNILS], [Photo]) VALUES (23, N'Крылова Ирина Максимовна', CAST(N'1982-03-29' AS Date), N'Ж', 1, N'ул. Гагарина, д. 14', N'89161234580', N'4567 890123', N'456789012345', N'456-789-012 45', N'photo14.jpg')
INSERT [dbo].[Personal] ([ID], [FIO], [DateOfBirth], [Pol], [IDJobTittle], [Address], [Telephone], [PassportData], [INN], [SNILS], [Photo]) VALUES (24, N'Федорова Марина Андреевна', CAST(N'1991-11-02' AS Date), N'Ж', 1, N'ул. Мира, д. 15', N'89161234581', N'5678 901234', N'567890123456', N'567-890-123 56', N'photo15.jpg')
INSERT [dbo].[Personal] ([ID], [FIO], [DateOfBirth], [Pol], [IDJobTittle], [Address], [Telephone], [PassportData], [INN], [SNILS], [Photo]) VALUES (25, N'Беляев Роман Игоревич', CAST(N'1988-08-21' AS Date), N'М', 1, N'ул. Ленина, д. 16', N'89161234582', N'6789 012345', N'678901234567', N'678-901-234 67', N'photo16.jpg')
INSERT [dbo].[Personal] ([ID], [FIO], [DateOfBirth], [Pol], [IDJobTittle], [Address], [Telephone], [PassportData], [INN], [SNILS], [Photo]) VALUES (26, N'Тарасов Виктор Петрович', CAST(N'1986-02-04' AS Date), N'М', 1, N'ул. Гагарина, д. 17', N'89161234583', N'7890 123456', N'789012345678', N'789-012-345 78', N'photo17.jpg')
INSERT [dbo].[Personal] ([ID], [FIO], [DateOfBirth], [Pol], [IDJobTittle], [Address], [Telephone], [PassportData], [INN], [SNILS], [Photo]) VALUES (27, N'Борисова Светлана Евгеньевна', CAST(N'1983-06-15' AS Date), N'Ж', 1, N'ул. Мира, д. 18', N'89161234584', N'8901 234567', N'890123456789', N'890-123-456 89', N'photo18.jpg')
INSERT [dbo].[Personal] ([ID], [FIO], [DateOfBirth], [Pol], [IDJobTittle], [Address], [Telephone], [PassportData], [INN], [SNILS], [Photo]) VALUES (28, N'Григорьев Антон Вячеславович', CAST(N'1990-10-11' AS Date), N'М', 1, N'ул. Ленина, д. 19', N'89161234585', N'9012 345678', N'901234567890', N'901-234-567 90', N'photo19.jpg')
INSERT [dbo].[Personal] ([ID], [FIO], [DateOfBirth], [Pol], [IDJobTittle], [Address], [Telephone], [PassportData], [INN], [SNILS], [Photo]) VALUES (29, N'Романова Алина Дмитриевна', CAST(N'1989-12-27' AS Date), N'Ж', 1, N'ул. Гагарина, д. 20', N'89161234586', N'0123 456789', N'012345678901', N'012-345-678 01', N'photo20.jpg')
SET IDENTITY_INSERT [dbo].[Personal] OFF
GO
SET IDENTITY_INSERT [dbo].[PersonalCabinet] ON 

INSERT [dbo].[PersonalCabinet] ([Id], [Role], [Date], [Zametki], [DeloOne], [DeloTwo], [DeloThree], [DeloFour], [DeloFive], [DeloSix]) VALUES (1, N'admin', CAST(N'2024-06-12' AS Date), N'asd', N'asd', N'asd', N'asd', N'asd', N'asd', N'asd')
INSERT [dbo].[PersonalCabinet] ([Id], [Role], [Date], [Zametki], [DeloOne], [DeloTwo], [DeloThree], [DeloFour], [DeloFive], [DeloSix]) VALUES (2, N'otk', CAST(N'2024-06-16' AS Date), N'tgvetg', N'tgrhgr', N'trh', N'thy', N'thy', N'tr', N'yhu')
INSERT [dbo].[PersonalCabinet] ([Id], [Role], [Date], [Zametki], [DeloOne], [DeloTwo], [DeloThree], [DeloFour], [DeloFive], [DeloSix]) VALUES (3, N'otk', CAST(N'2024-06-21' AS Date), N'456', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[PersonalCabinet] ([Id], [Role], [Date], [Zametki], [DeloOne], [DeloTwo], [DeloThree], [DeloFour], [DeloFive], [DeloSix]) VALUES (4, N'otk', CAST(N'2024-06-13' AS Date), N'2536', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[PersonalCabinet] ([Id], [Role], [Date], [Zametki], [DeloOne], [DeloTwo], [DeloThree], [DeloFour], [DeloFive], [DeloSix]) VALUES (5, N'otk', CAST(N'2024-06-14' AS Date), N'dsgb', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[PersonalCabinet] ([Id], [Role], [Date], [Zametki], [DeloOne], [DeloTwo], [DeloThree], [DeloFour], [DeloFive], [DeloSix]) VALUES (6, N'2', CAST(N'2024-06-30' AS Date), N'ghj', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[PersonalCabinet] ([Id], [Role], [Date], [Zametki], [DeloOne], [DeloTwo], [DeloThree], [DeloFour], [DeloFive], [DeloSix]) VALUES (7, N'admin', CAST(N'2024-06-03' AS Date), N'FRGTTGRT', N'1', N'2', N'2', N'', N'', N'')
INSERT [dbo].[PersonalCabinet] ([Id], [Role], [Date], [Zametki], [DeloOne], [DeloTwo], [DeloThree], [DeloFour], [DeloFive], [DeloSix]) VALUES (8, N'user', CAST(N'2024-06-25' AS Date), N'asd', N'', N'', N'', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[PersonalCabinet] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [Name]) VALUES (1, N'user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (2, N'admin')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (3, N'otk')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Spravochnik] ON 

INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (1, N'Стремин Станислав Юрьевич', 4, 0, N'8-831-512-10-99')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (2, N'Петухова Юлия Сергеевна', 5, 209, N'8-831-512-10-99')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (3, N'Чурашова Марина Рахимовна', 6, 208, N'8-831-512-15-55')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (4, N'Рябов Антон Игоревич', 6, 213, N'8-831-512-16-50')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (5, N'Куликова Наталья Вениаминовна', 7, 203, N'8-831-512-13-33')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (6, N'Перевалов Никита Константинович', 7, 307, N'8-831-512-31-13')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (9, N'Панов Александр Викторович', 1, 22, N'79994123698')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (10, N'Попов Глеб Артёмович', 1, 201, N'89161234567')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (11, N'Волков Александр Владиславович', 1, 202, N'89161234568')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (12, N'Егоров Мирон Даниилович', 1, 203, N'89161234569')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (13, N'Ермолаева Владислава Тимофеевна', 1, 204, N'89161234570')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (14, N'Никольский Тимофей Даниилович', 1, 205, N'89161234571')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (15, N'Максимов Матвей Иванович', 1, 206, N'89161234572')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (16, N'Воробьев Олег Марсельевич', 1, 207, N'89161234573')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (17, N'Лукьянова Ксения Мирославовна', 1, 208, N'89161234574')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (18, N'Жукова София Михайловна', 1, 209, N'89161234575')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (19, N'Одинцова Анна Ивановна', 1, 210, N'89161234576')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (20, N'Киселев Леонид Сергеевич', 1, 211, N'89161234577')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (21, N'Морозова Елена Павловна', 1, 212, N'89161234578')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (22, N'Павлов Артем Юрьевич', 1, 213, N'89161234579')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (23, N'Крылова Ирина Максимовна', 1, 214, N'89161234580')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (24, N'Федорова Марина Андреевна', 1, 215, N'89161234581')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (25, N'Беляев Роман Игоревич', 1, 216, N'89161234582')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (26, N'Тарасов Виктор Петрович', 1, 217, N'89161234583')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (27, N'Борисова Светлана Евгеньевна', 1, 218, N'89161234584')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (28, N'Григорьев Антон Вячеславович', 1, 219, N'89161234585')
INSERT [dbo].[Spravochnik] ([ID], [FIO], [IDJobTittle], [Nkabineta], [Telephone]) VALUES (29, N'Романова Алина Дмитриевна', 1, 220, N'89161234586')
SET IDENTITY_INSERT [dbo].[Spravochnik] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Login], [Password], [IDRole]) VALUES (1, N'admin     ', N'123       ', 2)
INSERT [dbo].[User] ([ID], [Login], [Password], [IDRole]) VALUES (2, N'user      ', N'123       ', 1)
INSERT [dbo].[User] ([ID], [Login], [Password], [IDRole]) VALUES (3, N'otk       ', N'123       ', 3)
INSERT [dbo].[User] ([ID], [Login], [Password], [IDRole]) VALUES (4, N'123       ', N'123       ', 1)
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
