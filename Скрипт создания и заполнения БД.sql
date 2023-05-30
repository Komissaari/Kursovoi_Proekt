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
	[�ategory] [varchar](20) NULL,
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

INSERT INTO dbo.Authors VALUES(10001, '������', '���������', '���������');   
INSERT INTO dbo.Authors VALUES(10002, '�����', '�����', '��������');
INSERT INTO dbo.Authors VALUES(10003, '�������', '���', '');
INSERT INTO dbo.Authors VALUES(10004, '�������', '������', '');
INSERT INTO dbo.Authors VALUES(10005, '�������', '�������', '��������');
INSERT INTO dbo.Authors VALUES(10006, '����������', '�������', '���������');
INSERT INTO dbo.Authors VALUES(10007, '����������', '�����', '���������');
INSERT INTO dbo.Authors VALUES(10008, '����������', '��������', '������������');
INSERT INTO dbo.Authors VALUES(10009, '�����', '��������', '�����');
INSERT INTO dbo.Authors VALUES(10010, '�����������', 'Ը���', '����������');
INSERT INTO dbo.Authors VALUES(10011, '�����������', '������', '');

INSERT INTO dbo.Readers VALUES('marchenko01', '��������', '���������', '�����������',  'ej5rFst19I+4l+/zrnMvMVT20gO1PzNmDwG0w7a8Lfk=', 20001, '');
INSERT INTO dbo.Readers VALUES('elkin02', '������', '�������', '���������',  'qVPwmhtrZyW4GVbprQsetJ461AAEwEMH74r2JGoFQRY=', 20002,'True');
INSERT INTO dbo.Readers VALUES('vorovski03', '���������', '������', '����������',  '03', 20003, '');
INSERT INTO dbo.Readers VALUES('cviling04', '��������', '������', '���������', '04', 20004, '');
INSERT INTO dbo.Readers VALUES('shors05', '����', '�������', '�������������',  '05', 20005, '');
INSERT INTO dbo.Readers VALUES('kashirin05', '�������', '����', '����������', '06', 20006, '');
INSERT INTO dbo.Readers VALUES('zinovev06', '��������', '�������', '����������',  '07', 20007, '');
INSERT INTO dbo.Readers VALUES('frunze07', '������', '������', '����������',  '08', 20008, '');
INSERT INTO dbo.Readers VALUES('tuchacevki09', '�����������', '������', '����������',  '09', 2000, '');
INSERT INTO dbo.Readers VALUES('samoilo10', '�������', '���������', '�������������',  '10', 20010, '');

INSERT INTO dbo.Publisher VALUES(30001, '�������');
INSERT INTO dbo.Publisher VALUES(30002, '������');
INSERT INTO dbo.Publisher VALUES(30003, '��������');
INSERT INTO dbo.Publisher VALUES(30004, '��������� ������������');
INSERT INTO dbo.Publisher VALUES(30005, '����������� ��������');
INSERT INTO dbo.Publisher VALUES(30006, '����');
INSERT INTO dbo.Publisher VALUES(30007, '�����');
INSERT INTO dbo.Publisher VALUES(30008, '������');
INSERT INTO dbo.Publisher VALUES(30009, '����������� ������');
INSERT INTO dbo.Publisher VALUES(30010, '��������');
INSERT INTO dbo.Publisher VALUES(30011, '��� �����');
INSERT INTO dbo.Publisher VALUES(30012, '��������');
INSERT INTO dbo.Publisher VALUES(30013, '���������');
INSERT INTO dbo.Publisher VALUES(30014, '����������');
INSERT INTO dbo.Publisher VALUES(30015, '�����������');
INSERT INTO dbo.Publisher VALUES(30016, '�������');

INSERT INTO dbo.Books VALUES(40001, '������� ������', 10001, '�����', 30008, '1934-3-21', 100000,
'978-5-4335-0275-8', '821.161.1', '�.3, �. 2, �. 1', '1970-08-19', '');
INSERT INTO dbo.Books VALUES(40002, '����������� �����', 10001, '�����', 30007, '1985-06-19', 15000, '978-5-04-112699-5', '821.486.2',
'�.3 �.2 �.3', '1990-07-03', '');
INSERT INTO dbo.Books VALUES(40003, '������� �����', 10001, '������', 30002, '1979-03-02', 1000, '978-5-907076-09-9', '826.437.0',
'�.3 �.2 �.4', '2005-09-05', '');
INSERT INTO dbo.Books VALUES(40004, '������� ���', 10002, '�����', 30012, '1981-03-11', 150000, '978-5-17-097313-2', '82',
'�.3 �.15 �.25', '2003-06-13', '');
INSERT INTO dbo.Books VALUES(40005, '������������', 10002, '�����', 30014, '1981-03-11', 150000, '978-5-17-097313-2', '82',
'�.3 �.15 �.25', '2003-06-13', '');
INSERT INTO dbo.Books VALUES(40006, '�����', 10002, '�����', 30002, '2002-03-21', 10000, '978-5-17-513012-4', '82',
'�.3 �.16 �.23', '2003-12-20', '');
INSERT INTO dbo.Books VALUES(40007, '����������� �����', 10003, '�������', 30005, '1998-02-28', 1500, '978-5-17-094665-4', '82',
'�.19 �.1 �.25', '2000-09-01', '');
INSERT INTO dbo.Books VALUES(40008, '������� � �����', 10003, '�������', 30006, '1999-07-03', 10000, '978-5-17-094665-4', '82',
'�.19 �.2 �.1', '2002-06-11', '');
--INSERT INTO dbo.Books VALUES(40009, '������ ���� ��������', 10003, '�������', 30004, '06-04-1999', 15000, '978-5-17-094665-4', '82',
--'�.19 �.3 �.3', '2001-13-30', '');
INSERT INTO dbo.Books VALUES(40010, '����� ��� ������', 10003, '�������', 30003, '1998-01-31', 100000, '978-5-17-094665-4', '82',
'�.19 �.2 �.12', '2000-10-16', '');
INSERT INTO dbo.Books VALUES(40020, '������������ ����', 10011, '�������', 30016, '2012-06-06', 1000, '978-5-17-094665-4', '82',
'�.10 �.8 �. 16', '2015-07-22', '');

GO