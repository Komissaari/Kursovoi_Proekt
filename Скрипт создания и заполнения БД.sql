USE master
IF EXISTS (SELECT * FROM SYS.DATABASES WHERE  NAME='Library')
     DROP DATABASE Library
CREATE DATABASE Library
IF OBJECT_ID('Authors','u') IS NOT NULL DROP TABLE dbo.Authors
IF OBJECT_ID('Books','u') IS NOT NULL DROP TABLE dbo.Books
IF OBJECT_ID('Publisher','u') IS NOT NULL DROP TABLE dbo.Publisher
IF OBJECT_ID('Readers','u') IS NOT NULL DROP TABLE dbo.Readers
IF OBJECT_ID('Extradition','u') IS NOT NULL DROP TABLE dbo.Extradition

GO
USE Library
CREATE TABLE [dbo].[Authors](
	[ID_Author] [int] NOT NULL,
	[Au_Surname] [varchar](30) NULL,
	[Au_Name] [varchar](12) NULL,
	[Au_Patronymic] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Author] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Books](
	[ID_Publication] [int] NOT NULL,
	[Name_Publication] [varchar](100) NULL,
	[ID_Author] [int] NULL,
	[Сategory] [varchar](20) NULL,
	[ID_Publisher] [int] NULL,
	[Date_Release] [date] NULL,
	[Circulation] [int] NULL,
	[ISBN] [varchar](50) NULL,
	[UDC] [varchar](15) NULL,
	[Location] [varchar](20) NULL,
	[Date_Delivery] [date] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK__Books__D4F61A3B57637471] PRIMARY KEY CLUSTERED 
(
	[ID_Publication] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Publisher](
	[ID_Publisher] [int] NOT NULL,
	[Name_Publisher] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Publisher] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Readers](
	[Reader_Login] [varchar](50) NOT NULL,
	[Surname] [varchar](30) NULL,
	[Name] [varchar](12) NULL,
	[Patronymic] [varchar](15) NULL,
	[Reader_Password] [nchar](20) NULL,
	[ID_Reader] [int] NULL,
	[Admin] [bit] NULL, 
PRIMARY KEY CLUSTERED 
(
	[Reader_Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Extradition](
	[ID_Extradition] [int] IDENTITY(60001, 1) NOT NULL,
	[Reader_Login] [varchar](50) NULL,
	[ID_Publication] [int] NULL,
	[Date_Issue] [date] NULL,
	[Date_Delivery] [date] NULL,
	[Date_Return] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Extradition] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Authors] FOREIGN KEY([ID_Author])
REFERENCES [dbo].[Authors] ([ID_Author])

ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Authors]

ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Publisher] FOREIGN KEY([ID_Publisher])
REFERENCES [dbo].[Publisher] ([ID_Publisher])

ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Publisher]

ALTER TABLE [dbo].[Extradition]  WITH CHECK ADD  CONSTRAINT [FK_Extradition_Books] FOREIGN KEY([ID_Publication])
REFERENCES [dbo].[Books] ([ID_Publication])

ALTER TABLE [dbo].[Extradition] CHECK CONSTRAINT [FK_Extradition_Books]

ALTER TABLE [dbo].[Extradition]  WITH CHECK ADD  CONSTRAINT [FK_Extradition_Readers] FOREIGN KEY([Reader_Login])
REFERENCES [dbo].[Readers] ([Reader_Login])

ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Extradition] CHECK CONSTRAINT [FK_Extradition_Readers]
GO
ALTER TABLE [dbo].[Authors]  WITH CHECK ADD CHECK  (([ID_Author]>(0)))
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [CK__Books__ID_Public__276EDEB3] CHECK  (([ID_Publication]>(0)))
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [CK__Books__ID_Public__276EDEB3]
GO
ALTER TABLE [dbo].[Extradition]  WITH CHECK ADD CHECK  (([ID_Extradition]>(0)))
GO
ALTER TABLE [dbo].[Publisher]  WITH CHECK ADD CHECK  (([ID_Publisher]>(0)))
GO
USE [master]
GO
ALTER DATABASE [Library] SET  READ_WRITE 
GO

USE [master]

ALTER DATABASE [Library] SET  READ_WRITE 

USE Library

INSERT INTO dbo.Authors VALUES(10001, 'Пушкин', 'Александр', 'Сергеевич');   
INSERT INTO dbo.Authors VALUES(10002, 'Чехов', 'Антон', 'Павлович');
INSERT INTO dbo.Authors VALUES(10003, 'Булычёв', 'Кир', '');
INSERT INTO dbo.Authors VALUES(10004, 'Горький', 'Максим', '');
INSERT INTO dbo.Authors VALUES(10005, 'Замятин', 'Евгений', 'Иванович');
INSERT INTO dbo.Authors VALUES(10006, 'Стругацкий', 'Аркадий', 'Натанович');
INSERT INTO dbo.Authors VALUES(10007, 'Стругацкий', 'Борис', 'Натанович');
INSERT INTO dbo.Authors VALUES(10008, 'Маяковский', 'Владимир', 'Владимирович');
INSERT INTO dbo.Authors VALUES(10009, 'Ленин', 'Владимир', 'Ильич');
INSERT INTO dbo.Authors VALUES(10010, 'Достоевский', 'Фёдор', 'Михайлович');
INSERT INTO dbo.Authors VALUES(10011, 'Бетлиевский', 'Никита', '');

INSERT INTO dbo.Readers VALUES('marchenko01', 'Марченко', 'Александр', 'Порфирьевич',  'ej5rFst19I+4l+/zrnMvMVT20gO1PzNmDwG0w7a8Lfk=', 20001, '');
INSERT INTO dbo.Readers VALUES('elkin02', 'Елькин', 'Соломон', 'Яковлевич',  'qVPwmhtrZyW4GVbprQsetJ461AAEwEMH74r2JGoFQRY=', 20002,'True');
INSERT INTO dbo.Readers VALUES('vorovski03', 'Воровский', 'Вацлав', 'Вацлавович',  '03', 20003, '');
INSERT INTO dbo.Readers VALUES('cviling04', 'Цвиллинг', 'Самуил', 'Моисеевич', '04', 20004, '');
INSERT INTO dbo.Readers VALUES('shors05', 'Щорс', 'Николай', 'Александрович',  '05', 20005, '');
INSERT INTO dbo.Readers VALUES('kashirin05', 'Каширин', 'Иван', 'Дмитриевич', '06', 20006, '');
INSERT INTO dbo.Readers VALUES('zinovev06', 'Зиновьев', 'Георгий', 'Васильевич',  '07', 20007, '');
INSERT INTO dbo.Readers VALUES('frunze07', 'Фрунзе', 'Михаил', 'Васильевич',  '08', 20008, '');
INSERT INTO dbo.Readers VALUES('tuchacevki09', 'Тухачевский', 'Михаил', 'Николаевич',  '09', 2000, '');
INSERT INTO dbo.Readers VALUES('samoilo10', 'Самойло', 'Александр', 'Александрович',  '10', 20010, '');

INSERT INTO dbo.Publisher VALUES(30001, 'Энергия');
INSERT INTO dbo.Publisher VALUES(30002, 'Юность');
INSERT INTO dbo.Publisher VALUES(30003, 'Пионерия');
INSERT INTO dbo.Publisher VALUES(30004, 'Молодёжное издательство');
INSERT INTO dbo.Publisher VALUES(30005, 'Современная классика');
INSERT INTO dbo.Publisher VALUES(30006, 'Года');
INSERT INTO dbo.Publisher VALUES(30007, 'Дрофа');
INSERT INTO dbo.Publisher VALUES(30008, 'Сепуха');
INSERT INTO dbo.Publisher VALUES(30009, 'Деревенский запрос');
INSERT INTO dbo.Publisher VALUES(30010, 'Осьминог');
INSERT INTO dbo.Publisher VALUES(30011, 'Дон Кихот');
INSERT INTO dbo.Publisher VALUES(30012, 'Ватрушка');
INSERT INTO dbo.Publisher VALUES(30013, 'Молодость');
INSERT INTO dbo.Publisher VALUES(30014, 'Старьёвщик');
INSERT INTO dbo.Publisher VALUES(30015, 'Хрестоматия');
INSERT INTO dbo.Publisher VALUES(30016, 'Монолит');

INSERT INTO dbo.Books VALUES(40001, 'Евгений Онегин', 10001, 'Роман', 30008, '1934-3-21', 100000,
'978-5-4335-0275-8', '821.161.1', 'с.3, р. 2, п. 1', '1970-08-19', '');
INSERT INTO dbo.Books VALUES(40002, 'Капитанская дочка', 10001, 'Роман', 30007, '1985-06-19', 15000, '978-5-04-112699-5', '821.486.2',
'с.3 р.2 п.3', '1990-07-03', '');
INSERT INTO dbo.Books VALUES(40003, 'Золотая рыбка', 10001, 'Сказка', 30002, '1979-03-02', 1000, '978-5-907076-09-9', '826.437.0',
'с.3 р.2 п.4', '2005-09-05', '');
INSERT INTO dbo.Books VALUES(40004, 'Вишнёвый сад', 10002, 'Пьеса', 30012, '1981-03-11', 150000, '978-5-17-097313-2', '82',
'с.3 р.15 п.25', '2003-06-13', '');
INSERT INTO dbo.Books VALUES(40005, 'Безотцовщина', 10002, 'Пьеса', 30014, '1981-03-11', 150000, '978-5-17-097313-2', '82',
'с.3 р.15 п.25', '2003-06-13', '');
INSERT INTO dbo.Books VALUES(40006, 'Чайка', 10002, 'Пьеса', 30002, '2002-03-21', 10000, '978-5-17-513012-4', '82',
'с.3 р.16 п.23', '2003-12-20', '');
INSERT INTO dbo.Books VALUES(40007, 'Путешествие Алисы', 10003, 'Повесть', 30005, '1998-02-28', 1500, '978-5-17-094665-4', '82',
'с.19 р.1 п.25', '2000-09-01', '');
INSERT INTO dbo.Books VALUES(40008, 'Девочка с Земли', 10003, 'Повесть', 30006, '1999-07-03', 10000, '978-5-17-094665-4', '82',
'с.19 р.2 п.1', '2002-06-11', '');
--INSERT INTO dbo.Books VALUES(40009, 'Козлик Иван Иванович', 10003, 'Повесть', 30004, '06-04-1999', 15000, '978-5-17-094665-4', '82',
--'с.19 р.3 п.3', '2001-13-30', '');
INSERT INTO dbo.Books VALUES(40010, 'Город без памяти', 10003, 'Повесть', 30003, '1998-01-31', 100000, '978-5-17-094665-4', '82',
'с.19 р.2 п.12', '2000-10-16', '');
INSERT INTO dbo.Books VALUES(40020, 'Аргонианская дева', 10011, 'Повесть', 30016, '2012-06-06', 1000, '978-5-17-094665-4', '82',
'с.10 р.8 п. 16', '2015-07-22', '');

GO