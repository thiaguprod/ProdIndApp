USE [master]
GO
/****** Object:  Database [ProdIndApp_Dev]    Script Date: 10/1/2018 1:23:13 PM ******/
CREATE DATABASE [ProdIndApp_Dev]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pro_Ind_App', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\Pro_Ind_App.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Pro_Ind_App_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\Pro_Ind_App_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ProdIndApp_Dev] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProdIndApp_Dev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProdIndApp_Dev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProdIndApp_Dev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProdIndApp_Dev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProdIndApp_Dev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProdIndApp_Dev] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProdIndApp_Dev] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProdIndApp_Dev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProdIndApp_Dev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProdIndApp_Dev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProdIndApp_Dev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProdIndApp_Dev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProdIndApp_Dev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProdIndApp_Dev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProdIndApp_Dev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProdIndApp_Dev] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProdIndApp_Dev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProdIndApp_Dev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProdIndApp_Dev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProdIndApp_Dev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProdIndApp_Dev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProdIndApp_Dev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProdIndApp_Dev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProdIndApp_Dev] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProdIndApp_Dev] SET  MULTI_USER 
GO
ALTER DATABASE [ProdIndApp_Dev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProdIndApp_Dev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProdIndApp_Dev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProdIndApp_Dev] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProdIndApp_Dev] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProdIndApp_Dev] SET QUERY_STORE = OFF
GO
USE [ProdIndApp_Dev]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ProdIndApp_Dev]
GO
/****** Object:  Table [dbo].[Prod_Api_Log]    Script Date: 10/1/2018 1:23:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prod_Api_Log](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[JsonRequest] [nvarchar](max) NULL,
	[JsonResponse] [varchar](4000) NULL,
	[TimeStamp] [datetime] NULL,
 CONSTRAINT [PK_dbo.Prod_Api_Log] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prod_Country]    Script Date: 10/1/2018 1:23:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prod_Country](
	[CountryCode] [nvarchar](3) NOT NULL,
	[Name] [nvarchar](64) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prod_Error_Log]    Script Date: 10/1/2018 1:23:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prod_Error_Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ErrorCode] [int] NULL,
	[Description] [varchar](4000) NULL,
	[SourceFile] [varchar](800) NULL,
	[TimeStamp] [datetime] NULL,
 CONSTRAINT [PK_dbo.Error_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prod_IDSeq_Prefix]    Script Date: 10/1/2018 1:23:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prod_IDSeq_Prefix](
	[Corporate_Prefix] [nvarchar](3) NULL,
	[Location_Prefix] [nvarchar](3) NULL,
	[Site_Prefix] [nvarchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prod_IDSeq_Suffix]    Script Date: 10/1/2018 1:23:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prod_IDSeq_Suffix](
	[Next_Suffix] [nvarchar](32) NULL,
	[Short_Name] [nvarchar](6) NULL,
	[Table_Name] [nvarchar](40) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prod_Login_History]    Script Date: 10/1/2018 1:23:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prod_Login_History](
	[Id] [nvarchar](128) NOT NULL,
	[UserId] [varchar](255) NOT NULL,
	[EmailAddress] [varchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_LoginHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prod_Modules_Data_Product_App]    Script Date: 10/1/2018 1:23:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prod_Modules_Data_Product_App](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ModuleId] [varchar](200) NOT NULL,
	[ActionName] [varchar](250) NULL,
	[ProcessName] [varchar](250) NULL,
	[MethodType] [varchar](5) NULL,
	[InputJson] [varchar](max) NULL,
	[OutputJson] [varchar](max) NULL,
	[TimeStamp] [datetime] NULL,
 CONSTRAINT [PK_dbo.ModulesDataApp] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prod_People]    Script Date: 10/1/2018 1:23:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prod_People](
	[Id] [nvarchar](128) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[NickName] [nvarchar](15) NULL,
	[ShortName] [nvarchar](10) NULL,
	[Email] [nvarchar](40) NULL,
	[FirstPhone] [nvarchar](20) NULL,
	[SecondPhone] [nvarchar](20) NULL,
	[Gender] [char](1) NULL,
	[BDay] [datetime] NULL,
	[Bio] [text] NULL,
	[HomeTown] [nvarchar](max) NULL,
	[PinCode] [nvarchar](15) NULL,
	[AvatarUrl] [nvarchar](256) NULL,
	[TimeStamp] [datetime] NULL,
	[ModifyDate] [date] NOT NULL,
	[type] [varchar](50) NULL,
 CONSTRAINT [PK_dbo.People] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prod_Promo_Codes]    Script Date: 10/1/2018 1:23:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prod_Promo_Codes](
	[Id] [nvarchar](128) NOT NULL,
	[PromoCode] [nvarchar](50) NULL,
	[RecordStatusId] [int] NOT NULL,
	[PercentDiscount] [decimal](18, 3) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IsFree] [bit] NULL,
 CONSTRAINT [PK_PromoCodes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prod_Security_Question]    Script Date: 10/1/2018 1:23:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prod_Security_Question](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SecurityQuestions] [nvarchar](128) NOT NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_SecurityQuestion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prod_Site_Api_Url]    Script Date: 10/1/2018 1:23:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prod_Site_Api_Url](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SiteUrl] [varchar](max) NULL,
	[ApiUrl] [varchar](max) NULL,
	[Location] [varchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_dbo.Prod_Site_Api_Url] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prod_TempJSON_Details]    Script Date: 10/1/2018 1:23:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prod_TempJSON_Details](
	[JSONId] [int] IDENTITY(1,1) NOT NULL,
	[JSONRequest] [text] NULL,
	[JSONResponse] [text] NULL,
	[JSONResponseTimeStamp] [datetime] NULL,
	[TimeStamp] [datetime] NULL,
 CONSTRAINT [PK_dbo.TempJSONDetails] PRIMARY KEY CLUSTERED 
(
	[JSONId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Prod_Api_Log] ON 

INSERT [dbo].[Prod_Api_Log] ([LogId], [JsonRequest], [JsonResponse], [TimeStamp]) VALUES (6, N'{
	"request": [
		{
		"ModuleId": "101",
		"FirstName": "THIYAGARAJAN",
		"LastName": "SR",
		"NickName": "RAJA",
		"ShortName": "THIYAGU",
		"Email": "thiyagu.shenll@gmail.customer_id",
		"FirstPhone": "9626024288",
		"SecondPhone": "9626943111",
		"Gender": "M",
		"BDay": "07-06-1989",
		"Bio": "test",
		"HomeTown": "test",
		"PinCode": "636105",
		"AvatarUrl": "tes"
	}
	]
}', N'{
    "response": [
        {
            "101": {
                "response": [
                    {
                        "Status": "successfully registered!!!"
                    }
                ]
            }
        }
    ]
}', CAST(N'2018-10-01T11:58:47.260' AS DateTime))
INSERT [dbo].[Prod_Api_Log] ([LogId], [JsonRequest], [JsonResponse], [TimeStamp]) VALUES (7, N'{
	"request": [
		{
		"ModuleId": "101",
		"FirstName": "THIYAGARAJAN",
		"LastName": "SR",
		"NickName": "RAJA",
		"ShortName": "THIYAGU",
		"Email": "",
		"FirstPhone": "9626024288",
		"SecondPhone": "9626943111",
		"Gender": "M",
		"BDay": "07-06-1989",
		"Bio": "test",
		"HomeTown": "test",
		"PinCode": "636105",
		"AvatarUrl": "tes"
	}
	]
}', N'{ "response" : [{"101" :{"response":"null"}}]}', CAST(N'2018-10-01T12:10:07.847' AS DateTime))
INSERT [dbo].[Prod_Api_Log] ([LogId], [JsonRequest], [JsonResponse], [TimeStamp]) VALUES (8, N'{
	"request": [
		{
		"ModuleId": "101",
		"FirstName": "THIYAGARAJAN",
		"LastName": "SR",
		"NickName": "RAJA",
		"ShortName": "THIYAGU",
		"Email": "",
		"FirstPhone": "9626024288",
		"SecondPhone": "9626943111",
		"Gender": "M",
		"BDay": "07-06-1989",
		"Bio": "test",
		"HomeTown": "test",
		"PinCode": "636105",
		"AvatarUrl": "tes"
	}
	]
}', N'{ "response" : [{"101" :{"response": [ {"Status":0, "Message":"Please enter your email address"} ]}}]}', CAST(N'2018-10-01T13:00:31.540' AS DateTime))
INSERT [dbo].[Prod_Api_Log] ([LogId], [JsonRequest], [JsonResponse], [TimeStamp]) VALUES (9, N'{
	"request": [
		{
		"ModuleId": "101",
		"FirstName": "THIYAGARAJAN",
		"LastName": "SR",
		"NickName": "RAJA",
		"ShortName": "THIYAGU",
		"Email": "thiyagu.shenll@gmail.com",
		"FirstPhone": "9626024288",
		"SecondPhone": "9626943111",
		"Gender": "M",
		"BDay": "07-06-1989",
		"Bio": "test",
		"HomeTown": "test",
		"PinCode": "636105",
		"AvatarUrl": "tes"
	}
	]
}', N'{ "response" : [{"101" :{"response": [ {"Status":1, "Message":"Thanks for you registration, log in here."} ]}}]}', CAST(N'2018-10-01T13:00:59.777' AS DateTime))
INSERT [dbo].[Prod_Api_Log] ([LogId], [JsonRequest], [JsonResponse], [TimeStamp]) VALUES (10, N'{
	"request": [
		{
		"ModuleId": "101",
		"FirstName": "THIYAGARAJAN",
		"LastName": "SR",
		"NickName": "RAJA",
		"ShortName": "THIYAGU",
		"Email": "thiyagu.shenll@gmail.com",
		"FirstPhone": "9626024288",
		"SecondPhone": "9626943111",
		"Gender": "M",
		"BDay": "07-06-1989",
		"Bio": "test",
		"HomeTown": "test",
		"PinCode": "636105",
		"AvatarUrl": "tes"
	}
	]
}', N'{ "response" : [{"101" :{"response": [ {"Status":0, "Message":"This phone number is already in use"} ]}}]}', CAST(N'2018-10-01T13:01:08.803' AS DateTime))
INSERT [dbo].[Prod_Api_Log] ([LogId], [JsonRequest], [JsonResponse], [TimeStamp]) VALUES (11, N'{
	"request": [
		{
		"ModuleId": "101",
		"FirstName": "THIYAGARAJAN",
		"LastName": "SR",
		"NickName": "RAJA",
		"ShortName": "THIYAGU",
		"Email": "thiyagu.shenll@gmail.com",
		"FirstPhone": "9626024287",
		"SecondPhone": "9626943111",
		"Gender": "M",
		"BDay": "07-06-1989",
		"Bio": "test",
		"HomeTown": "test",
		"PinCode": "636105",
		"AvatarUrl": "tes"
	}
	]
}', N'{ "response" : [{"101" :{"response": [ {"Status":0, "Message":"This phone number is already in use"} ]}}]}', CAST(N'2018-10-01T13:01:59.883' AS DateTime))
INSERT [dbo].[Prod_Api_Log] ([LogId], [JsonRequest], [JsonResponse], [TimeStamp]) VALUES (12, N'{
	"request": [
		{
		"ModuleId": "101",
		"FirstName": "THIYAGARAJAN",
		"LastName": "SR",
		"NickName": "RAJA",
		"ShortName": "THIYAGU",
		"Email": "thiyagu.shenll@gmail.com",
		"FirstPhone": "9626024287",
		"SecondPhone": "9626943111",
		"Gender": "M",
		"BDay": "07-06-1989",
		"Bio": "test",
		"HomeTown": "test",
		"PinCode": "636105",
		"AvatarUrl": "tes"
	}
	]
}', N'{ "response" : [{"101" :{"response": [ {"Status":0, "Message":"This phone number is already in use"} ]}}]}', CAST(N'2018-10-01T13:02:27.150' AS DateTime))
INSERT [dbo].[Prod_Api_Log] ([LogId], [JsonRequest], [JsonResponse], [TimeStamp]) VALUES (13, N'{
	"request": [
		{
		"ModuleId": "101",
		"FirstName": "THIYAGARAJAN",
		"LastName": "SR",
		"NickName": "RAJA",
		"ShortName": "THIYAGU",
		"Email": "thiyagu.shenll@gmail.com",
		"FirstPhone": "9626024287",
		"SecondPhone": "9626943111",
		"Gender": "M",
		"BDay": "07-06-1989",
		"Bio": "test",
		"HomeTown": "test",
		"PinCode": "636105",
		"AvatarUrl": "tes"
	}
	]
}', N'{ "response" : [{"101" :{"response": [ {"Status":0, "Message":"This email address is already in use"} ]}}]}', CAST(N'2018-10-01T13:04:24.777' AS DateTime))
INSERT [dbo].[Prod_Api_Log] ([LogId], [JsonRequest], [JsonResponse], [TimeStamp]) VALUES (14, N'{
	"request": [
		{
		"ModuleId": "101",
		"FirstName": "THIYAGARAJAN",
		"LastName": "SR",
		"NickName": "RAJA",
		"ShortName": "THIYAGU",
		"Email": "thiyagu1.shenll@gmail.com",
		"FirstPhone": "9626024288",
		"SecondPhone": "9626943111",
		"Gender": "M",
		"BDay": "07-06-1989",
		"Bio": "test",
		"HomeTown": "test",
		"PinCode": "636105",
		"AvatarUrl": "tes"
	}
	]
}', N'{ "response" : [{"101" :{"response": [ {"Status":0, "Message":"This phone number is already in use"} ]}}]}', CAST(N'2018-10-01T13:04:37.563' AS DateTime))
SET IDENTITY_INSERT [dbo].[Prod_Api_Log] OFF
SET IDENTITY_INSERT [dbo].[Prod_Error_Log] ON 

INSERT [dbo].[Prod_Error_Log] ([Id], [ErrorCode], [Description], [SourceFile], [TimeStamp]) VALUES (1, 245, N'Error: Conversion failed when converting the varchar value ''{
	"request": [{
		"ModuleId": "101",
		"FirstName": "THIYAGARAJAN",
		"LastName": "SR",
		"NickName": "RAJA",
		"ShortName": "THIYAGU",
		"Email": "thiyagu.shenll@gmail.customer_id",
		"FirstPhone": "",
		"SecondPhone": "",
		"Gender": "",
		"BDay": "",
		"Bio": "",
		"HomeTown": "",
		"PinCode": "",
		"AvatarUrl": ""
	}]
}'' to data type int. occurred at line# 17Proc_Prod_Api_Log', N'Proc_Prod_Api_Log', CAST(N'2018-09-29T20:14:58.300' AS DateTime))
INSERT [dbo].[Prod_Error_Log] ([Id], [ErrorCode], [Description], [SourceFile], [TimeStamp]) VALUES (2, 245, N'Error: Conversion failed when converting the varchar value ''{
	"request": [
		{
		"ModuleId": "101",
		"FirstName": "THIYAGARAJAN",
		"LastName": "SR",
		"NickName": "RAJA",
		"ShortName": "THIYAGU",
		"Email": "thiyagu.shenll@gmail.customer_id",
		"FirstPhone": "",
		"SecondPhone": "",
		"Gender": "",
		"BDay": "",
		"Bio": "",
		"HomeTown": "",
		"PinCode": "",
		"AvatarUrl": ""
	}
	]
}'' to data type int. occurred at line# 17Proc_Prod_Api_Log', N'Proc_Prod_Api_Log', CAST(N'2018-09-29T20:17:37.800' AS DateTime))
INSERT [dbo].[Prod_Error_Log] ([Id], [ErrorCode], [Description], [SourceFile], [TimeStamp]) VALUES (3, 245, N'Error: Conversion failed when converting the varchar value ''{
	"request": [
		{
		"ModuleId": "101",
		"FirstName": "THIYAGARAJAN",
		"LastName": "SR",
		"NickName": "RAJA",
		"ShortName": "THIYAGU",
		"Email": "thiyagu.shenll@gmail.customer_id",
		"FirstPhone": "9626024288",
		"SecondPhone": "9626943111",
		"Gender": "M",
		"BDay": "07-06-1989",
		"Bio": "test",
		"HomeTown": "test",
		"PinCode": "636105",
		"AvatarUrl": "tes"
	}
	]
}'' to data type int. occurred at line# 17Proc_Prod_Api_Log', N'Proc_Prod_Api_Log', CAST(N'2018-09-29T20:20:13.410' AS DateTime))
INSERT [dbo].[Prod_Error_Log] ([Id], [ErrorCode], [Description], [SourceFile], [TimeStamp]) VALUES (4, 245, N'Error: Conversion failed when converting the varchar value ''{"response":"null"}'' to data type int. occurred at line# 72Proc_Prod_Register', N'Proc_Prod_Json_Parsing', CAST(N'2018-10-01T11:04:08.403' AS DateTime))
INSERT [dbo].[Prod_Error_Log] ([Id], [ErrorCode], [Description], [SourceFile], [TimeStamp]) VALUES (5, 245, N'Error: Conversion failed when converting the varchar value ''{
	"request": [
		{
		"ModuleId": "101",
		"FirstName": "THIYAGARAJAN",
		"LastName": "SR",
		"NickName": "RAJA",
		"ShortName": "THIYAGU",
		"Email": "thiyagu.shenll@gmail.customer_id",
		"FirstPhone": "9626024288",
		"SecondPhone": "9626943111",
		"Gender": "M",
		"BDay": "07-06-1989",
		"Bio": "test",
		"HomeTown": "test",
		"PinCode": "636105",
		"AvatarUrl": "tes"
	}
	]
}'' to data type int. occurred at line# 17Proc_Prod_Api_Log', N'Proc_Prod_Api_Log', CAST(N'2018-10-01T11:28:41.227' AS DateTime))
SET IDENTITY_INSERT [dbo].[Prod_Error_Log] OFF
INSERT [dbo].[Prod_IDSeq_Prefix] ([Corporate_Prefix], [Location_Prefix], [Site_Prefix]) VALUES (N'PRO', N'IND', N'001')
INSERT [dbo].[Prod_IDSeq_Suffix] ([Next_Suffix], [Short_Name], [Table_Name]) VALUES (N'B', N'PERSON', N'Prod_People')
SET IDENTITY_INSERT [dbo].[Prod_Modules_Data_Product_App] ON 

INSERT [dbo].[Prod_Modules_Data_Product_App] ([Id], [ModuleId], [ActionName], [ProcessName], [MethodType], [InputJson], [OutputJson], [TimeStamp]) VALUES (1, N'101', N'Proc_Prod_Register', N'Proc_Prod_Register', N'post', N'{
	"request": [
		{
		"ModuleId": "101",
		"FirstName": "THIYAGARAJAN",
		"LastName": "SR",
		"NickName": "RAJA",
		"ShortName": "THIYAGU",
		"Email": "thiyagu1.shenll@gmail.com",
		"FirstPhone": "9626024288",
		"SecondPhone": "9626943111",
		"Gender": "M",
		"BDay": "07-06-1989",
		"Bio": "test",
		"HomeTown": "test",
		"PinCode": "636105",
		"AvatarUrl": "tes"
	}
	]
}', N'{
    "response": [
        {
            "101": {
                "response": [
                    {
                        "Status": 0,
                        "Message": "This phone number is already in use"
                    }
                ]
            }
        }
    ]
}', CAST(N'2018-09-29T20:14:00.453' AS DateTime))
SET IDENTITY_INSERT [dbo].[Prod_Modules_Data_Product_App] OFF
INSERT [dbo].[Prod_People] ([Id], [FirstName], [LastName], [NickName], [ShortName], [Email], [FirstPhone], [SecondPhone], [Gender], [BDay], [Bio], [HomeTown], [PinCode], [AvatarUrl], [TimeStamp], [ModifyDate], [type]) VALUES (N'PROIND001-PERSON4', N'THIYAGARAJAN', N'SR', N'RAJA', N'THIYAGU', N'thiyagu.shenll@gmail.customer_id', N'', N'', N' ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', N'', N'', N'', CAST(N'2018-09-29T20:14:38.383' AS DateTime), CAST(N'1900-01-01' AS Date), N'customer')
INSERT [dbo].[Prod_People] ([Id], [FirstName], [LastName], [NickName], [ShortName], [Email], [FirstPhone], [SecondPhone], [Gender], [BDay], [Bio], [HomeTown], [PinCode], [AvatarUrl], [TimeStamp], [ModifyDate], [type]) VALUES (N'PROIND001-PERSON5', N'THIYAGARAJAN', N'SR', N'RAJA', N'THIYAGU', N'thiyagu.shenll@gmail.customer_id', N'', N'', N' ', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', N'', N'', N'', CAST(N'2018-09-29T20:17:00.260' AS DateTime), CAST(N'1900-01-01' AS Date), N'customer')
INSERT [dbo].[Prod_People] ([Id], [FirstName], [LastName], [NickName], [ShortName], [Email], [FirstPhone], [SecondPhone], [Gender], [BDay], [Bio], [HomeTown], [PinCode], [AvatarUrl], [TimeStamp], [ModifyDate], [type]) VALUES (N'PROIND001-PERSON6', N'THIYAGARAJAN', N'SR', N'RAJA', N'THIYAGU', N'thiyagu.shenll@gmail.customer_id', N'9626024288', N'9626943111', N'M', CAST(N'1989-07-06T00:00:00.000' AS DateTime), N'test', N'test', N'636105', N'tes', CAST(N'2018-09-29T20:19:53.173' AS DateTime), CAST(N'1900-01-01' AS Date), N'customer')
INSERT [dbo].[Prod_People] ([Id], [FirstName], [LastName], [NickName], [ShortName], [Email], [FirstPhone], [SecondPhone], [Gender], [BDay], [Bio], [HomeTown], [PinCode], [AvatarUrl], [TimeStamp], [ModifyDate], [type]) VALUES (N'PROIND001-PERSON7', N'THIYAGARAJAN', N'SR', N'RAJA', N'THIYAGU', N'thiyagu.shenll@gmail.customer_id', N'9626024288', N'9626943111', N'M', CAST(N'1989-07-06T00:00:00.000' AS DateTime), N'test', N'test', N'636105', N'tes', CAST(N'2018-10-01T11:21:51.960' AS DateTime), CAST(N'1900-01-01' AS Date), N'customer')
INSERT [dbo].[Prod_People] ([Id], [FirstName], [LastName], [NickName], [ShortName], [Email], [FirstPhone], [SecondPhone], [Gender], [BDay], [Bio], [HomeTown], [PinCode], [AvatarUrl], [TimeStamp], [ModifyDate], [type]) VALUES (N'PROIND001-PERSON8', N'THIYAGARAJAN', N'SR', N'RAJA', N'THIYAGU', N'thiyagu.shenll@gmail.customer_id', N'9626024288', N'9626943111', N'M', CAST(N'1989-07-06T00:00:00.000' AS DateTime), N'test', N'test', N'636105', N'tes', CAST(N'2018-10-01T11:24:46.147' AS DateTime), CAST(N'1900-01-01' AS Date), N'customer')
INSERT [dbo].[Prod_People] ([Id], [FirstName], [LastName], [NickName], [ShortName], [Email], [FirstPhone], [SecondPhone], [Gender], [BDay], [Bio], [HomeTown], [PinCode], [AvatarUrl], [TimeStamp], [ModifyDate], [type]) VALUES (N'PROIND001-PERSON9', N'THIYAGARAJAN', N'SR', N'RAJA', N'THIYAGU', N'thiyagu.shenll@gmail.customer_id', N'9626024288', N'9626943111', N'M', CAST(N'1989-07-06T00:00:00.000' AS DateTime), N'test', N'test', N'636105', N'tes', CAST(N'2018-10-01T11:26:31.413' AS DateTime), CAST(N'1900-01-01' AS Date), N'customer')
INSERT [dbo].[Prod_People] ([Id], [FirstName], [LastName], [NickName], [ShortName], [Email], [FirstPhone], [SecondPhone], [Gender], [BDay], [Bio], [HomeTown], [PinCode], [AvatarUrl], [TimeStamp], [ModifyDate], [type]) VALUES (N'PROIND001-PERSONA', N'THIYAGARAJAN', N'SR', N'RAJA', N'THIYAGU', N'thiyagu.shenll@gmail.customer_id', N'9626024288', N'9626943111', N'M', CAST(N'1989-07-06T00:00:00.000' AS DateTime), N'test', N'test', N'636105', N'tes', CAST(N'2018-10-01T11:28:15.953' AS DateTime), CAST(N'1900-01-01' AS Date), N'customer')
INSERT [dbo].[Prod_People] ([Id], [FirstName], [LastName], [NickName], [ShortName], [Email], [FirstPhone], [SecondPhone], [Gender], [BDay], [Bio], [HomeTown], [PinCode], [AvatarUrl], [TimeStamp], [ModifyDate], [type]) VALUES (N'PROIND001-PERSONB', N'THIYAGARAJAN', N'SR', N'RAJA', N'THIYAGU', N'thiyagu.shenll@gmail.com', N'9626024288', N'9626943111', N'M', CAST(N'1989-07-06T00:00:00.000' AS DateTime), N'test', N'test', N'636105', N'tes', CAST(N'2018-10-01T13:00:59.770' AS DateTime), CAST(N'1900-01-01' AS Date), N'customer')
SET IDENTITY_INSERT [dbo].[Prod_Site_Api_Url] ON 

INSERT [dbo].[Prod_Site_Api_Url] ([Id], [SiteUrl], [ApiUrl], [Location], [CreatedDate], [Status]) VALUES (1, N'', N'http://localhost:52376/ProdIndAppApi/ProdIndAppData/', N'local', CAST(N'2018-10-01T13:21:31.217' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Prod_Site_Api_Url] OFF
SET IDENTITY_INSERT [dbo].[Prod_TempJSON_Details] ON 

INSERT [dbo].[Prod_TempJSON_Details] ([JSONId], [JSONRequest], [JSONResponse], [JSONResponseTimeStamp], [TimeStamp]) VALUES (1, N'{
  "ModuleId": "101",
  "FirstName": "THIYAGARAJAN",
  "LastName": "SR",
  "NickName": "RAJA",
  "ShortName": "THIYAGU",
  "Email": "thiyagu.shenll@gmail.customer_id",
  "FirstPhone": "",
  "SecondPhone": "",
  "Gender": "",
  "BDay": "",
  "Bio": "",
  "HomeTown": "",
  "PinCode": "",
  "AvatarUrl": ""
}', NULL, CAST(N'2018-09-29T20:14:38.383' AS DateTime), CAST(N'2018-09-29T20:14:38.300' AS DateTime))
INSERT [dbo].[Prod_TempJSON_Details] ([JSONId], [JSONRequest], [JSONResponse], [JSONResponseTimeStamp], [TimeStamp]) VALUES (2, N'{
  "ModuleId": "101",
  "FirstName": "THIYAGARAJAN",
  "LastName": "SR",
  "NickName": "RAJA",
  "ShortName": "THIYAGU",
  "Email": "thiyagu.shenll@gmail.customer_id",
  "FirstPhone": "",
  "SecondPhone": "",
  "Gender": "",
  "BDay": "",
  "Bio": "",
  "HomeTown": "",
  "PinCode": "",
  "AvatarUrl": ""
}', NULL, CAST(N'2018-09-29T20:17:00.260' AS DateTime), CAST(N'2018-09-29T20:17:00.253' AS DateTime))
INSERT [dbo].[Prod_TempJSON_Details] ([JSONId], [JSONRequest], [JSONResponse], [JSONResponseTimeStamp], [TimeStamp]) VALUES (3, N'{
  "ModuleId": "101",
  "FirstName": "THIYAGARAJAN",
  "LastName": "SR",
  "NickName": "RAJA",
  "ShortName": "THIYAGU",
  "Email": "thiyagu.shenll@gmail.customer_id",
  "FirstPhone": "9626024288",
  "SecondPhone": "9626943111",
  "Gender": "M",
  "BDay": "07-06-1989",
  "Bio": "test",
  "HomeTown": "test",
  "PinCode": "636105",
  "AvatarUrl": "tes"
}', NULL, CAST(N'2018-09-29T20:19:53.187' AS DateTime), CAST(N'2018-09-29T20:19:53.167' AS DateTime))
INSERT [dbo].[Prod_TempJSON_Details] ([JSONId], [JSONRequest], [JSONResponse], [JSONResponseTimeStamp], [TimeStamp]) VALUES (4, N'{
		"ModuleId": "101",
		"FirstName": "THIYAGARAJAN",
		"LastName": "SR",
		"NickName": "RAJA",
		"ShortName": "THIYAGU",
		"Email": "thiyagu.shenll@gmail.customer_id",
		"FirstPhone": "9626024288",
		"SecondPhone": "9626943111",
		"Gender": "M",
		"BDay": "07-06-1989",
		"Bio": "test",
		"HomeTown": "test",
		"PinCode": "636105",
		"AvatarUrl": "tes"
	}', N'{"response": [ {"Status":"successfully registered!!!"} ]}', CAST(N'2018-10-01T11:26:31.427' AS DateTime), CAST(N'2018-10-01T11:26:31.413' AS DateTime))
INSERT [dbo].[Prod_TempJSON_Details] ([JSONId], [JSONRequest], [JSONResponse], [JSONResponseTimeStamp], [TimeStamp]) VALUES (5, N'{
  "ModuleId": "101",
  "FirstName": "THIYAGARAJAN",
  "LastName": "SR",
  "NickName": "RAJA",
  "ShortName": "THIYAGU",
  "Email": "thiyagu.shenll@gmail.customer_id",
  "FirstPhone": "9626024288",
  "SecondPhone": "9626943111",
  "Gender": "M",
  "BDay": "07-06-1989",
  "Bio": "test",
  "HomeTown": "test",
  "PinCode": "636105",
  "AvatarUrl": "tes"
}', N'{"response": [ {"Status":"successfully registered!!!"} ]}', CAST(N'2018-10-01T11:28:15.953' AS DateTime), CAST(N'2018-10-01T11:28:15.937' AS DateTime))
INSERT [dbo].[Prod_TempJSON_Details] ([JSONId], [JSONRequest], [JSONResponse], [JSONResponseTimeStamp], [TimeStamp]) VALUES (6, N'{
  "ModuleId": "101",
  "FirstName": "THIYAGARAJAN",
  "LastName": "SR",
  "NickName": "RAJA",
  "ShortName": "THIYAGU",
  "Email": "",
  "FirstPhone": "9626024288",
  "SecondPhone": "9626943111",
  "Gender": "M",
  "BDay": "07-06-1989",
  "Bio": "test",
  "HomeTown": "test",
  "PinCode": "636105",
  "AvatarUrl": "tes"
}', N'{"response":"null"}', CAST(N'2018-10-01T12:10:07.830' AS DateTime), CAST(N'2018-10-01T12:10:07.813' AS DateTime))
INSERT [dbo].[Prod_TempJSON_Details] ([JSONId], [JSONRequest], [JSONResponse], [JSONResponseTimeStamp], [TimeStamp]) VALUES (7, N'{
  "ModuleId": "101",
  "FirstName": "THIYAGARAJAN",
  "LastName": "SR",
  "NickName": "RAJA",
  "ShortName": "THIYAGU",
  "Email": "",
  "FirstPhone": "9626024288",
  "SecondPhone": "9626943111",
  "Gender": "M",
  "BDay": "07-06-1989",
  "Bio": "test",
  "HomeTown": "test",
  "PinCode": "636105",
  "AvatarUrl": "tes"
}', N'{"response": [ {"Status":0, "Message":"Please enter your email address"} ]}', CAST(N'2018-10-01T13:00:31.527' AS DateTime), CAST(N'2018-10-01T13:00:31.517' AS DateTime))
INSERT [dbo].[Prod_TempJSON_Details] ([JSONId], [JSONRequest], [JSONResponse], [JSONResponseTimeStamp], [TimeStamp]) VALUES (8, N'{
  "ModuleId": "101",
  "FirstName": "THIYAGARAJAN",
  "LastName": "SR",
  "NickName": "RAJA",
  "ShortName": "THIYAGU",
  "Email": "thiyagu.shenll@gmail.com",
  "FirstPhone": "9626024288",
  "SecondPhone": "9626943111",
  "Gender": "M",
  "BDay": "07-06-1989",
  "Bio": "test",
  "HomeTown": "test",
  "PinCode": "636105",
  "AvatarUrl": "tes"
}', N'{"response": [ {"Status":1, "Message":"Thanks for you registration, log in here."} ]}', CAST(N'2018-10-01T13:00:59.770' AS DateTime), CAST(N'2018-10-01T13:00:59.753' AS DateTime))
INSERT [dbo].[Prod_TempJSON_Details] ([JSONId], [JSONRequest], [JSONResponse], [JSONResponseTimeStamp], [TimeStamp]) VALUES (9, N'{
  "ModuleId": "101",
  "FirstName": "THIYAGARAJAN",
  "LastName": "SR",
  "NickName": "RAJA",
  "ShortName": "THIYAGU",
  "Email": "thiyagu.shenll@gmail.com",
  "FirstPhone": "9626024288",
  "SecondPhone": "9626943111",
  "Gender": "M",
  "BDay": "07-06-1989",
  "Bio": "test",
  "HomeTown": "test",
  "PinCode": "636105",
  "AvatarUrl": "tes"
}', N'{"response": [ {"Status":0, "Message":"This phone number is already in use"} ]}', CAST(N'2018-10-01T13:01:08.800' AS DateTime), CAST(N'2018-10-01T13:01:08.800' AS DateTime))
INSERT [dbo].[Prod_TempJSON_Details] ([JSONId], [JSONRequest], [JSONResponse], [JSONResponseTimeStamp], [TimeStamp]) VALUES (10, N'{
  "ModuleId": "101",
  "FirstName": "THIYAGARAJAN",
  "LastName": "SR",
  "NickName": "RAJA",
  "ShortName": "THIYAGU",
  "Email": "thiyagu.shenll@gmail.com",
  "FirstPhone": "9626024287",
  "SecondPhone": "9626943111",
  "Gender": "M",
  "BDay": "07-06-1989",
  "Bio": "test",
  "HomeTown": "test",
  "PinCode": "636105",
  "AvatarUrl": "tes"
}', N'{"response": [ {"Status":0, "Message":"This phone number is already in use"} ]}', CAST(N'2018-10-01T13:01:59.877' AS DateTime), CAST(N'2018-10-01T13:01:59.867' AS DateTime))
INSERT [dbo].[Prod_TempJSON_Details] ([JSONId], [JSONRequest], [JSONResponse], [JSONResponseTimeStamp], [TimeStamp]) VALUES (11, N'{
  "ModuleId": "101",
  "FirstName": "THIYAGARAJAN",
  "LastName": "SR",
  "NickName": "RAJA",
  "ShortName": "THIYAGU",
  "Email": "thiyagu.shenll@gmail.com",
  "FirstPhone": "9626024287",
  "SecondPhone": "9626943111",
  "Gender": "M",
  "BDay": "07-06-1989",
  "Bio": "test",
  "HomeTown": "test",
  "PinCode": "636105",
  "AvatarUrl": "tes"
}', N'{"response": [ {"Status":0, "Message":"This phone number is already in use"} ]}', CAST(N'2018-10-01T13:02:27.147' AS DateTime), CAST(N'2018-10-01T13:02:27.143' AS DateTime))
INSERT [dbo].[Prod_TempJSON_Details] ([JSONId], [JSONRequest], [JSONResponse], [JSONResponseTimeStamp], [TimeStamp]) VALUES (12, N'{
  "ModuleId": "101",
  "FirstName": "THIYAGARAJAN",
  "LastName": "SR",
  "NickName": "RAJA",
  "ShortName": "THIYAGU",
  "Email": "thiyagu.shenll@gmail.com",
  "FirstPhone": "9626024287",
  "SecondPhone": "9626943111",
  "Gender": "M",
  "BDay": "07-06-1989",
  "Bio": "test",
  "HomeTown": "test",
  "PinCode": "636105",
  "AvatarUrl": "tes"
}', N'{"response": [ {"Status":0, "Message":"This email address is already in use"} ]}', CAST(N'2018-10-01T13:04:24.777' AS DateTime), CAST(N'2018-10-01T13:04:24.767' AS DateTime))
INSERT [dbo].[Prod_TempJSON_Details] ([JSONId], [JSONRequest], [JSONResponse], [JSONResponseTimeStamp], [TimeStamp]) VALUES (13, N'{
  "ModuleId": "101",
  "FirstName": "THIYAGARAJAN",
  "LastName": "SR",
  "NickName": "RAJA",
  "ShortName": "THIYAGU",
  "Email": "thiyagu1.shenll@gmail.com",
  "FirstPhone": "9626024288",
  "SecondPhone": "9626943111",
  "Gender": "M",
  "BDay": "07-06-1989",
  "Bio": "test",
  "HomeTown": "test",
  "PinCode": "636105",
  "AvatarUrl": "tes"
}', N'{"response": [ {"Status":0, "Message":"This phone number is already in use"} ]}', CAST(N'2018-10-01T13:04:37.560' AS DateTime), CAST(N'2018-10-01T13:04:37.560' AS DateTime))
SET IDENTITY_INSERT [dbo].[Prod_TempJSON_Details] OFF
ALTER TABLE [dbo].[Prod_Api_Log] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Prod_Error_Log] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Prod_Modules_Data_Product_App] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Prod_People] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Prod_People] ADD  DEFAULT (getdate()) FOR [ModifyDate]
GO
ALTER TABLE [dbo].[Prod_Site_Api_Url] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Prod_TempJSON_Details] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Prod_Api_Log]    Script Date: 10/1/2018 1:23:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  
 SP				: Proc_Prod_Api_Log
 DESCRIPTION	:   
 CREATEDBY		: THIYAGARAJAN SR
 CREATEDDATE	: 29-09-2018
*/
CREATE PROCEDURE [dbo].[Proc_Prod_Api_Log]        

@JsonRequest varchar(MAX),
@JsonResponse varchar(MAX)

AS
BEGIN

BEGIN TRY

INSERT INTO Prod_Api_Log (JsonRequest,JsonResponse,[TimeStamp]) VALUES (isnull(@JsonRequest,''),isnull(@JsonResponse,''),GETDATE())  

END TRY

BEGIN CATCH

INSERT INTO Prod_Error_Log(ErrorCode,[Description],SourceFile) VALUES (ISNULL(ltrim(str(error_number())),''),'Error: '+ISNULL(error_message(),'')+' occurred at line# '+ISNULL(ltrim(str(error_line())),'') + ERROR_PROCEDURE(),'Proc_Prod_Api_Log')  

END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[Proc_Prod_Get_Row_Id]    Script Date: 10/1/2018 1:23:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  
 SP				: Proc_Prod_Get_Row_Id
 DESCRIPTION	:   
 CREATEDBY		: THIYAGARAJAN SR
 CREATEDDATE	: 29-09-2018
*/
CREATE PROCEDURE [dbo].[Proc_Prod_Get_Row_Id]
@T_Name nvarchar(40), @Row_Id nvarchar(48) OUTPUT
WITH EXEC AS CALLER
AS
BEGIN
	DECLARE @StrCP NVARCHAR(3);
	DECLARE @StrLP NVARCHAR(3);
	DECLARE @StrSP NVARCHAR(3);
	DECLARE @StrNS NVARCHAR(32);
	DECLARE @StrSN NVARCHAR(6);

	SELECT @StrCP = Corporate_Prefix, @StrLP = Location_Prefix, @StrSP = Site_Prefix, @StrNS = Next_Suffix, @StrSN = Short_Name
	FROM Prod_IDSeq_Prefix, Prod_IDSeq_Suffix WHERE Table_Name = @T_Name;

	EXEC dbo.Proc_Prod_Update_Id @StrNS OUTPUT;

	Update Prod_IDSeq_Suffix SET Next_Suffix = @StrNS WHERE Table_Name = @T_Name;

	SET @Row_Id = @StrCP +@StrLP + @StrSP + '-' + @StrSN + @StrNS;

END;
GO
/****** Object:  StoredProcedure [dbo].[Proc_Prod_Get_Temp_JSon_Details]    Script Date: 10/1/2018 1:23:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*    
 SP			: Proc_Prod_Get_Temp_JSon_Details   
 DESCRIPTION:  
 CREATEDBY  : THIYAGARAJAN SR  
 CREATEDDATE: 25-09-2018
*/    
    
CREATE PROCEDURE [dbo].[Proc_Prod_Get_Temp_JSon_Details]

@JSonId varchar(MAX),  
@JSonResponse varchar(MAX) output

AS    
BEGIN

BEGIN TRY

 If(@JSonId is not null AND @JSonId <>'') 
 
 BEGIN

  SELECT @JSonResponse=JSONResponse FROM Prod_TempJSON_Details(NOLOCK) WHERE JSONId = @JSonId

 END

END TRY

BEGIN CATCH           

INSERT INTO Prod_Error_Log(ErrorCode,[Description],SourceFile) VALUES (ISNULL(ltrim(str(error_number())),''),'Error: '+ISNULL(error_message(),'')+' occurred at line# '+ISNULL(ltrim(str(error_line())),'') + ERROR_PROCEDURE(),'Proc_Prod_Get_Temp_JSon_Details')  

END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[Proc_Prod_Inc_Char]    Script Date: 10/1/2018 1:23:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  
 SP				: Proc_Prod_Inc_Char
 DESCRIPTION	:   
 CREATEDBY		: THIYAGARAJAN SR
 CREATEDDATE	: 29-09-2018

*/
CREATE PROCEDURE [dbo].[Proc_Prod_Inc_Char]
@StrChar nvarchar(32) OUTPUT, @B_IncChar nvarchar(5) OUTPUT
WITH EXEC AS CALLER
AS
BEGIN
	DECLARE @IdX INT;
	DECLARE @OffSet INT =47
	DECLARE @X INT = 1;

	SET  @B_IncChar  = 'TRUE';

	SET @IdX = 0;

	WHILE @X  < 37
	   BEGIN
		   IF @X > 10
				SET @OffSet = 54;
        
			 IF @StrChar = CHAR(@OffSet + @X) 
			  BEGIN
				   SET @IdX = @X;
				   BREAK;
				END;
		   SET @X = @X + 1;
	END;

	IF @IdX < 36 
	   BEGIN
		  IF @IdX = 10 
			   SET @OffSet = 54;
		  SET @StrChar = CHAR (@OffSet +@IdX + 1);
		  SET  @B_IncChar = 'FALSE';
		END;
	ELSE
		BEGIN
			SET @StrChar = CHAR(48);
			SET @B_IncChar = 'TRUE'; 
		END;

END;
GO
/****** Object:  StoredProcedure [dbo].[Proc_Prod_Increment_Id]    Script Date: 10/1/2018 1:23:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  
 SP				: Proc_Prod_Increment_Id
 DESCRIPTION	:   
 CREATEDBY		: THIYAGARAJAN SR
 CREATEDDATE	: 29-09-2018

*/
CREATE PROCEDURE [dbo].[Proc_Prod_Increment_Id]
@StrToInc nvarchar(32) OUTPUT, @IdX int, @B_Increment_Id nvarchar(5) OUTPUT
WITH EXEC AS CALLER
AS
BEGIN 
	DECLARE @StrChar nvarchar(32);

	SET @B_Increment_Id = 'FALSE';
	SET @StrChar = substring(@StrToInc, @IdX, 1);

	EXEC Proc_Prod_Inc_Char @StrChar OUTPUT,@B_Increment_Id OUTPUT;

	Set @StrToInc = substring(@StrToInc, 1,(@IdX-1 )) +@StrChar + RIGHT(@StrToInc, (len(@StrToInc) - @IdX));

END;
GO
/****** Object:  StoredProcedure [dbo].[Proc_Prod_Json_Parsing]    Script Date: 10/1/2018 1:23:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*    
 SP			: Proc_Prod_Json_Parsing    
 DESCRIPTION: This sp is the main sp for json parsing    
 CREATEDBY  : THIYAGARAJAN SR  
 CREATEDDATE: 25-09-2018  
  
*/    
    
CREATE procedure [dbo].[Proc_Prod_Json_Parsing]      
@JSONRequestValue VARCHAR(max),      
@TempJSONId INT OUTPUT      
AS      
BEGIN

SET NOCOUNT ON;

 BEGIN TRY

   DECLARE @ResponseData VARCHAR(max);
   DECLARE @ModuleId VARCHAR(100);
   DECLARE @SpName VARCHAR(4000);
   DECLARE @MethodType VARCHAR(5);
   DECLARE @CustomerId INT;
   DECLARE @GuId VARCHAR(50);  
    
   INSERT INTO Prod_TempJSON_Details(JSONRequest) VALUES (@JSONRequestValue)      
   SELECT @TempJSONId = SCOPE_IDENTITY()  
    
   SELECT @ModuleId =  JSON_VALUE(@JSONRequestValue, '$.ModuleId')     
  
   --SELECT @CustomerId =  JSON_VALUE(@JSONRequestValue, '$.customer_id')    
    
   SELECT @SpName = ProcessName, @MethodType = MethodType FROM Prod_Modules_Data_Product_App(nolock) WHERE ModuleId = @ModuleId    
    
   IF (@SpName IS NOT NULL AND @SpName !='')  
  
    EXEC @SpName  @JSONRequestValue, @ResponseData OUTPUT    
  
  ELSE  
  
    SET @ResponseData = '{"response":"null"}';  
    
  SET @GuId = NEWID();  
  SET @ResponseData = JSON_MODIFY(@ResponseData, '$.response.serial', @GuId);  
  
  UPDATE Prod_TempJSON_Details SET JSONResponse = @ResponseData, JSONResponseTimeStamp = GetDate() WHERE JSONId = @TempJSONId     
      
  RETURN

 END TRY 

 BEGIN CATCH

  INSERT INTO Prod_Error_Log(ErrorCode,[Description],SourceFile) VALUES (ISNULL(ltrim(str(error_number())),''),'Error: '+ISNULL(error_message(),'')+' occurred at line# '+ISNULL(ltrim(str(error_line())),'') + ERROR_PROCEDURE(),'Proc_Prod_Json_Parsing')  
  
 END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[Proc_Prod_Register]    Script Date: 10/1/2018 1:23:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*      
 SP			: Proc_Prod_Register     
 DESCRIPTION:  
 CREATEDBY  : THIYAGARAJAN SR    
 CREATEDDATE: 25-09-2018    
    
*/      
     
CREATE procedure [dbo].[Proc_Prod_Register]        
@JSONRequestValue VARCHAR(max),
@ResponseData VARCHAR(max) OUTPUT
AS        
BEGIN  
  
SET NOCOUNT ON;  
  
BEGIN TRY  

	DECLARE @Row_Id nvarchar(100)
	DECLARE @FirstName VARCHAR(50);  
	DECLARE @LastName VARCHAR(50); 
	DECLARE @NickName VARCHAR(50);  
	DECLARE @ShortName VARCHAR(50);
	DECLARE @Email VARCHAR(50);
	DECLARE @EmailPeople VARCHAR(50);
	DECLARE @FirstPhone VARCHAR(50);
	DECLARE @FirstPhonePeople VARCHAR(50);
	DECLARE @SecondPhone VARCHAR(50); 
	DECLARE @Gender VARCHAR(6);
	DECLARE @BDay VARCHAR(50);
	DECLARE @Bio VARCHAR(250);
	DECLARE @HomeTown VARCHAR(250);  
	DECLARE @PinCode VARCHAR(10);  
	DECLARE @AvatarUrl VARCHAR(max); 

	DECLARE @Tmp_JSON_Input TABLE ( json_key	VARCHAR(20), json_value	NVARCHAR(1000), json_type	INT )

	INSERT INTO @Tmp_JSON_Input (json_key, json_value, json_type) SELECT [key], value, [type] FROM OPENJSON(@JSONRequestValue);

	SELECT @FirstName	= json_value FROM @Tmp_JSON_Input WHERE json_key = 'FirstName';		
	SELECT @LastName	= json_value FROM @Tmp_JSON_Input WHERE json_key = 'LastName';		
	SELECT @NickName	= json_value FROM @Tmp_JSON_Input WHERE json_key = 'NickName';		
	SELECT @ShortName	= json_value FROM @Tmp_JSON_Input WHERE json_key = 'ShortName';		
	SELECT @Email		= json_value FROM @Tmp_JSON_Input WHERE json_key = 'Email';		
	SELECT @FirstPhone	= json_value FROM @Tmp_JSON_Input WHERE json_key = 'FirstPhone';		
	SELECT @SecondPhone = json_value FROM @Tmp_JSON_Input WHERE json_key = 'SecondPhone';		
	SELECT @Gender		= json_value FROM @Tmp_JSON_Input WHERE json_key = 'Gender';		
	SELECT @BDay		= json_value FROM @Tmp_JSON_Input WHERE json_key = 'BDay';		
	SELECT @Bio			= json_value FROM @Tmp_JSON_Input WHERE json_key = 'Bio';		
	SELECT @HomeTown	= json_value FROM @Tmp_JSON_Input WHERE json_key = 'HomeTown';	
	SELECT @PinCode		= json_value FROM @Tmp_JSON_Input WHERE json_key = 'PinCode';	
	SELECT @AvatarUrl	= json_value FROM @Tmp_JSON_Input WHERE json_key = 'AvatarUrl';	

	SELECT @EmailPeople = Email, @FirstPhonePeople = FirstPhone FROM Prod_People(NOLOCK) WHERE (Email=LOWER(@Email) OR FirstPhone=@FirstPhone);

	IF (@Email IS NULL OR @Email = '') 
	BEGIN
		SET @ResponseData = '{"response": [ {"Status":0, "Message":"Please enter your email address"} ]}'; 
		RETURN
	END

	IF (@FirstPhone IS NULL OR @FirstPhone = '') 
	BEGIN
		SET @ResponseData = '{"response": [ {"Status":0, "Message":"Please enter your phone number"} ]}'; 
		RETURN
	END

	IF (@EmailPeople = LOWER(@Email)) 
	BEGIN
		SET @ResponseData = '{"response": [ {"Status":0, "Message":"This email address is already in use"} ]}'; 
		RETURN
	END

	IF (@FirstPhonePeople = @FirstPhone) 
	BEGIN
		SET @ResponseData = '{"response": [ {"Status":0, "Message":"This phone number is already in use"} ]}'; 
		RETURN
	END

	IF (@Email IS NOT NULL AND @Email != '' AND @FirstPhone IS NOT NULL AND @FirstPhone !='') 
	BEGIN
		EXEC Proc_Prod_Get_Row_Id 'Prod_People', @Row_Id OUTPUT  
		
		INSERT INTO Prod_People (Id,FirstName,LastName,NickName,ShortName,Email,FirstPhone,SecondPhone,Gender,BDay,Bio,HomeTown,PinCode,AvatarUrl,ModifyDate,[type]) VALUES 
		(@Row_Id, @FirstName, @LastName, @NickName, @ShortName, LOWER(@Email), @FirstPhone, @SecondPhone, @Gender, @BDay, @Bio, @HomeTown, @PinCode, @AvatarUrl,'','customer' )

		IF (@Row_Id IS NOT NULL AND @Row_Id !='')    
		BEGIN

			SET @ResponseData = '{"response": [ {"Status":1, "Message":"Thanks for you registration, log in here."} ]}'; 
			RETURN  
			
		END
		ELSE 
		BEGIN

			SET @ResponseData = '{"response":"null"}'; 
			RETURN
		END
	END
	ELSE 
	BEGIN

		SET @ResponseData = '{"response":"null"}'; 
		RETURN
	END
	   
  --SET @ResponseData = JSON_MODIFY(@ResponseData, '$.response.serial');    
  
 END TRY   
  
 BEGIN CATCH  
  
  INSERT INTO Prod_Error_Log(ErrorCode,[Description],SourceFile) VALUES (ISNULL(ltrim(str(error_number())),''),'Error: '+ISNULL(error_message(),'')+' occurred at line# '+ISNULL(ltrim(str(error_line())),'') + ERROR_PROCEDURE(),'Proc_Prod_Json_Parsing')    
    
 END CATCH  
  
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_Prod_Update_Id]    Script Date: 10/1/2018 1:23:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  
 SP				: Proc_Prod_Update_Id
 DESCRIPTION	:   
 CREATEDBY		: THIYAGARAJAN SR
 CREATEDDATE	: 29-09-2018

*/
CREATE PROCEDURE [dbo].[Proc_Prod_Update_Id]
@StrId nvarchar(32) OUTPUT
WITH EXEC AS CALLER
AS
BEGIN
	DECLARE @IdX INT;
	DECLARE @BolCarry NVARCHAR(5);

	SET @BolCarry = 'TRUE';
	SET @IdX = len(@StrId);
	WHILE @BolCarry = 'TRUE' AND @IdX > 0
		 BEGIN
			 EXEC Proc_Prod_Increment_Id @StrId OUTPUT, @IdX, @BolCarry OUTPUT;
			 SET @IdX = @IdX - 1;
		 END;
	IF @IdX = 0 and @BolCarry = 'TRUE' 
		SET  @StrId = '1'+@StrId;

END;
GO
USE [master]
GO
ALTER DATABASE [ProdIndApp_Dev] SET  READ_WRITE 
GO
