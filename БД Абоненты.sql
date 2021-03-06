USE [master]
GO
/****** Object:  Database [Абоненты]    Script Date: 21.12.2021 12:02:50 ******/
CREATE DATABASE [Абоненты]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Абоненты', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Абоненты.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Абоненты_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Абоненты_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Абоненты] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Абоненты].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Абоненты] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Абоненты] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Абоненты] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Абоненты] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Абоненты] SET ARITHABORT OFF 
GO
ALTER DATABASE [Абоненты] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Абоненты] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Абоненты] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Абоненты] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Абоненты] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Абоненты] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Абоненты] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Абоненты] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Абоненты] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Абоненты] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Абоненты] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Абоненты] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Абоненты] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Абоненты] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Абоненты] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Абоненты] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Абоненты] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Абоненты] SET RECOVERY FULL 
GO
ALTER DATABASE [Абоненты] SET  MULTI_USER 
GO
ALTER DATABASE [Абоненты] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Абоненты] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Абоненты] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Абоненты] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Абоненты] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Абоненты', N'ON'
GO
ALTER DATABASE [Абоненты] SET QUERY_STORE = OFF
GO
USE [Абоненты]
GO
/****** Object:  Table [dbo].[Абонент]    Script Date: 21.12.2021 12:02:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Абонент](
	[Номер_Абонента] [int] NOT NULL,
	[ФИО_Абонента] [nvarchar](50) NOT NULL,
	[Адрес] [nvarchar](50) NOT NULL,
	[Код_телефона] [int] NOT NULL,
 CONSTRAINT [PK_Абонент] PRIMARY KEY CLUSTERED 
(
	[Номер_Абонента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Города]    Script Date: 21.12.2021 12:02:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Города](
	[Код_города] [int] NOT NULL,
	[Название_города] [varchar](50) NULL,
	[Код_тарифа] [int] NULL,
 CONSTRAINT [PK_Города] PRIMARY KEY CLUSTERED 
(
	[Код_города] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Разговоры]    Script Date: 21.12.2021 12:02:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Разговоры](
	[Номер_разговора] [int] NOT NULL,
	[Дата_разговора] [date] NULL,
	[Продолжительность_разговора] [int] NULL,
	[Код_города] [int] NULL,
	[Код_телефона] [int] NULL,
 CONSTRAINT [PK_Разговоры] PRIMARY KEY CLUSTERED 
(
	[Номер_разговора] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тариф_Оплата]    Script Date: 21.12.2021 12:02:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тариф_Оплата](
	[Тариф] [int] NULL,
	[Оплата] [nvarchar](50) NULL,
	[Код_тарифа] [int] NOT NULL,
 CONSTRAINT [PK_Тариф_Оплата] PRIMARY KEY CLUSTERED 
(
	[Код_тарифа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Телефон]    Script Date: 21.12.2021 12:02:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Телефон](
	[Номер_телефона] [nchar](20) NULL,
	[Номер_договора] [nchar](20) NULL,
	[Дата_установки_телефона] [date] NULL,
	[Код_телефона] [int] NOT NULL,
 CONSTRAINT [PK_Телефон] PRIMARY KEY CLUSTERED 
(
	[Код_телефона] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Абонент]  WITH CHECK ADD  CONSTRAINT [FK_Абонент_Телефон] FOREIGN KEY([Код_телефона])
REFERENCES [dbo].[Телефон] ([Код_телефона])
GO
ALTER TABLE [dbo].[Абонент] CHECK CONSTRAINT [FK_Абонент_Телефон]
GO
ALTER TABLE [dbo].[Города]  WITH CHECK ADD  CONSTRAINT [FK_Города_Тариф_Оплата] FOREIGN KEY([Код_тарифа])
REFERENCES [dbo].[Тариф_Оплата] ([Код_тарифа])
GO
ALTER TABLE [dbo].[Города] CHECK CONSTRAINT [FK_Города_Тариф_Оплата]
GO
ALTER TABLE [dbo].[Разговоры]  WITH CHECK ADD  CONSTRAINT [FK_Разговоры_Города] FOREIGN KEY([Код_города])
REFERENCES [dbo].[Города] ([Код_города])
GO
ALTER TABLE [dbo].[Разговоры] CHECK CONSTRAINT [FK_Разговоры_Города]
GO
ALTER TABLE [dbo].[Разговоры]  WITH CHECK ADD  CONSTRAINT [FK_Разговоры_Телефон] FOREIGN KEY([Код_телефона])
REFERENCES [dbo].[Телефон] ([Код_телефона])
GO
ALTER TABLE [dbo].[Разговоры] CHECK CONSTRAINT [FK_Разговоры_Телефон]
GO
USE [master]
GO
ALTER DATABASE [Абоненты] SET  READ_WRITE 
GO
