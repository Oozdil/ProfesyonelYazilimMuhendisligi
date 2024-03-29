USE [master]
GO
/****** Object:  Database [LocallyDB]    Script Date: 14.12.2019 10:59:24 ******/
CREATE DATABASE [LocallyDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LocallyDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\LocallyDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LocallyDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\LocallyDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LocallyDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LocallyDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LocallyDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LocallyDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LocallyDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LocallyDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LocallyDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LocallyDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LocallyDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LocallyDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LocallyDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LocallyDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LocallyDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LocallyDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LocallyDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LocallyDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LocallyDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LocallyDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LocallyDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LocallyDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LocallyDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LocallyDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LocallyDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LocallyDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LocallyDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LocallyDB] SET  MULTI_USER 
GO
ALTER DATABASE [LocallyDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LocallyDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LocallyDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LocallyDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [LocallyDB]
GO
/****** Object:  Table [dbo].[AboutContentTable]    Script Date: 14.12.2019 10:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AboutContentTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AboutContent] [nvarchar](250) NULL,
 CONSTRAINT [PK_AboutContentTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentsTable]    Script Date: 14.12.2019 10:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentsTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PlaceID] [nvarchar](50) NULL,
	[AuthorID] [int] NULL,
	[Comment] [text] NULL,
	[DateOfCreate] [datetime] NULL,
	[Active] [tinyint] NULL,
 CONSTRAINT [PK_CommentsTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactMessagesTable]    Script Date: 14.12.2019 10:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactMessagesTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FromEmail] [nvarchar](250) NOT NULL,
	[Subject] [nvarchar](250) NOT NULL,
	[Message] [text] NOT NULL,
	[IsRead] [tinyint] NOT NULL,
	[DateOfCreate] [datetime] NOT NULL,
 CONSTRAINT [PK_ContactMessagesTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImagesTable]    Script Date: 14.12.2019 10:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImagesTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ImageUrl] [nvarchar](250) NULL,
	[AuthorID] [int] NULL,
	[PlaceID] [nvarchar](250) NULL,
	[DateOfCreate] [datetime] NULL,
	[Active] [tinyint] NULL,
 CONSTRAINT [PK_ImagesTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LikesTable]    Script Date: 14.12.2019 10:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LikesTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PlaceID] [nvarchar](250) NULL,
	[AuthorID] [int] NULL,
	[PlaceLike] [int] NULL,
	[DateOfCreate] [datetime] NULL,
 CONSTRAINT [PK_LikesTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageVisitsTable]    Script Date: 14.12.2019 10:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageVisitsTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PlaceID] [nvarchar](250) NULL,
	[AuthorID] [int] NULL,
	[LastVisitDate] [datetime] NULL,
 CONSTRAINT [PK_PageVisitsTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlidersTable]    Script Date: 14.12.2019 10:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlidersTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ImgSrc] [nvarchar](250) NULL,
	[Title] [nvarchar](250) NULL,
	[SliderContent] [nvarchar](250) NULL,
 CONSTRAINT [PK_SlidersTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeammembersTable]    Script Date: 14.12.2019 10:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeammembersTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](250) NULL,
	[ImgSrc] [nvarchar](250) NULL,
 CONSTRAINT [PK_TeammembersTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersTable]    Script Date: 14.12.2019 10:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersTable](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Surname] [nvarchar](250) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Password] [nvarchar](250) NOT NULL,
	[DateOfCreate] [datetime] NOT NULL,
	[IsAdmin] [tinyint] NOT NULL,
	[IsActive] [tinyint] NOT NULL,
 CONSTRAINT [PK_UsersTable] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CommentsTable] ADD  CONSTRAINT [DF_CommentsTable_DateOfCreate]  DEFAULT (getdate()) FOR [DateOfCreate]
GO
ALTER TABLE [dbo].[CommentsTable] ADD  CONSTRAINT [DF_CommentsTable_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[ContactMessagesTable] ADD  CONSTRAINT [DF_ContactMessagesTable_DateOfCreate]  DEFAULT (getdate()) FOR [DateOfCreate]
GO
ALTER TABLE [dbo].[ImagesTable] ADD  CONSTRAINT [DF_ImagesTable_DateOfCreate]  DEFAULT (getdate()) FOR [DateOfCreate]
GO
ALTER TABLE [dbo].[ImagesTable] ADD  CONSTRAINT [DF_ImagesTable_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[LikesTable] ADD  CONSTRAINT [DF_LikesTable_Like]  DEFAULT ((0)) FOR [PlaceLike]
GO
ALTER TABLE [dbo].[LikesTable] ADD  CONSTRAINT [DF_LikesTable_DateOfCreate]  DEFAULT (getdate()) FOR [DateOfCreate]
GO
ALTER TABLE [dbo].[PageVisitsTable] ADD  CONSTRAINT [DF_PageVisitsTable_LastVisitDate]  DEFAULT (getdate()) FOR [LastVisitDate]
GO
ALTER TABLE [dbo].[UsersTable] ADD  CONSTRAINT [DF_UsersTable_DateOdCreate]  DEFAULT (getdate()) FOR [DateOfCreate]
GO
ALTER TABLE [dbo].[UsersTable] ADD  CONSTRAINT [DF_UsersTable_IsAdmin]  DEFAULT ((0)) FOR [IsAdmin]
GO
ALTER TABLE [dbo].[UsersTable] ADD  CONSTRAINT [DF_UsersTable_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  StoredProcedure [dbo].[PageVisit]    Script Date: 14.12.2019 10:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE  [dbo].[PageVisit]
(	
	@authorid int, @placeid nvarchar(250)
)

AS
BEGIN
	Declare @isVisited int
	
	Set @isVisited=(Select Count(ID) from PageVisitsTable WHERE PlaceID=@placeid AND AuthorID=@authorid)
	IF @isVisited=0

	BEGIN
	INSERT INTO PageVisitsTable  (PlaceID,AuthorID) Values (@placeid,@authorid)
	END
	ELSE
	BEGIN
	UPDATE PageVisitsTable  SET LastVisitDate=getDate() WHERE PlaceID=@placeid AND AuthorID =@authorid
	END

	 

	 SELECT COUNT(ID) as PlaceVisitCount FROM PageVisitsTable WHERE PlaceID=@placeid 
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'getDate()' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PageVisitsTable', @level2type=N'COLUMN',@level2name=N'LastVisitDate'
GO
USE [master]
GO
ALTER DATABASE [LocallyDB] SET  READ_WRITE 
GO
