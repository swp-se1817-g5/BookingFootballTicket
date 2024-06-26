USE [master]
GO
/****** Object:  Database [BookingFootballTicket]    Script Date: 5/29/2024 2:08:35 AM ******/
CREATE DATABASE [BookingFootballTicket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookingFootballTicket', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BookingFootballTicket.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookingFootballTicket_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BookingFootballTicket_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BookingFootballTicket] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookingFootballTicket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookingFootballTicket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookingFootballTicket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookingFootballTicket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookingFootballTicket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookingFootballTicket] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookingFootballTicket] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BookingFootballTicket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookingFootballTicket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookingFootballTicket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookingFootballTicket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookingFootballTicket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookingFootballTicket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookingFootballTicket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookingFootballTicket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookingFootballTicket] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookingFootballTicket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookingFootballTicket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookingFootballTicket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookingFootballTicket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookingFootballTicket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookingFootballTicket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookingFootballTicket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookingFootballTicket] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookingFootballTicket] SET  MULTI_USER 
GO
ALTER DATABASE [BookingFootballTicket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookingFootballTicket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookingFootballTicket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookingFootballTicket] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookingFootballTicket] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookingFootballTicket] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BookingFootballTicket] SET QUERY_STORE = OFF
GO
USE [BookingFootballTicket]
GO
/****** Object:  Table [dbo].[FootballClub]    Script Date: 5/29/2024 2:08:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FootballClub](
	[clubId] [int] IDENTITY(1,1) NOT NULL,
	[clubName] [nvarchar](100) NOT NULL,
	[img] [varchar](255) NULL,
	[createdBy] [varchar](50) NULL,
	[createdDate] [datetime2](7) NULL,
	[updatedBy] [varchar](50) NULL,
	[lastUpdatedDate] [datetime2](7) NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[clubId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryPurchasedTicket]    Script Date: 5/29/2024 2:08:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryPurchasedTicket](
	[ticketId] [int] IDENTITY(1,1) NOT NULL,
	[matchStandId] [int] NULL,
	[qrCode] [varchar](255) NULL,
	[createdDate] [datetime2](7) NULL,
	[price] [decimal](10, 2) NULL,
	[number] [int] NULL,
	[status] [varchar](50) NULL,
	[createdBy] [varchar](50) NULL,
	[updatedBy] [varchar](50) NULL,
	[lastUpdatedDate] [datetime2](7) NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ticketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Match]    Script Date: 5/29/2024 2:08:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Match](
	[matchId] [int] IDENTITY(1,1) NOT NULL,
	[team1] [int] NULL,
	[team2] [int] NULL,
	[seasonId] [int] NULL,
	[time] [datetime2](7) NULL,
	[statusId] [int] NULL,
	[matchTypeId] [int] NULL,
	[createdBy] [varchar](50) NULL,
	[createdDate] [datetime2](7) NULL,
	[updatedBy] [varchar](50) NULL,
	[lastUpdatedDate] [datetime2](7) NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[matchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchStand]    Script Date: 5/29/2024 2:08:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchStand](
	[matchStandId] [int] IDENTITY(1,1) NOT NULL,
	[matchId] [int] NULL,
	[standId] [int] NULL,
	[availability] [int] NULL,
	[createdBy] [varchar](50) NULL,
	[createdDate] [datetime2](7) NULL,
	[updatedBy] [varchar](50) NULL,
	[lastUpdatedDate] [datetime2](7) NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[matchStandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchStatus]    Script Date: 5/29/2024 2:08:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchStatus](
	[statusId] [int] IDENTITY(1,1) NOT NULL,
	[statusName] [nvarchar](50) NOT NULL,
	[createdBy] [varchar](50) NULL,
	[createdDate] [datetime2](7) NULL,
	[updatedBy] [varchar](50) NULL,
	[lastUpdatedDate] [datetime2](7) NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[statusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchType]    Script Date: 5/29/2024 2:08:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchType](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[createdBy] [varchar](50) NULL,
	[createdDate] [datetime2](7) NULL,
	[updatedBy] [varchar](50) NULL,
	[lastUpdatedDate] [datetime2](7) NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 5/29/2024 2:08:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[newsId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[matchId] [int] NULL,
	[title] [varchar](255) NULL,
	[content] [nvarchar](max) NOT NULL,
	[createdBy] [varchar](50) NULL,
	[createdDate] [datetime2](7) NULL,
	[updatedBy] [varchar](50) NULL,
	[lastUpdatedDate] [datetime2](7) NULL,
	[status] [int] NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[newsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 5/29/2024 2:08:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[paymentId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[createdDate] [datetime2](7) NULL,
	[isDeleted] [bit] NULL,
	[ticketId] [int] NULL,
	[price] [decimal](10, 2) NULL,
	[date] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[paymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/29/2024 2:08:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](100) NOT NULL,
	[createdBy] [varchar](50) NULL,
	[createdDate] [datetime2](7) NULL,
	[updatedBy] [varchar](50) NULL,
	[lastUpdatedDate] [datetime2](7) NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Season]    Script Date: 5/29/2024 2:08:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Season](
	[seasonId] [int] IDENTITY(1,1) NOT NULL,
	[seasonName] [nvarchar](50) NOT NULL,
	[startDate] [datetime2](7) NULL,
	[endDate] [datetime2](7) NULL,
	[createdBy] [varchar](50) NULL,
	[createdDate] [datetime2](7) NULL,
	[updatedBy] [varchar](50) NULL,
	[lastUpdatedDate] [datetime2](7) NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[seasonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stand]    Script Date: 5/29/2024 2:08:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stand](
	[standId] [int] IDENTITY(1,1) NOT NULL,
	[standName] [varchar](50) NOT NULL,
	[price] [decimal](10, 2) NULL,
	[quantity] [int] NULL,
	[createdBy] [varchar](50) NULL,
	[createdDate] [datetime2](7) NULL,
	[updatedBy] [varchar](50) NULL,
	[lastUpdatedDate] [datetime2](7) NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[standId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/29/2024 2:08:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[roleId] [int] NULL,
	[userName] [varchar](50) NOT NULL,
	[password] [varchar](255) NULL,
	[email] [varchar](100) NOT NULL,
	[phoneNumber] [varchar](15) NULL,
	[avatar] [varchar](255) NULL,
	[name] [nvarchar](100) NULL,
	[createdBy] [varchar](50) NULL,
	[createdDate] [datetime2](7) NULL,
	[updatedBy] [varchar](50) NULL,
	[lastUpdatedDate] [datetime2](7) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FootballClub] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[FootballClub] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[HistoryPurchasedTicket] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[HistoryPurchasedTicket] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Match] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Match] ADD  DEFAULT (getdate()) FOR [lastUpdatedDate]
GO
ALTER TABLE [dbo].[Match] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[MatchStand] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[MatchStand] ADD  DEFAULT (getdate()) FOR [lastUpdatedDate]
GO
ALTER TABLE [dbo].[MatchStand] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[MatchStatus] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[MatchStatus] ADD  DEFAULT (getdate()) FOR [lastUpdatedDate]
GO
ALTER TABLE [dbo].[MatchStatus] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[MatchType] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[MatchType] ADD  DEFAULT (getdate()) FOR [lastUpdatedDate]
GO
ALTER TABLE [dbo].[MatchType] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[News] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[News] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Payment] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Payment] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Payment] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Role] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Role] ADD  DEFAULT (getdate()) FOR [lastUpdatedDate]
GO
ALTER TABLE [dbo].[Role] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Season] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Season] ADD  DEFAULT (getdate()) FOR [lastUpdatedDate]
GO
ALTER TABLE [dbo].[Season] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Stand] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Stand] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [lastUpdatedDate]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[HistoryPurchasedTicket]  WITH CHECK ADD FOREIGN KEY([matchStandId])
REFERENCES [dbo].[MatchStand] ([matchStandId])
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD FOREIGN KEY([matchTypeId])
REFERENCES [dbo].[MatchType] ([TypeId])
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD FOREIGN KEY([seasonId])
REFERENCES [dbo].[Season] ([seasonId])
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD FOREIGN KEY([statusId])
REFERENCES [dbo].[MatchStatus] ([statusId])
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD FOREIGN KEY([team1])
REFERENCES [dbo].[FootballClub] ([clubId])
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD FOREIGN KEY([team2])
REFERENCES [dbo].[FootballClub] ([clubId])
GO
ALTER TABLE [dbo].[MatchStand]  WITH CHECK ADD FOREIGN KEY([matchId])
REFERENCES [dbo].[Match] ([matchId])
GO
ALTER TABLE [dbo].[MatchStand]  WITH CHECK ADD FOREIGN KEY([standId])
REFERENCES [dbo].[Stand] ([standId])
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD FOREIGN KEY([matchId])
REFERENCES [dbo].[Match] ([matchId])
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([ticketId])
REFERENCES [dbo].[HistoryPurchasedTicket] ([ticketId])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([roleId])
GO
USE [master]
GO
ALTER DATABASE [BookingFootballTicket] SET  READ_WRITE 
GO
