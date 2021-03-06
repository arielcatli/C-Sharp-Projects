USE [master]
GO
/****** Object:  Database [TicketingSystem]    Script Date: 3/25/2017 8:49:58 AM ******/
CREATE DATABASE [TicketingSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ticketing System', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Ticketing System.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Ticketing System_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Ticketing System_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TicketingSystem] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TicketingSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TicketingSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TicketingSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TicketingSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TicketingSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TicketingSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [TicketingSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TicketingSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TicketingSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TicketingSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TicketingSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TicketingSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TicketingSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TicketingSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TicketingSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TicketingSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TicketingSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TicketingSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TicketingSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TicketingSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TicketingSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TicketingSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TicketingSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TicketingSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [TicketingSystem] SET  MULTI_USER 
GO
ALTER DATABASE [TicketingSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TicketingSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TicketingSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TicketingSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TicketingSystem] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TicketingSystem]
GO
/****** Object:  User [catli_admin]    Script Date: 3/25/2017 8:49:59 AM ******/
CREATE USER [catli_admin] FOR LOGIN [administrator_catli] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [admin_catli]    Script Date: 3/25/2017 8:49:59 AM ******/
CREATE USER [admin_catli] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [admin]    Script Date: 3/25/2017 8:49:59 AM ******/
CREATE USER [admin] FOR LOGIN [administrator] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Requester]    Script Date: 3/25/2017 8:49:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requester](
	[RequestorID] [int] IDENTITY(1,1) NOT NULL,
	[ticketCode] [int] NULL,
 CONSTRAINT [PK_Requester] PRIMARY KEY CLUSTERED 
(
	[RequestorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 3/25/2017 8:49:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[ticketCode] [nchar](10) NOT NULL,
	[RequestorID] [int] NOT NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[ticketCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserAccounts]    Script Date: 3/25/2017 8:49:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccounts](
	[userID] [int] IDENTITY(1000,1) NOT NULL,
	[username] [nchar](50) NOT NULL,
	[password] [nchar](50) NOT NULL,
 CONSTRAINT [PK_UserAccounts] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Workers]    Script Date: 3/25/2017 8:49:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workers](
	[userID] [int] NOT NULL,
	[firstname] [nchar](50) NOT NULL,
	[lastname] [nchar](50) NOT NULL,
	[department] [nchar](10) NULL,
	[contactNumber] [int] NULL,
	[gender] [nchar](1) NULL,
	[workerType] [nchar](10) NOT NULL
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [TicketingSystem] SET  READ_WRITE 
GO
