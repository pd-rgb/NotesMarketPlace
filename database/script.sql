USE [master]
GO
/****** Object:  Database [NotesMarketplace]    Script Date: 11-04-2021 11:29:47 ******/
CREATE DATABASE [NotesMarketplace]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NotesMarketplace', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER01\MSSQL\DATA\NotesMarketplace.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NotesMarketplace_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER01\MSSQL\DATA\NotesMarketplace_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [NotesMarketplace] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NotesMarketplace].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NotesMarketplace] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NotesMarketplace] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NotesMarketplace] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NotesMarketplace] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NotesMarketplace] SET ARITHABORT OFF 
GO
ALTER DATABASE [NotesMarketplace] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NotesMarketplace] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NotesMarketplace] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NotesMarketplace] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NotesMarketplace] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NotesMarketplace] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NotesMarketplace] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NotesMarketplace] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NotesMarketplace] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NotesMarketplace] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NotesMarketplace] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NotesMarketplace] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NotesMarketplace] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NotesMarketplace] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NotesMarketplace] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NotesMarketplace] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NotesMarketplace] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NotesMarketplace] SET RECOVERY FULL 
GO
ALTER DATABASE [NotesMarketplace] SET  MULTI_USER 
GO
ALTER DATABASE [NotesMarketplace] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NotesMarketplace] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NotesMarketplace] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NotesMarketplace] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NotesMarketplace] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NotesMarketplace', N'ON'
GO
ALTER DATABASE [NotesMarketplace] SET QUERY_STORE = OFF
GO
USE [NotesMarketplace]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 11-04-2021 11:29:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[CountryCode] [varchar](100) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Downloads]    Script Date: 11-04-2021 11:29:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Downloads](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NoteID] [int] NOT NULL,
	[Seller] [int] NOT NULL,
	[Downloader] [int] NOT NULL,
	[IsSellerHasAllowedDownload] [bit] NOT NULL,
	[AttachmentPath] [varchar](max) NULL,
	[IsAttachmentDownloaded] [bit] NOT NULL,
	[AttachmentDownloadedDate] [datetime] NULL,
	[IsPaid] [bit] NOT NULL,
	[PurchasedPrice] [decimal](18, 0) NULL,
	[NoteTitle] [varchar](100) NOT NULL,
	[NoteCategory] [varchar](100) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NoteCategories]    Script Date: 11-04-2021 11:29:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoteCategories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NoteTypes]    Script Date: 11-04-2021 11:29:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoteTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReferenceData]    Script Date: 11-04-2021 11:29:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReferenceData](
	[ID] [int] NOT NULL,
	[Value] [varchar](100) NOT NULL,
	[DataValue] [varchar](100) NOT NULL,
	[RefCategory] [varchar](100) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellerNotes]    Script Date: 11-04-2021 11:29:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellerNotes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SellerID] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[ActionedBy] [int] NULL,
	[AdminRemarks] [varchar](max) NULL,
	[PublishedDate] [datetime] NULL,
	[Title] [varchar](100) NOT NULL,
	[Category] [int] NOT NULL,
	[DisplayPicture] [varchar](500) NULL,
	[NoteType] [int] NULL,
	[NumberofPages] [int] NULL,
	[Description] [varchar](max) NOT NULL,
	[UniversityName] [varchar](200) NULL,
	[Country] [int] NULL,
	[Course] [varchar](100) NULL,
	[CourseCode] [varchar](100) NULL,
	[Professor] [varchar](100) NULL,
	[IsPaid] [bit] NOT NULL,
	[SellingPrice] [decimal](18, 0) NULL,
	[NotesPreview] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellerNotesAttachements]    Script Date: 11-04-2021 11:29:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellerNotesAttachements](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NoteID] [int] NOT NULL,
	[FileName] [varchar](100) NOT NULL,
	[FilePath] [varchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellerNotesReportedIssues]    Script Date: 11-04-2021 11:29:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellerNotesReportedIssues](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NoteID] [int] NOT NULL,
	[ReportedByID] [int] NOT NULL,
	[AgainstDownloadID] [int] NOT NULL,
	[Remarks] [varchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellerNotesReviews]    Script Date: 11-04-2021 11:29:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellerNotesReviews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NoteID] [int] NOT NULL,
	[ReviewedByID] [int] NOT NULL,
	[AgainstDownloadsID] [int] NOT NULL,
	[Ratings] [decimal](18, 0) NOT NULL,
	[Comments] [varchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemConfigurations]    Script Date: 11-04-2021 11:29:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemConfigurations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Value] [varchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 11-04-2021 11:29:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[DOB] [datetime] NULL,
	[Gender] [int] NULL,
	[SecondaryEmailAddress] [varchar](100) NULL,
	[PhoneNumberCountryCode] [varchar](5) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[ProfilePicture] [varchar](500) NULL,
	[AddressLine1] [varchar](100) NOT NULL,
	[AddressLine2] [varchar](100) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[ZipCode] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[University] [varchar](100) NULL,
	[College] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11-04-2021 11:29:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](24) NOT NULL,
	[IsEmailVerified] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersRole]    Script Date: 11-04-2021 11:29:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersRole](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([ID], [Name], [CountryCode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1, N'India', N'+91', CAST(N'2021-02-27T00:00:00.000' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[Countries] ([ID], [Name], [CountryCode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (2, N'Brazil', N'+55', CAST(N'2021-02-27T00:00:00.000' AS DateTime), 1, CAST(N'2021-04-04T23:55:58.473' AS DateTime), 1024, 1)
INSERT [dbo].[Countries] ([ID], [Name], [CountryCode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, N'Iran ', N'+98', CAST(N'2021-02-27T00:00:00.000' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[Countries] ([ID], [Name], [CountryCode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (4, N'Nepal', N'+977', CAST(N'2021-04-04T23:57:45.930' AS DateTime), 1024, CAST(N'2021-04-04T23:57:53.300' AS DateTime), 1024, 0)
INSERT [dbo].[Countries] ([ID], [Name], [CountryCode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (5, N'USA', N'+1', CAST(N'2021-04-09T11:25:31.287' AS DateTime), 2, CAST(N'2021-04-09T11:25:35.980' AS DateTime), 2, 0)
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[Downloads] ON 

INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (36, 35, 1007, 3, 1, N'~/Members/1007/35/Attachements/', 1, CAST(N'2021-03-23T00:00:00.000' AS DateTime), 1, CAST(199 AS Decimal(18, 0)), N'Indian Constitution', N'Computer Science', CAST(N'2021-03-06T14:44:08.417' AS DateTime), 3, CAST(N'2021-03-07T19:27:49.903' AS DateTime), 1007)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (37, 31, 1007, 3, 1, N'~/Members/1007/31/Attachements/', 1, CAST(N'2021-03-24T17:18:43.497' AS DateTime), 1, CAST(88 AS Decimal(18, 0)), N'Java', N'Computer Science', CAST(N'2021-03-06T14:48:49.287' AS DateTime), 3, CAST(N'2021-03-24T17:18:43.497' AS DateTime), 3)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (40, 36, 1007, 1008, 0, NULL, 0, NULL, 1, CAST(251 AS Decimal(18, 0)), N'HTML', N'Computer Science', CAST(N'2021-03-06T15:00:20.757' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (42, 38, 3, 1007, 1, N'~/Members/3/38/Attachements/', 1, CAST(N'2021-03-25T10:20:17.787' AS DateTime), 1, CAST(25 AS Decimal(18, 0)), N'CSS', N'Computer Science', CAST(N'2021-03-07T15:45:25.997' AS DateTime), 1007, CAST(N'2021-03-25T10:20:17.787' AS DateTime), 1007)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (43, 35, 1007, 3, 0, NULL, 0, NULL, 1, CAST(199 AS Decimal(18, 0)), N'Indian Constitution', N'Computer Science', CAST(N'2021-03-07T18:31:41.657' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (58, 38, 3, 1008, 1, N'~/Members/3/38/Attachements/', 1, CAST(N'2021-03-20T00:00:00.000' AS DateTime), 1, CAST(25 AS Decimal(18, 0)), N'CSS', N'Computer Science', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 1008, CAST(N'2021-03-07T00:00:00.000' AS DateTime), 1008)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (59, 36, 1007, 3, 1, N'~/Members/1007/36/Attachements/', 1, CAST(N'2021-03-16T14:48:48.673' AS DateTime), 1, CAST(251 AS Decimal(18, 0)), N'HTML', N'Computer Science', CAST(N'2021-03-16T14:36:01.663' AS DateTime), 3, CAST(N'2021-03-16T14:48:48.673' AS DateTime), 3)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1037, 31, 1007, 1009, 1, N'~/Members/1007/31/Attachements/', 1, CAST(N'2021-04-06T14:35:36.700' AS DateTime), 1, CAST(88 AS Decimal(18, 0)), N'Java', N'Computer Science', CAST(N'2021-03-24T17:27:31.703' AS DateTime), 1009, CAST(N'2021-04-06T14:35:36.700' AS DateTime), 1009)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1038, 35, 1007, 1009, 0, NULL, 0, NULL, 1, CAST(199 AS Decimal(18, 0)), N'Indian Constitution', N'Computer Science', CAST(N'2021-03-24T17:29:12.887' AS DateTime), 1009, NULL, NULL)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1039, 36, 1007, 1009, 0, NULL, 0, NULL, 1, CAST(251 AS Decimal(18, 0)), N'HTML', N'Computer Science', CAST(N'2021-03-24T17:29:27.887' AS DateTime), 1009, NULL, NULL)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1040, 38, 3, 1009, 0, NULL, 0, NULL, 1, CAST(25 AS Decimal(18, 0)), N'CSS', N'Computer Science', CAST(N'2021-03-24T17:29:40.140' AS DateTime), 1009, NULL, NULL)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1041, 37, 1007, 1009, 1, N'~/Members/1007/37/Attachements/', 1, CAST(N'2021-04-06T14:38:12.917' AS DateTime), 0, CAST(0 AS Decimal(18, 0)), N'CSS', N'History', CAST(N'2021-03-24T17:29:52.353' AS DateTime), 1009, CAST(N'2021-04-06T14:38:12.917' AS DateTime), 1009)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1042, 31, 1007, 1008, 1, N'~/Members/1007/31/Attachements/', 1, CAST(N'2021-04-05T00:00:00.000' AS DateTime), 1, CAST(88 AS Decimal(18, 0)), N'Java', N'Computer Science', CAST(N'2021-03-24T17:30:21.357' AS DateTime), 1008, CAST(N'2021-03-24T18:45:40.243' AS DateTime), 1007)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1043, 35, 1007, 1008, 1, N'~/Members/1007/35/Attachements/', 1, CAST(N'2021-04-05T00:00:00.000' AS DateTime), 1, CAST(199 AS Decimal(18, 0)), N'Indian Constitution', N'Computer Science', CAST(N'2021-03-24T17:30:35.863' AS DateTime), 1008, CAST(N'2021-03-24T18:45:39.010' AS DateTime), 1007)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1044, 37, 1007, 1008, 1, N'~/Members/1007/37/Attachements/', 1, CAST(N'2021-04-05T00:00:00.000' AS DateTime), 0, CAST(0 AS Decimal(18, 0)), N'CSS', N'History', CAST(N'2021-03-24T17:31:04.407' AS DateTime), 1008, CAST(N'2021-03-24T18:45:37.027' AS DateTime), 1007)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1046, 39, 3, 1007, 0, NULL, 0, NULL, 1, CAST(51 AS Decimal(18, 0)), N'ios', N'Computer Science', CAST(N'2021-03-26T13:53:39.893' AS DateTime), 1007, NULL, NULL)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1069, 37, 1007, 1036, 1, N'~/Members/1007/37/Attachements/', 1, CAST(N'2021-04-09T08:49:46.603' AS DateTime), 0, CAST(0 AS Decimal(18, 0)), N'CSS', N'History', CAST(N'2021-04-09T08:49:46.607' AS DateTime), 1036, NULL, NULL)
INSERT [dbo].[Downloads] ([ID], [NoteID], [Seller], [Downloader], [IsSellerHasAllowedDownload], [AttachmentPath], [IsAttachmentDownloaded], [AttachmentDownloadedDate], [IsPaid], [PurchasedPrice], [NoteTitle], [NoteCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1070, 35, 1007, 1036, 1, N'~/Members/1007/35/Attachements/', 1, CAST(N'2021-04-09T09:44:13.077' AS DateTime), 1, CAST(199 AS Decimal(18, 0)), N'Indian Constitution', N'Computer Science', CAST(N'2021-04-09T08:51:10.247' AS DateTime), 1036, CAST(N'2021-04-09T09:47:53.793' AS DateTime), 1036)
SET IDENTITY_INSERT [dbo].[Downloads] OFF
GO
SET IDENTITY_INSERT [dbo].[NoteCategories] ON 

INSERT [dbo].[NoteCategories] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1, N'Computer Science', N'Computer Science', CAST(N'2021-02-27T00:00:00.000' AS DateTime), 2, NULL, NULL, 1)
INSERT [dbo].[NoteCategories] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (2, N'History', N'History', CAST(N'2021-02-27T00:00:00.000' AS DateTime), 2, NULL, NULL, 1)
INSERT [dbo].[NoteCategories] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, N'Maths', N'Maths From Beggining', CAST(N'2021-03-29T22:00:33.773' AS DateTime), 2, CAST(N'2021-03-29T22:03:13.657' AS DateTime), 2, 1)
INSERT [dbo].[NoteCategories] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (4, N'IT', N'Information Technology', CAST(N'2021-04-04T19:42:53.023' AS DateTime), 1024, NULL, NULL, 1)
INSERT [dbo].[NoteCategories] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (5, N'Story Book', N'Story Book', CAST(N'2021-04-04T19:43:10.243' AS DateTime), 1024, CAST(N'2021-04-07T15:36:03.473' AS DateTime), 1024, 0)
INSERT [dbo].[NoteCategories] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (6, N'MBA', N'MBA', CAST(N'2021-04-04T21:01:00.433' AS DateTime), 1024, CAST(N'2021-04-04T21:05:35.913' AS DateTime), 1024, 0)
INSERT [dbo].[NoteCategories] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (7, N'CA', N'CA Notes', CAST(N'2021-04-04T21:05:30.087' AS DateTime), 1024, CAST(N'2021-04-07T15:36:33.290' AS DateTime), 1024, 0)
INSERT [dbo].[NoteCategories] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (9, N'Science', N'Science notes', CAST(N'2021-04-09T11:23:30.970' AS DateTime), 2, CAST(N'2021-04-09T11:23:46.633' AS DateTime), 2, 0)
SET IDENTITY_INSERT [dbo].[NoteCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[NoteTypes] ON 

INSERT [dbo].[NoteTypes] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1, N'Handwritten Notes', N'Handwritten Notes', CAST(N'2021-02-27T00:00:00.000' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[NoteTypes] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (2, N'University Notes', N'University Notes', CAST(N'2021-02-27T00:00:00.000' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[NoteTypes] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, N'Self Write', N'Self Write Notes', CAST(N'2021-04-04T21:57:11.467' AS DateTime), 1024, CAST(N'2021-04-05T00:03:29.933' AS DateTime), 1024, 0)
INSERT [dbo].[NoteTypes] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (6, N'Novel', N'Novel', CAST(N'2021-04-05T00:00:27.597' AS DateTime), 1024, CAST(N'2021-04-09T11:25:04.663' AS DateTime), 2, 0)
SET IDENTITY_INSERT [dbo].[NoteTypes] OFF
GO
INSERT [dbo].[ReferenceData] ([ID], [Value], [DataValue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1, N'Male', N'M', N'Gender', CAST(N'2021-02-27T17:56:11.640' AS DateTime), 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 0, 1)
INSERT [dbo].[ReferenceData] ([ID], [Value], [DataValue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (2, N'Female', N'Fe', N'Gender', CAST(N'2021-02-27T17:56:11.643' AS DateTime), 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 0, 1)
INSERT [dbo].[ReferenceData] ([ID], [Value], [DataValue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, N'Unknown', N'U', N'Gender', CAST(N'2021-02-27T17:56:11.653' AS DateTime), 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[ReferenceData] ([ID], [Value], [DataValue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (4, N'Paid', N'P', N'Selling Mode', CAST(N'2021-02-27T17:56:11.653' AS DateTime), 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 0, 1)
INSERT [dbo].[ReferenceData] ([ID], [Value], [DataValue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (5, N'Free', N'F', N'Selling Mode', CAST(N'2021-02-27T17:56:11.663' AS DateTime), 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 0, 1)
INSERT [dbo].[ReferenceData] ([ID], [Value], [DataValue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (6, N'Draft', N'Draft', N'Notes Status', CAST(N'2021-02-27T17:56:11.663' AS DateTime), 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 0, 1)
INSERT [dbo].[ReferenceData] ([ID], [Value], [DataValue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (7, N'Submitted For Review', N'Submitted For Review', N'Notes Status', CAST(N'2021-02-27T17:56:11.673' AS DateTime), 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 0, 1)
INSERT [dbo].[ReferenceData] ([ID], [Value], [DataValue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (8, N'In Review ', N'In Review ', N'Notes Status', CAST(N'2021-02-27T17:56:11.683' AS DateTime), 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 0, 1)
INSERT [dbo].[ReferenceData] ([ID], [Value], [DataValue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (9, N'Published', N'Approved', N'Notes Status', CAST(N'2021-02-27T17:56:11.707' AS DateTime), 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 0, 1)
INSERT [dbo].[ReferenceData] ([ID], [Value], [DataValue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (10, N'Rejected', N'Rejected', N'Notes Status', CAST(N'2021-02-27T17:56:11.707' AS DateTime), 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 0, 1)
INSERT [dbo].[ReferenceData] ([ID], [Value], [DataValue], [RefCategory], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (11, N'Removed', N'Removed', N'Notes Status', CAST(N'2021-02-27T17:56:11.710' AS DateTime), 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 0, 1)
GO
SET IDENTITY_INSERT [dbo].[SellerNotes] ON 

INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (26, 1007, 10, 2, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', NULL, N'Operating System', 1, N'~/Members/1007/26/Operating SYstem.jpg', 1, 105, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', N'DAIICT', 1, N'CE', N'07', N'Tanmay Shah', 1, CAST(99 AS Decimal(18, 0)), N'~/Members/1007/26/Operating System.pdf', CAST(N'2021-03-05T19:23:19.043' AS DateTime), 1007, CAST(N'2021-03-10T09:27:11.893' AS DateTime), 1007, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (27, 1007, 8, NULL, NULL, NULL, N'HTML', 1, N'~/Members/1007/27/HTML.jpg', 1, 27, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', N'BSU', 2, N'CE', NULL, N'Mr. Alis', 1, CAST(251 AS Decimal(18, 0)), N'~/Members/1007/27/HTML.pdf', CAST(N'2021-03-05T19:24:13.677' AS DateTime), 1007, CAST(N'2021-03-07T15:23:50.550' AS DateTime), 1007, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (28, 1007, 7, NULL, NULL, NULL, N'Java', 1, N'~/Members/1007/28/Java.jpg', 2, 156, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', N'DAIICT', 1, N'CE', N'07', N'Mr. Rahul Patel', 1, CAST(88 AS Decimal(18, 0)), N'~/Members/1007/28/Java.pdf', CAST(N'2021-03-05T19:25:45.110' AS DateTime), 1007, NULL, NULL, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (29, 1007, 7, NULL, NULL, NULL, N'Computer Network', 1, N'~/Members/1007/29/Computer Network.jpg', 2, 96, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', N'GTU', 3, N'CE', N'07', N'Mr. Rahul Patel', 0, CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-03-05T19:26:20.133' AS DateTime), 1007, NULL, NULL, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (30, 1007, 7, NULL, NULL, NULL, N'Machine Learning', 2, N'~/Members/1007/30/Machine Learning.jpg', 1, 75, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', N'GTU', 2, N'CE', N'07', N'Mr. Vyas', 1, CAST(23 AS Decimal(18, 0)), N'~/Members/1007/30/Machine Learning.pdf', CAST(N'2021-03-05T19:27:02.770' AS DateTime), 1007, NULL, NULL, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (31, 1007, 9, 2, NULL, CAST(N'2020-11-11T00:00:00.000' AS DateTime), N'Java', 1, NULL, 1, NULL, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', N'GTU', 1, N'CE', N'007', N'Mr. Alis', 1, CAST(88 AS Decimal(18, 0)), N'~/Members/1007/31/Java.pdf', CAST(N'2021-03-05T19:27:40.933' AS DateTime), 1007, CAST(N'2021-02-03T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (32, 1007, 11, 2, NULL, CAST(N'2021-02-03T00:00:00.000' AS DateTime), N'CSS', 2, N'~/Members/1007/32/css.jpg', 1, 65, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', N'GTU', 2, NULL, NULL, NULL, 0, CAST(0 AS Decimal(18, 0)), N'~/Members/1007/32/css.pdf', CAST(N'2021-03-05T19:28:45.557' AS DateTime), 1007, CAST(N'2021-03-31T10:27:45.940' AS DateTime), 2, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (34, 1007, 9, 2, NULL, CAST(N'2020-10-10T00:00:00.000' AS DateTime), N'Operating System', 2, N'~/Members/1007/34/Operating SYstem.jpg', 1, 208, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', N'GTU', 1, N'CE', N'007', N'Tanmay Shah', 0, CAST(0 AS Decimal(18, 0)), N'~/Members/1007/34/Operating System.pdf', CAST(N'2021-03-05T19:30:38.220' AS DateTime), 1007, CAST(N'2021-02-24T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (35, 1007, 9, 2, NULL, CAST(N'2020-03-08T00:00:00.000' AS DateTime), N'Indian Constitution', 1, N'~/Members/1007/35/Indian Constitution.jpg', 2, 436, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', N'GTU', 1, NULL, NULL, NULL, 1, CAST(199 AS Decimal(18, 0)), N'~/Members/1007/35/Indian Constitution.pdf', CAST(N'2021-03-05T19:31:22.297' AS DateTime), 1007, CAST(N'2021-03-09T19:13:36.013' AS DateTime), 1007, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (36, 1007, 9, 2, NULL, CAST(N'2021-02-25T00:00:00.000' AS DateTime), N'HTML', 1, N'~/Members/1007/36/HTML.jpg', 2, 156, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', N'GTU', 1, N'CE', N'07', N'Mr. Vyas', 1, CAST(251 AS Decimal(18, 0)), N'~/Members/1007/36/HTML.pdf', CAST(N'2021-03-05T19:32:18.053' AS DateTime), 1007, CAST(N'2021-02-25T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (37, 1007, 11, 2, NULL, CAST(N'2021-04-03T00:00:00.000' AS DateTime), N'CSS', 2, N'~/Members/1007/37/css.jpg', 1, 96, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', N'BSU', 2, N'CE', NULL, NULL, 0, CAST(0 AS Decimal(18, 0)), N'~/Members/1007/37/css.pdf', CAST(N'2021-03-05T19:33:03.577' AS DateTime), 1007, CAST(N'2021-04-09T11:18:26.100' AS DateTime), 2, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (38, 3, 9, 2, NULL, CAST(N'2020-12-12T00:00:00.000' AS DateTime), N'CSS', 1, N'~/Members/3/38/css.jpg', 1, 50, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', N'BSU', 1, NULL, NULL, NULL, 1, CAST(25 AS Decimal(18, 0)), N'~/Members/3/38/css.pdf', CAST(N'2021-03-07T13:36:08.977' AS DateTime), 3, CAST(N'2021-03-05T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (39, 3, 9, 2, NULL, CAST(N'2020-11-01T00:00:00.000' AS DateTime), N'ios', 1, N'~/Members/3/39/ios.jpg', 1, 45, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', N'GTU', 1, NULL, NULL, NULL, 1, CAST(51 AS Decimal(18, 0)), N'~/Members/3/39/ios.pdf', CAST(N'2021-03-11T16:54:35.933' AS DateTime), 3, CAST(N'2021-03-06T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (40, 3, 10, 2, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', NULL, N'android', 1, N'~/Members/3/40/android.jpg', 2, 116, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', N'DAIICT', 1, N'CE', NULL, N'Mr. Rahul Patel', 0, CAST(0 AS Decimal(18, 0)), N'~/Members/3/40/android.pdf', CAST(N'2021-03-11T16:55:38.447' AS DateTime), 3, CAST(N'2021-03-06T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (41, 1007, 9, 2, N'Price must be low', CAST(N'2021-04-09T11:05:49.347' AS DateTime), N'Mobile Technology', 1, N'~/Members/1007/41/css.jpg', NULL, NULL, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', NULL, NULL, NULL, NULL, NULL, 0, CAST(0 AS Decimal(18, 0)), N'~/Members/1007/41/css.pdf', CAST(N'2021-03-12T09:13:41.397' AS DateTime), 1007, CAST(N'2021-04-09T11:05:49.347' AS DateTime), 2, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (52, 1007, 6, NULL, NULL, NULL, N'Operating System', 1, N'~/Members/1007/52/Operating SYstem.jpg', 1, 105, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', N'DAIICT', 1, N'CE', N'07', N'Tanmay Shah', 1, CAST(99 AS Decimal(18, 0)), N'~/Members/1007/52/Operating System.pdf', CAST(N'2021-03-16T22:32:45.120' AS DateTime), 1007, NULL, NULL, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1038, 1007, 6, NULL, NULL, NULL, N'Operating System', 1, N'~/Members/1007/1038/Operating SYstem.jpg', 1, 105, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', N'DAIICT', 1, N'CE', N'07', N'Tanmay Shah', 1, CAST(99 AS Decimal(18, 0)), N'~/Members/1007/1038/Operating System.pdf', CAST(N'2021-03-21T14:19:01.683' AS DateTime), 1007, NULL, NULL, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1045, 1022, 9, 2, NULL, CAST(N'2018-12-12T00:00:00.000' AS DateTime), N'HTML Guide', 1, NULL, NULL, NULL, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', NULL, NULL, NULL, NULL, NULL, 0, CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-03-27T16:35:27.637' AS DateTime), 1022, CAST(N'2021-04-04T14:55:17.427' AS DateTime), 1024, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1046, 1007, 6, NULL, NULL, NULL, N'Operating System', 1, N'~/Members/1007/1046/Operating SYstem.jpg', 1, 105, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', N'DAIICT', 1, N'CE', N'07', N'Tanmay Shah', 1, CAST(99 AS Decimal(18, 0)), N'~/Members/1007/1046/Operating System.pdf', CAST(N'2021-03-27T17:24:41.863' AS DateTime), 1007, NULL, NULL, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1047, 1022, 9, 2, NULL, CAST(N'2020-12-12T00:00:00.000' AS DateTime), N'Java Notes', 1, NULL, NULL, NULL, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', NULL, NULL, NULL, NULL, NULL, 0, CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-03-30T19:02:57.733' AS DateTime), 1022, CAST(N'2021-04-04T14:55:17.700' AS DateTime), 1024, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1048, 1009, 10, 1023, N'Inappropriate Content', NULL, N'Python', 1, NULL, NULL, NULL, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', NULL, NULL, NULL, NULL, NULL, 1, CAST(177 AS Decimal(18, 0)), N'~/Members/1009/1048/android.pdf', CAST(N'2021-04-02T16:31:15.197' AS DateTime), 1009, CAST(N'2021-04-02T16:47:06.730' AS DateTime), 1023, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1049, 1009, 10, 1023, N'Spam Note', NULL, N'Calculas', 3, NULL, NULL, NULL, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', NULL, NULL, NULL, NULL, NULL, 0, CAST(0 AS Decimal(18, 0)), N'~/Members/1009/1049/css.pdf', CAST(N'2021-04-02T16:32:47.890' AS DateTime), 1009, CAST(N'2021-04-02T16:47:20.757' AS DateTime), 1023, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1050, 1022, 10, 1023, N'Fake Content', NULL, N'Biology', 2, NULL, NULL, NULL, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', NULL, NULL, NULL, NULL, NULL, 0, CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-04-02T16:36:20.177' AS DateTime), 1022, CAST(N'2021-04-02T16:47:38.307' AS DateTime), 1023, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1051, 1022, 10, 1023, N'Content is not appropriate', NULL, N'Physics', 2, NULL, NULL, NULL, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', NULL, NULL, NULL, NULL, NULL, 1, CAST(111 AS Decimal(18, 0)), N'~/Members/1022/1051/ios.pdf', CAST(N'2021-04-02T16:38:11.730' AS DateTime), 1022, CAST(N'2021-04-02T16:47:56.210' AS DateTime), 1023, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1052, 1008, 10, 1024, N'Fake', NULL, N'Javascript', 1, NULL, NULL, NULL, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', NULL, NULL, NULL, NULL, NULL, 0, CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-04-02T16:54:37.477' AS DateTime), 1008, CAST(N'2021-04-02T16:56:42.820' AS DateTime), 1024, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1053, 1008, 10, 1024, N'Spam', NULL, N'Chemistry', 2, NULL, NULL, NULL, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', NULL, NULL, NULL, NULL, NULL, 1, CAST(51 AS Decimal(18, 0)), N'~/Members/1008/1053/preview.pdf', CAST(N'2021-04-02T16:55:31.457' AS DateTime), 1008, CAST(N'2021-04-02T16:56:55.363' AS DateTime), 1024, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1054, 1008, 7, NULL, NULL, NULL, N'C language', 1, NULL, NULL, NULL, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', NULL, NULL, NULL, NULL, NULL, 0, CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-04-04T11:21:49.313' AS DateTime), 1008, CAST(N'2021-04-04T11:22:09.640' AS DateTime), 1008, 1)
INSERT [dbo].[SellerNotes] ([ID], [SellerID], [Status], [ActionedBy], [AdminRemarks], [PublishedDate], [Title], [Category], [DisplayPicture], [NoteType], [NumberofPages], [Description], [UniversityName], [Country], [Course], [CourseCode], [Professor], [IsPaid], [SellingPrice], [NotesPreview], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1056, 1036, 9, 1, NULL, CAST(N'2021-04-09T10:04:02.710' AS DateTime), N'Maths', 3, NULL, NULL, NULL, N'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', NULL, NULL, NULL, NULL, NULL, 0, CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-04-09T09:57:07.917' AS DateTime), 1036, CAST(N'2021-04-09T10:04:02.710' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[SellerNotes] OFF
GO
SET IDENTITY_INSERT [dbo].[SellerNotesAttachements] ON 

INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (17, 26, N'Operating System.pdf', N'~/Members/1007/26/Attachements/', CAST(N'2021-03-05T19:23:19.227' AS DateTime), 1007, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (18, 27, N'HTML.pdf', N'~/Members/1007/27/Attachements/', CAST(N'2021-03-05T19:24:14.087' AS DateTime), 1007, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (19, 28, N'Java.pdf', N'~/Members/1007/28/Attachements/', CAST(N'2021-03-05T19:25:45.247' AS DateTime), 1007, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (20, 29, N'Computer Network.pdf', N'~/Members/1007/29/Attachements/', CAST(N'2021-03-05T19:26:20.203' AS DateTime), 1007, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (21, 30, N'Machine Learning.pdf', N'~/Members/1007/30/Attachements/', CAST(N'2021-03-05T19:27:02.937' AS DateTime), 1007, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (22, 31, N'Java.pdf', N'~/Members/1007/31/Attachements/', CAST(N'2021-03-05T19:27:41.183' AS DateTime), 1007, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (23, 32, N'css.pdf', N'~/Members/1007/32/Attachements/', CAST(N'2021-03-05T19:28:45.693' AS DateTime), 1007, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (25, 34, N'Operating System.pdf', N'~/Members/1007/34/Attachements/', CAST(N'2021-03-05T19:30:38.370' AS DateTime), 1007, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (26, 35, N'Indian Constitution.pdf', N'~/Members/1007/35/Attachements/', CAST(N'2021-03-05T19:31:22.390' AS DateTime), 1007, CAST(N'2021-03-06T11:15:42.980' AS DateTime), 1007, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (27, 36, N'HTML.pdf', N'~/Members/1007/36/Attachements/', CAST(N'2021-03-05T19:32:18.170' AS DateTime), 1007, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (28, 37, N'css.pdf', N'~/Members/1007/37/Attachements/', CAST(N'2021-03-05T19:33:03.753' AS DateTime), 1007, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (29, 38, N'css.pdf', N'~/Members/3/38/Attachements/', CAST(N'2021-03-07T13:36:10.503' AS DateTime), 3, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (30, 39, N'ios.pdf', N'~/Members/3/39/Attachements/', CAST(N'2021-03-11T16:54:40.487' AS DateTime), 3, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (31, 40, N'android.pdf', N'~/Members/3/40/Attachements/', CAST(N'2021-03-11T16:55:38.707' AS DateTime), 3, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (32, 41, N'HTML.pdf', N'~/Members/1007/41/Attachements/', CAST(N'2021-03-12T09:13:43.780' AS DateTime), 1007, CAST(N'2021-03-12T15:54:44.180' AS DateTime), 1007, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (35, 52, N'Operating System.pdf', N'~/Members/1007/52/Attachements/', CAST(N'2021-03-16T22:33:00.733' AS DateTime), 1007, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1029, 1038, N'Operating System.pdf', N'~/Members/1007/1038/Attachements/', CAST(N'2021-03-21T14:19:03.080' AS DateTime), 1007, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1057, 1045, N'HTML.pdf', N'~/Members/1022/1045/Attachements/', CAST(N'2021-03-27T16:35:28.493' AS DateTime), 1022, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1058, 1046, N'Operating System.pdf', N'~/Members/1007/1046/Attachements/', CAST(N'2021-03-27T17:24:43.367' AS DateTime), 1007, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1059, 1047, N'android.pdf', N'~/Members/1022/1047/Attachements/', CAST(N'2021-03-30T19:02:58.490' AS DateTime), 1022, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1060, 1047, N'C++.pdf', N'~/Members/1022/1047/Attachements/', CAST(N'2021-03-30T19:02:58.667' AS DateTime), 1022, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1061, 1047, N'HTML.pdf', N'~/Members/1022/1047/Attachements/', CAST(N'2021-03-30T19:02:58.737' AS DateTime), 1022, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1062, 1047, N'ios.pdf', N'~/Members/1022/1047/Attachements/', CAST(N'2021-03-30T19:02:58.773' AS DateTime), 1022, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1063, 1047, N'Java.pdf', N'~/Members/1022/1047/Attachements/', CAST(N'2021-03-30T19:02:58.813' AS DateTime), 1022, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1064, 1048, N'android.pdf', N'~/Members/1009/1048/Attachements/', CAST(N'2021-04-02T16:31:16.130' AS DateTime), 1009, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1065, 1049, N'Operating System.pdf', N'~/Members/1009/1049/Attachements/', CAST(N'2021-04-02T16:32:48.023' AS DateTime), 1009, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1066, 1050, N'HTML.pdf', N'~/Members/1022/1050/Attachements/', CAST(N'2021-04-02T16:36:20.283' AS DateTime), 1022, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1067, 1051, N'ios.pdf', N'~/Members/1022/1051/Attachements/', CAST(N'2021-04-02T16:38:11.980' AS DateTime), 1022, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1068, 1052, N'preview.pdf', N'~/Members/1008/1052/Attachements/', CAST(N'2021-04-02T16:54:37.877' AS DateTime), 1008, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1069, 1053, N'HTML.pdf', N'~/Members/1008/1053/Attachements/', CAST(N'2021-04-02T16:55:31.713' AS DateTime), 1008, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1070, 1054, N'preview.pdf', N'~/Members/1008/1054/Attachements/', CAST(N'2021-04-04T11:21:52.927' AS DateTime), 1008, NULL, NULL, 1)
INSERT [dbo].[SellerNotesAttachements] ([ID], [NoteID], [FileName], [FilePath], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1072, 1056, N'android.pdf', N'~/Members/1036/1056/Attachements/', CAST(N'2021-04-09T09:57:08.183' AS DateTime), 1036, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[SellerNotesAttachements] OFF
GO
SET IDENTITY_INSERT [dbo].[SellerNotesReportedIssues] ON 

INSERT [dbo].[SellerNotesReportedIssues] ([ID], [NoteID], [ReportedByID], [AgainstDownloadID], [Remarks], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1004, 31, 1009, 1037, N'This note is spam', CAST(N'2021-04-06T14:36:39.420' AS DateTime), 1009, NULL, NULL)
INSERT [dbo].[SellerNotesReportedIssues] ([ID], [NoteID], [ReportedByID], [AgainstDownloadID], [Remarks], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1005, 38, 1007, 42, N'InAppropriate Note', CAST(N'2021-04-06T14:40:28.463' AS DateTime), 1007, NULL, NULL)
INSERT [dbo].[SellerNotesReportedIssues] ([ID], [NoteID], [ReportedByID], [AgainstDownloadID], [Remarks], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1006, 38, 1008, 58, N'Spam Notes', CAST(N'2021-04-06T14:41:12.737' AS DateTime), 1008, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SellerNotesReportedIssues] OFF
GO
SET IDENTITY_INSERT [dbo].[SellerNotesReviews] ON 

INSERT [dbo].[SellerNotesReviews] ([ID], [NoteID], [ReviewedByID], [AgainstDownloadsID], [Ratings], [Comments], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (4, 38, 1008, 58, CAST(4 AS Decimal(18, 0)), N'good', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 1008, NULL, NULL, 1)
INSERT [dbo].[SellerNotesReviews] ([ID], [NoteID], [ReviewedByID], [AgainstDownloadsID], [Ratings], [Comments], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (5, 38, 1007, 42, CAST(1 AS Decimal(18, 0)), N'Not worthy as price', CAST(N'2021-03-16T11:51:06.877' AS DateTime), 1007, CAST(N'2021-03-16T11:51:48.380' AS DateTime), 1007, 1)
INSERT [dbo].[SellerNotesReviews] ([ID], [NoteID], [ReviewedByID], [AgainstDownloadsID], [Ratings], [Comments], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1003, 37, 1036, 1069, CAST(5 AS Decimal(18, 0)), N'good content', CAST(N'2021-04-09T09:43:09.330' AS DateTime), 1036, NULL, NULL, 1)
INSERT [dbo].[SellerNotesReviews] ([ID], [NoteID], [ReviewedByID], [AgainstDownloadsID], [Ratings], [Comments], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1004, 35, 1036, 1070, CAST(2 AS Decimal(18, 0)), N'good note', CAST(N'2021-04-09T09:51:25.253' AS DateTime), 1036, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[SellerNotesReviews] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemConfigurations] ON 

INSERT [dbo].[SystemConfigurations] ([ID], [Name], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (27, N'supportemail', N'akashbhalodiya678@gmail.com', CAST(N'2021-04-06T00:00:19.550' AS DateTime), 1, CAST(N'2021-04-06T00:24:09.100' AS DateTime), 1, 1)
INSERT [dbo].[SystemConfigurations] ([ID], [Name], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (28, N'supportcontact', N'5577123456', CAST(N'2021-04-06T00:00:19.617' AS DateTime), 1, CAST(N'2021-04-09T11:32:41.513' AS DateTime), 1, 1)
INSERT [dbo].[SystemConfigurations] ([ID], [Name], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (29, N'notifyemail', N'abpatel0044@gmail.com', CAST(N'2021-04-06T00:00:19.633' AS DateTime), 1, CAST(N'2021-04-06T00:22:00.770' AS DateTime), 1, 1)
INSERT [dbo].[SystemConfigurations] ([ID], [Name], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (30, N'defaultprofile', N'~/DefaultImage/profile.png', CAST(N'2021-04-06T00:00:19.683' AS DateTime), 1, CAST(N'2021-04-06T00:07:19.167' AS DateTime), 1, 1)
INSERT [dbo].[SystemConfigurations] ([ID], [Name], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (31, N'defaultnote', N'~/DefaultImage/note.jpg', CAST(N'2021-04-06T00:00:19.713' AS DateTime), 1, CAST(N'2021-04-06T00:07:19.187' AS DateTime), 1, 1)
INSERT [dbo].[SystemConfigurations] ([ID], [Name], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (32, N'linkedinurl', N'https://in.linkedin.com/', CAST(N'2021-04-06T00:00:00.000' AS DateTime), 1, CAST(N'2021-04-06T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[SystemConfigurations] ([ID], [Name], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (33, N'twitterurl', N'https://twitter.com/?lang=en', CAST(N'2021-04-06T00:00:00.000' AS DateTime), 1, CAST(N'2021-04-06T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[SystemConfigurations] ([ID], [Name], [Value], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (34, N'facebookurl', N'https://www.facebook.com/', CAST(N'2021-04-06T00:00:00.000' AS DateTime), 1, CAST(N'2021-04-06T00:00:00.000' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[SystemConfigurations] OFF
GO
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumberCountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 3, CAST(N'1999-01-01T00:00:00.000' AS DateTime), 2, NULL, N'+91', N'1122334455', N'~/Members/3/DP_14032021_024126.jpg', N'Rajkot', N'Rajkot', N'Rajkot', N'Gujarat', N'360000', N'India', N'GTU', N'GEC', CAST(N'2021-03-03T00:00:00.000' AS DateTime), 3, CAST(N'2021-03-14T14:41:26.337' AS DateTime), 3)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumberCountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 1008, CAST(N'2000-02-02T00:00:00.000' AS DateTime), 1, NULL, N'+91', N'6677889955', NULL, N'Surat', N'Surat', N'Surat', N'Gujarat', N'360001', N'India', N'DAIICT', N'DAIICT', CAST(N'2021-02-02T00:00:00.000' AS DateTime), 1008, CAST(N'2021-03-14T14:42:01.550' AS DateTime), 1008)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumberCountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 1007, CAST(N'2001-06-27T00:00:00.000' AS DateTime), 1, NULL, N'+91', N'9988776655', N'~/Members/1007/DP_10032021_054629.jpg', N'Rajkot', N'Rajkot', N'Rajkot', N'Gujarat', N'360009', N'India', N'GTU', N'GEC', CAST(N'2021-03-10T17:46:29.923' AS DateTime), 1007, CAST(N'2021-03-12T17:10:17.757' AS DateTime), 1007)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumberCountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1006, 1009, CAST(N'2003-03-26T00:00:00.000' AS DateTime), 2, NULL, N'+91', N'5544112233', NULL, N'rajkot', N'rajkot', N'rajkot', N'rajkot', N'360000', N'India', NULL, NULL, CAST(N'2021-03-24T16:31:37.417' AS DateTime), 1009, NULL, NULL)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumberCountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1007, 1022, CAST(N'2003-03-29T00:00:00.000' AS DateTime), 2, NULL, N'+91', N'9911005522', N'~/Members/1022/DP_27032021_043301.jpg', N'rajkot', N'rajkot', N'rajkot', N'rajkot', N'360000', N'India', NULL, NULL, CAST(N'2021-03-27T16:33:01.190' AS DateTime), 1022, NULL, NULL)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumberCountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1008, 1031, NULL, NULL, NULL, N'+91', N'5511774488', NULL, N'NA', N'NA', N'NA', N'NA', N'NA', N'NA', NULL, NULL, CAST(N'2021-04-05T13:39:35.023' AS DateTime), 1, CAST(N'2021-04-05T15:13:55.647' AS DateTime), 1)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumberCountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1010, 2, NULL, NULL, N'jaygadhiya@gmail.com', N'+91', N'8877441100', NULL, N'NA', N'NA', N'NA', N'NA', N'NA', N'NA', NULL, NULL, CAST(N'2021-02-24T00:00:00.000' AS DateTime), 1, CAST(N'2021-04-09T11:26:22.943' AS DateTime), 2)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumberCountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1012, 1023, NULL, NULL, NULL, N'+91', N'1112224445', NULL, N'NA', N'NA', N'NA', N'NA', N'NA', N'NA', NULL, NULL, CAST(N'2021-03-15T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumberCountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1013, 1024, NULL, NULL, N'vishal2@gmail.com', N'+91', N'8888888888', N'~/Members/1024/DP_07042021_111853.jpg', N'NA', N'NA', N'NA', N'NA', N'NA', N'NA', NULL, NULL, CAST(N'2021-03-29T00:00:00.000' AS DateTime), 1, CAST(N'2021-04-07T11:22:28.210' AS DateTime), 1024)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumberCountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1014, 1032, NULL, NULL, NULL, N'+91', N'7778855222', NULL, N'NA', N'NA', N'NA', N'NA', N'NA', N'NA', NULL, NULL, CAST(N'2021-04-05T15:19:03.437' AS DateTime), 1, CAST(N'2021-04-09T11:32:04.347' AS DateTime), 1)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumberCountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1016, 1035, CAST(N'2021-04-30T00:00:00.000' AS DateTime), NULL, NULL, N'+91', N'5555566666', N'~/Members/1035/DP_09042021_121822.jpg', N'address 1 ', N'address 2', N'city1', N'state1', N'550028', N'Iran ', N'Iran University', NULL, CAST(N'2021-04-09T00:18:22.683' AS DateTime), 1035, CAST(N'2021-04-09T00:37:35.143' AS DateTime), 1035)
INSERT [dbo].[UserProfile] ([ID], [UserID], [DOB], [Gender], [SecondaryEmailAddress], [PhoneNumberCountryCode], [PhoneNumber], [ProfilePicture], [AddressLine1], [AddressLine2], [City], [State], [ZipCode], [Country], [University], [College], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1017, 1036, CAST(N'2003-04-30T00:00:00.000' AS DateTime), NULL, NULL, N'+91', N'7788991111', NULL, N'address 1 ', N'address 2', N'city1', N'state1', N'550029', N'India', NULL, NULL, CAST(N'2021-04-09T08:49:20.253' AS DateTime), 1036, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [Email], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1, 3, N'akash', N'patel', N'akash@gmail.com', N'Akash00@', 1, CAST(N'2021-02-24T00:00:00.000' AS DateTime), 1, CAST(N'2021-02-25T13:46:46.167' AS DateTime), 1, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [Email], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (2, 1, N'Jay', N'gadhiya', N'jay@gmail.com', N'Jay0000@', 1, CAST(N'2021-02-24T01:26:58.090' AS DateTime), NULL, CAST(N'2021-04-09T11:28:01.703' AS DateTime), 2, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [Email], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, 2, N'Priya', N'Desai', N'priya@gmail.com', N'Priya00@', 1, CAST(N'2021-02-24T16:37:43.547' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [Email], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1007, 2, N'Akash', N'Bhalodiya', N'akash1999bece@gmail.com', N'Akash00@', 1, CAST(N'2021-02-26T16:29:38.297' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [Email], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1008, 2, N'Raj', N'Daslaniya', N'raj@gmail.com', N'Raj0000@', 1, CAST(N'2021-02-26T17:57:03.180' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [Email], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1009, 2, N'Diya', N'Sharma', N'diya@gmail.com', N'Diya000@', 1, CAST(N'2021-03-24T10:53:47.200' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [Email], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1022, 2, N'Nikhil', N'Patel', N'nikhil@gmail.com', N'Akash00@', 1, CAST(N'2021-03-27T14:08:58.857' AS DateTime), NULL, CAST(N'2021-04-04T14:55:16.767' AS DateTime), 1024, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [Email], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1023, 1, N'Harsh', N'Khagram', N'harsh@gmail.com', N'Harsh00@', 1, CAST(N'2021-02-04T00:00:00.000' AS DateTime), NULL, CAST(N'2021-02-04T00:00:00.000' AS DateTime), 1023, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [Email], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1024, 1, N'Vishal', N'Rathod', N'vishal@gmail.com', N'Vishal0@', 1, CAST(N'2021-02-04T00:00:00.000' AS DateTime), NULL, CAST(N'2021-02-04T00:00:00.000' AS DateTime), 1024, 1)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [Email], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1031, 1, N'Rohit', N'Sharma', N'rohitsharma@gmail.com', N'Admin@123', 1, CAST(N'2021-04-05T13:39:27.480' AS DateTime), 1, CAST(N'2021-04-05T15:17:34.273' AS DateTime), 1, 0)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [Email], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1032, 1, N'VIrat', N'Kohli', N'viratk@gmail.com', N'Admin@123', 1, CAST(N'2021-04-05T15:19:03.323' AS DateTime), 1, CAST(N'2021-04-09T11:32:11.897' AS DateTime), 1, 0)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [Email], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1035, 2, N'Yash', N'Patel', N'yash@gmail.com', N'Yash000@', 1, CAST(N'2021-04-06T16:22:05.300' AS DateTime), NULL, CAST(N'2021-04-09T11:19:18.240' AS DateTime), 2, 0)
INSERT [dbo].[Users] ([ID], [RoleID], [FirstName], [LastName], [Email], [Password], [IsEmailVerified], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1036, 2, N'Vijay', N'Mehta', N'akas200@gmail.com', N'Vijay00@', 1, CAST(N'2021-04-09T08:47:04.580' AS DateTime), NULL, CAST(N'2021-04-09T10:02:51.710' AS DateTime), 1036, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UsersRole] ON 

INSERT [dbo].[UsersRole] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1, N'Admin', N'Admin', CAST(N'2021-02-24T00:00:00.000' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[UsersRole] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (2, N'Member', N'Member', CAST(N'2021-02-24T00:00:00.000' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[UsersRole] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, N'SuperAdmin', N'SuperAdmin', CAST(N'2021-02-24T00:00:00.000' AS DateTime), 1, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[UsersRole] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Countrie__5D9B0D2CBFFD4A6B]    Script Date: 11-04-2021 11:29:48 ******/
ALTER TABLE [dbo].[Countries] ADD UNIQUE NONCLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Countrie__737584F66920E1C1]    Script Date: 11-04-2021 11:29:48 ******/
ALTER TABLE [dbo].[Countries] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__NoteCate__737584F637681D5E]    Script Date: 11-04-2021 11:29:48 ******/
ALTER TABLE [dbo].[NoteCategories] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__NoteType__737584F664E09BC9]    Script Date: 11-04-2021 11:29:48 ******/
ALTER TABLE [dbo].[NoteTypes] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Referenc__D222D33BBFCB7579]    Script Date: 11-04-2021 11:29:48 ******/
ALTER TABLE [dbo].[ReferenceData] ADD UNIQUE NONCLUSTERED 
(
	[DataValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D105347DF25801]    Script Date: 11-04-2021 11:29:48 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Countries] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[NoteCategories] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[NoteTypes] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ReferenceData] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SellerNotes] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SellerNotesAttachements] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SellerNotesReviews] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SystemConfigurations] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [IsEmailVerified]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UsersRole] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Downloads]  WITH CHECK ADD FOREIGN KEY([Downloader])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Downloads]  WITH CHECK ADD FOREIGN KEY([NoteID])
REFERENCES [dbo].[SellerNotes] ([ID])
GO
ALTER TABLE [dbo].[Downloads]  WITH CHECK ADD FOREIGN KEY([Seller])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[SellerNotes]  WITH CHECK ADD FOREIGN KEY([ActionedBy])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[SellerNotes]  WITH CHECK ADD FOREIGN KEY([Category])
REFERENCES [dbo].[NoteCategories] ([ID])
GO
ALTER TABLE [dbo].[SellerNotes]  WITH CHECK ADD FOREIGN KEY([Country])
REFERENCES [dbo].[Countries] ([ID])
GO
ALTER TABLE [dbo].[SellerNotes]  WITH CHECK ADD FOREIGN KEY([NoteType])
REFERENCES [dbo].[NoteTypes] ([ID])
GO
ALTER TABLE [dbo].[SellerNotes]  WITH CHECK ADD FOREIGN KEY([SellerID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[SellerNotes]  WITH CHECK ADD FOREIGN KEY([Status])
REFERENCES [dbo].[ReferenceData] ([ID])
GO
ALTER TABLE [dbo].[SellerNotesAttachements]  WITH CHECK ADD FOREIGN KEY([NoteID])
REFERENCES [dbo].[SellerNotes] ([ID])
GO
ALTER TABLE [dbo].[SellerNotesReportedIssues]  WITH CHECK ADD FOREIGN KEY([AgainstDownloadID])
REFERENCES [dbo].[Downloads] ([ID])
GO
ALTER TABLE [dbo].[SellerNotesReportedIssues]  WITH CHECK ADD FOREIGN KEY([NoteID])
REFERENCES [dbo].[SellerNotes] ([ID])
GO
ALTER TABLE [dbo].[SellerNotesReportedIssues]  WITH CHECK ADD FOREIGN KEY([ReportedByID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[SellerNotesReviews]  WITH CHECK ADD FOREIGN KEY([AgainstDownloadsID])
REFERENCES [dbo].[Downloads] ([ID])
GO
ALTER TABLE [dbo].[SellerNotesReviews]  WITH CHECK ADD FOREIGN KEY([NoteID])
REFERENCES [dbo].[SellerNotes] ([ID])
GO
ALTER TABLE [dbo].[SellerNotesReviews]  WITH CHECK ADD FOREIGN KEY([ReviewedByID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD FOREIGN KEY([Gender])
REFERENCES [dbo].[ReferenceData] ([ID])
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[UsersRole] ([ID])
GO
USE [master]
GO
ALTER DATABASE [NotesMarketplace] SET  READ_WRITE 
GO
