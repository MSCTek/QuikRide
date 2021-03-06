/****** Object:  Table [dbo].[Barcode]    Script Date: 4/15/2019 10:27:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Barcode](
	[BarcodeId] [uniqueidentifier] NOT NULL,
	[BarcodeTypeId] [int] NOT NULL,
	[DataJson] [nvarchar](4000) NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Barcode] PRIMARY KEY CLUSTERED 
(
	[BarcodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BarcodeScanLog]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BarcodeScanLog](
	[BarcodeScanLogId] [uniqueidentifier] NOT NULL,
	[BarcodeId] [uniqueidentifier] NOT NULL,
	[UserId] [int] NOT NULL,
	[DeviceOperatingSystem] [varchar](255) NULL,
	[DeviceOperatingSystemVersion] [varchar](255) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[DataJson] [nvarchar](4000) NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_BarcodeScanLog] PRIMARY KEY CLUSTERED 
(
	[BarcodeScanLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BarcodeType]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BarcodeType](
	[BarcodeTypeId] [int] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_BarcodeType] PRIMARY KEY CLUSTERED 
(
	[BarcodeTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BarcodeTypeTranslation]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BarcodeTypeTranslation](
	[BarcodeTypeTranslationId] [int] IDENTITY(1,1) NOT NULL,
	[BarcodeTypeId] [int] NOT NULL,
	[LanguageTypeId] [int] NOT NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[DisplayPriority] [int] NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [AK_BarcodeTypeTranslation] UNIQUE CLUSTERED 
(
	[BarcodeTypeId] ASC,
	[LanguageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusRoute]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusRoute](
	[BusRouteId] [int] IDENTITY(1,1) NOT NULL,
	[BusRouteNumber] [int] NOT NULL,
	[InServiceSince] [date] NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_BusRoute] PRIMARY KEY CLUSTERED 
(
	[BusRouteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusRouteStop]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusRouteStop](
	[BusRouteStopId] [int] IDENTITY(1,1) NOT NULL,
	[BusRouteId] [int] NOT NULL,
	[LocationId] [uniqueidentifier] NOT NULL,
	[IsMajorStop] [bit] NOT NULL,
	[IsPublishedStop] [bit] NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_BusRouteStop] PRIMARY KEY CLUSTERED 
(
	[BusRouteStopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusRouteTranslation]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusRouteTranslation](
	[BusRouteTranslationId] [int] IDENTITY(1,1) NOT NULL,
	[BusRouteId] [int] NOT NULL,
	[LanguageTypeId] [int] NOT NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[DisplayPriority] [int] NOT NULL,
	[Description] [nvarchar](1024) NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [AK_BusRouteTranslation] UNIQUE CLUSTERED 
(
	[BusRouteId] ASC,
	[LanguageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Driver]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver](
	[DriverId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[IsEligibleForDriving] [bit] NOT NULL,
	[CurrentVehicleId] [int] NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[DriverId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DriverShift]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DriverShift](
	[DriverShiftId] [uniqueidentifier] NOT NULL,
	[DriverId] [int] NOT NULL,
	[StartUtcDate] [datetime2](7) NOT NULL,
	[EndUtcDate] [datetime2](7) NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_DriverShift] PRIMARY KEY CLUSTERED 
(
	[DriverShiftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackId] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](1024) NULL,
	[Description] [nvarchar](2048) NULL,
	[FeedbackTypeId] [int] NOT NULL,
	[FeedbackInitiatorTypeId] [int] NOT NULL,
	[Source] [varchar](50) NOT NULL,
	[Latitude] [float] NOT NULL,
	[Longitude] [float] NOT NULL,
	[Dispositioned] [bit] NOT NULL,
	[UserId] [int] NULL,
	[DriverId] [int] NULL,
	[VehicleId] [int] NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[FeedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedbackInitiatorType]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedbackInitiatorType](
	[FeedbackInitiatorTypeId] [int] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_FeedbackInitiatorType] PRIMARY KEY CLUSTERED 
(
	[FeedbackInitiatorTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedbackInitiatorTypeTranslation]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedbackInitiatorTypeTranslation](
	[FeedbackInitiatorTypeTranslationId] [int] IDENTITY(1,1) NOT NULL,
	[FeedbackInitiatorTypeId] [int] NOT NULL,
	[LanguageTypeId] [int] NOT NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[DisplayPriority] [int] NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [AK_FeedbackInitiatorTypeTranslation] UNIQUE CLUSTERED 
(
	[FeedbackInitiatorTypeId] ASC,
	[LanguageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedbackType]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedbackType](
	[FeedbackTypeId] [int] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_FeedbackType] PRIMARY KEY CLUSTERED 
(
	[FeedbackTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedbackTypeTranslation]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedbackTypeTranslation](
	[FeedbackTypeTranslationId] [int] IDENTITY(1,1) NOT NULL,
	[FeedbackTypeId] [int] NOT NULL,
	[LanguageTypeId] [int] NOT NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[DisplayPriority] [int] NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [AK_FeedbackTypeTranslation] UNIQUE CLUSTERED 
(
	[FeedbackTypeId] ASC,
	[LanguageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GenderType]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenderType](
	[GenderTypeId] [int] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_GenderType] PRIMARY KEY CLUSTERED 
(
	[GenderTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GenderTypeTranslation]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenderTypeTranslation](
	[GenderTypeTranslationId] [int] IDENTITY(1,1) NOT NULL,
	[GenderTypeId] [int] NOT NULL,
	[LanguageTypeId] [int] NOT NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[DisplayPriority] [int] NOT NULL,
	[Description] [nvarchar](1024) NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [AK_GenderTypeTranslation] UNIQUE CLUSTERED 
(
	[GenderTypeId] ASC,
	[LanguageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Holiday]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holiday](
	[HolidayId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Holiday] PRIMARY KEY CLUSTERED 
(
	[HolidayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HolidayTranslation]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HolidayTranslation](
	[HolidayTranslationId] [int] IDENTITY(1,1) NOT NULL,
	[HolidayId] [int] NOT NULL,
	[LanguageTypeId] [int] NOT NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[DisplayPriority] [int] NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [AK_HolidayTranslation] UNIQUE CLUSTERED 
(
	[HolidayId] ASC,
	[LanguageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LanguageType]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LanguageType](
	[LanguageTypeId] [int] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[DisplayText] [nvarchar](128) NOT NULL,
	[DisplayPriority] [int] NOT NULL,
	[NativeName] [nvarchar](100) NOT NULL,
	[ThreeLetterISOLanguageName] [nchar](3) NOT NULL,
	[TwoLetterISOLanguageName] [nchar](2) NOT NULL,
	[LanguageCultureIdentifier] [int] NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_LanguageType] PRIMARY KEY CLUSTERED 
(
	[LanguageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationId] [uniqueidentifier] NOT NULL,
	[LocationTypeId] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[AddressLine1] [varchar](100) NULL,
	[AddressLine2] [varchar](100) NULL,
	[City] [varchar](100) NOT NULL,
	[State] [varchar](100) NOT NULL,
	[PostalCode] [varchar](100) NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationType]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationType](
	[LocationTypeId] [int] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_LocationType] PRIMARY KEY CLUSTERED 
(
	[LocationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationTypeTranslation]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationTypeTranslation](
	[LocationTypeTranslationId] [int] IDENTITY(1,1) NOT NULL,
	[LocationTypeId] [int] NOT NULL,
	[LanguageTypeId] [int] NOT NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[DisplayPriority] [int] NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [AK_LocationTypeTranslation] UNIQUE CLUSTERED 
(
	[LocationTypeId] ASC,
	[LanguageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationType]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationType](
	[NotificationTypeId] [int] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_NotificationType] PRIMARY KEY CLUSTERED 
(
	[NotificationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationTypeTranslation]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationTypeTranslation](
	[NotificationTypeTranslationId] [int] IDENTITY(1,1) NOT NULL,
	[NotificationTypeId] [int] NOT NULL,
	[LanguageTypeId] [int] NOT NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[DisplayPriority] [int] NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [AK_NotificationTypeTranslation] UNIQUE CLUSTERED 
(
	[NotificationTypeId] ASC,
	[LanguageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[ReservationId] [uniqueidentifier] NOT NULL,
	[UserId] [int] NOT NULL,
	[PickUpLocationId] [uniqueidentifier] NOT NULL,
	[DestinationLocationId] [uniqueidentifier] NOT NULL,
	[ReservationRequestOptionId] [int] NOT NULL,
	[ReservationStatusTypeId] [int] NOT NULL,
	[ReservationCancellationReasonId] [int] NULL,
	[NumberOfAdults] [int] NOT NULL,
	[NumberOfChildren] [int] NOT NULL,
	[NumberOfBabies] [int] NOT NULL,
	[NumberOfWheelchairs] [int] NOT NULL,
	[NumberOfBikes] [int] NOT NULL,
	[PersonalCareAttendantIncluded] [bit] NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationCancellationReasonType]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationCancellationReasonType](
	[ReservationCancellationReasonTypeId] [int] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ReservationCancellationReasonType] PRIMARY KEY CLUSTERED 
(
	[ReservationCancellationReasonTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationCancellationReasonTypeTranslation]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationCancellationReasonTypeTranslation](
	[ReservationCancellationReasonTypeTranslationId] [int] IDENTITY(1,1) NOT NULL,
	[ReservationCancellationReasonTypeId] [int] NOT NULL,
	[LanguageTypeId] [int] NOT NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[DisplayPriority] [int] NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [AK_ReservationCancellationReasonTypeTranslation] UNIQUE CLUSTERED 
(
	[ReservationCancellationReasonTypeId] ASC,
	[LanguageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationRequest]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationRequest](
	[ReservationRequestId] [uniqueidentifier] NOT NULL,
	[UserId] [int] NOT NULL,
	[PickupLocationId] [uniqueidentifier] NOT NULL,
	[DestinationLocationId] [uniqueidentifier] NOT NULL,
	[ReservationRequestStatusTypeId] [int] NOT NULL,
	[ReservationRequestCancellationReasonTypeId] [int] NULL,
	[RequestedPickupStart] [datetime2](7) NULL,
	[RequestedPickupEnd] [datetime2](7) NULL,
	[RequestedArrivalStart] [datetime2](7) NULL,
	[RequestedArrivalEnd] [datetime2](7) NULL,
	[NumberOfAdults] [int] NOT NULL,
	[NumberOfChildren] [int] NOT NULL,
	[NumberOfBabies] [int] NOT NULL,
	[NumberOfWheelchairs] [int] NULL,
	[NumberOfBikes] [int] NULL,
	[PersonalCareAttendantIncluded] [bit] NOT NULL,
	[PassengerRequiresAssistance] [bit] NOT NULL,
	[ReservationId] [uniqueidentifier] NULL,
	[ReplacesReservationId] [uniqueidentifier] NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ReservationRequest] PRIMARY KEY CLUSTERED 
(
	[ReservationRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationRequestCancellationReasonType]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationRequestCancellationReasonType](
	[ReservationRequestCancellationReasonTypeId] [int] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ReservationRequestCancellationReasonType] PRIMARY KEY CLUSTERED 
(
	[ReservationRequestCancellationReasonTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationRequestCancellationReasonTypeTranslation]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationRequestCancellationReasonTypeTranslation](
	[ReservationRequestCancellationReasonTypeTranslationId] [int] IDENTITY(1,1) NOT NULL,
	[ReservationRequestCancellationReasonTypeId] [int] NOT NULL,
	[LanguageTypeId] [int] NOT NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[DisplayPriority] [int] NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [AK_ReservationRequestCancellationReasonTypeTranslation] UNIQUE CLUSTERED 
(
	[ReservationRequestCancellationReasonTypeId] ASC,
	[LanguageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationRequestOption]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationRequestOption](
	[ReservationRequestOptionId] [int] NOT NULL,
	[ReservationRequestId] [uniqueidentifier] NOT NULL,
	[SuggestedPickupStart] [datetime2](7) NOT NULL,
	[SuggestedPickupEnd] [datetime2](7) NOT NULL,
	[EstimatedArrivalStart] [datetime2](7) NOT NULL,
	[EstimatedArrivalEnd] [datetime2](7) NOT NULL,
	[Score] [int] NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ReservationRequestOption] PRIMARY KEY CLUSTERED 
(
	[ReservationRequestOptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationRequestStatusType]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationRequestStatusType](
	[ReservationRequestStatusTypeId] [int] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ReservationRequestStatusType] PRIMARY KEY CLUSTERED 
(
	[ReservationRequestStatusTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationRequestStatusTypeTranslation]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationRequestStatusTypeTranslation](
	[ReservationRequestStatusTypeTranslationId] [int] IDENTITY(1,1) NOT NULL,
	[ReservationRequestStatusTypeId] [int] NOT NULL,
	[LanguageTypeId] [int] NOT NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[DisplayPriority] [int] NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [AK_ReservationRequestStatusTypeTranslation] UNIQUE CLUSTERED 
(
	[ReservationRequestStatusTypeId] ASC,
	[LanguageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationStatusType]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationStatusType](
	[ReservationStatusTypeId] [int] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ReservationStatusType] PRIMARY KEY CLUSTERED 
(
	[ReservationStatusTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationStatusTypeTranslation]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationStatusTypeTranslation](
	[ReservationStatusTypeTranslationId] [int] IDENTITY(1,1) NOT NULL,
	[ReservationStatusTypeId] [int] NOT NULL,
	[LanguageTypeId] [int] NOT NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[DisplayPriority] [int] NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [AK_ReservationStatusTypeTranslation] UNIQUE CLUSTERED 
(
	[ReservationStatusTypeId] ASC,
	[LanguageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ride]    Script Date: 4/15/2019 10:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ride](
	[RideId] [uniqueidentifier] NOT NULL,
	[Start] [datetime2](7) NULL,
	[StartLatitude] [float] NULL,
	[StartLongitude] [float] NULL,
	[End] [datetime2](7) NULL,
	[EndLatitude] [float] NULL,
	[EndLongitude] [float] NULL,
	[VehicleId] [int] NOT NULL,
	[DriverId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[DurationInSeconds] [int] NULL,
	[GeoDistance] [int] NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Ride] PRIMARY KEY CLUSTERED 
(
	[RideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RidePosition]    Script Date: 4/15/2019 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RidePosition](
	[RidePositionId] [uniqueidentifier] NOT NULL,
	[RideId] [uniqueidentifier] NOT NULL,
	[Latitude] [numeric](18, 10) NOT NULL,
	[Longitude] [numeric](18, 10) NOT NULL,
	[TS] [datetime2](7) NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RidePosition] PRIMARY KEY CLUSTERED 
(
	[RidePositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RideServiceType]    Script Date: 4/15/2019 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RideServiceType](
	[RideServiceTypeId] [int] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RideServiceType] PRIMARY KEY CLUSTERED 
(
	[RideServiceTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RideServiceTypeTranslation]    Script Date: 4/15/2019 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RideServiceTypeTranslation](
	[RideServiceTypeTranslationId] [int] IDENTITY(1,1) NOT NULL,
	[RideServiceTypeId] [int] NOT NULL,
	[LanguageTypeId] [int] NOT NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[DisplayPriority] [int] NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [AK_RideServiceTypeTranslation] UNIQUE CLUSTERED 
(
	[RideServiceTypeId] ASC,
	[LanguageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRewardAccount]    Script Date: 4/15/2019 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRewardAccount](
	[UserRewardAccountId] [uniqueidentifier] NOT NULL,
	[UserId] [int] NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_UserRewardAccount] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRewardAccountTransaction]    Script Date: 4/15/2019 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRewardAccountTransaction](
	[UserRewardAccountTransactionId] [uniqueidentifier] NOT NULL,
	[UserRewardAccountId] [uniqueidentifier] NOT NULL,
	[UserRewardAccountTransactionTypeId] [int] NOT NULL,
	[Value] [int] NULL,
	[Memo] [nvarchar](1000) NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_UserRewardAccountTransaction] PRIMARY KEY CLUSTERED 
(
	[UserRewardAccountTransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRewardAccountTransactionType]    Script Date: 4/15/2019 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRewardAccountTransactionType](
	[UserRewardAccountTransactionTypeId] [int] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[DebitOrCredit] [char](1) NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_UserRewardAccountTransactionType] PRIMARY KEY CLUSTERED 
(
	[UserRewardAccountTransactionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRewardAccountTransactionTypeTranslation]    Script Date: 4/15/2019 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRewardAccountTransactionTypeTranslation](
	[UserRewardAccountTransactionTypeTranslationId] [int] IDENTITY(1,1) NOT NULL,
	[UserRewardAccountTransactionTypeId] [int] NOT NULL,
	[LanguageTypeId] [int] NOT NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[DisplayPriority] [int] NOT NULL,
	[Description] [nvarchar](1024) NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [AK_UserRewardAccountTransactionTypeTranslation] UNIQUE CLUSTERED 
(
	[UserRewardAccountTransactionTypeId] ASC,
	[LanguageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/15/2019 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[BirthDate] [datetime2](7) NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[GenderTypeId] [int] NOT NULL,
	[Password] [nvarchar](255) NULL,
	[Salt] [nvarchar](255) NULL,
	[LastLogin] [datetime2](7) NOT NULL,
	[PreferredLanguageId] [int] NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users_Location]    Script Date: 4/15/2019 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users_Location](
	[UserId] [int] NOT NULL,
	[LocationId] [uniqueidentifier] NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Users_Location] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users_NotificationType]    Script Date: 4/15/2019 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users_NotificationType](
	[UserId] [int] NOT NULL,
	[NotificationTypeId] [int] NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Users_NotificationType] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[NotificationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 4/15/2019 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[VehicleId] [int] IDENTITY(1,1) NOT NULL,
	[VehicleTypeId] [int] NOT NULL,
	[VehicleStatusTypeId] [int] NOT NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[VIN] [char](17) NOT NULL,
	[LicensePlateNumber] [varchar](10) NULL,
	[StartDateInService] [date] NOT NULL,
	[EndDateInService] [date] NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[VehicleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle_BusRoute]    Script Date: 4/15/2019 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle_BusRoute](
	[VehicleId] [int] NOT NULL,
	[BusRouteId] [int] NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Vehicle_BusRoute] PRIMARY KEY CLUSTERED 
(
	[VehicleId] ASC,
	[BusRouteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle_VehicleFeatureType]    Script Date: 4/15/2019 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle_VehicleFeatureType](
	[VehicleId] [int] NOT NULL,
	[VehicleFeatureTypeId] [int] NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Vehicle_VehicleFeatureType] PRIMARY KEY CLUSTERED 
(
	[VehicleId] ASC,
	[VehicleFeatureTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleFeatureType]    Script Date: 4/15/2019 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleFeatureType](
	[VehicleFeatureTypeId] [int] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_VehicleFeatureType] PRIMARY KEY CLUSTERED 
(
	[VehicleFeatureTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleFeatureTypeTranslation]    Script Date: 4/15/2019 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleFeatureTypeTranslation](
	[VehicleFeatureTypeTranslationId] [int] IDENTITY(1,1) NOT NULL,
	[VehicleFeatureTypeId] [int] NOT NULL,
	[LanguageTypeId] [int] NOT NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[DisplayPriority] [int] NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [AK_VehicleFeatureTypeTranslation] UNIQUE CLUSTERED 
(
	[VehicleFeatureTypeId] ASC,
	[LanguageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleStatusType]    Script Date: 4/15/2019 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleStatusType](
	[VehicleStatusTypeId] [int] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_VehicleStatusType] PRIMARY KEY CLUSTERED 
(
	[VehicleStatusTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleStatusTypeTranslation]    Script Date: 4/15/2019 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleStatusTypeTranslation](
	[VehicleStatusTypeTranslationId] [int] IDENTITY(1,1) NOT NULL,
	[VehicleStatusTypeId] [int] NOT NULL,
	[LanguageTypeId] [int] NOT NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[DisplayPriority] [int] NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [AK_VehicleStatusTypeTranslation] UNIQUE CLUSTERED 
(
	[VehicleStatusTypeId] ASC,
	[LanguageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleType]    Script Date: 4/15/2019 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleType](
	[VehicleTypeId] [int] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[DisplayText] [nvarchar](128) NOT NULL,
	[DisplayPriority] [int] NOT NULL,
	[Description] [nvarchar](1024) NULL,
	[Capacity] [int] NULL,
	[LengthInFeetMin] [float] NULL,
	[LengthInFeetMax] [float] NULL,
	[LengthWithBumpers] [float] NULL,
	[WidthInFeet] [float] NULL,
	[WidthWithMirrorsInFeet] [float] NULL,
	[HeightInFeet] [float] NULL,
	[WheelbaseInFeet] [float] NULL,
	[FrontOverhangInFeet] [float] NULL,
	[RearOverhangInFeet] [float] NULL,
	[GroundClearanceInFeet] [float] NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_VehicleType] PRIMARY KEY CLUSTERED 
(
	[VehicleTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleType_VehicleFeatureType]    Script Date: 4/15/2019 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleType_VehicleFeatureType](
	[VehicleTypeId] [int] NOT NULL,
	[VehicleFeatureTypeId] [int] NOT NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_VehicleType_VehicleFeatureType] PRIMARY KEY CLUSTERED 
(
	[VehicleTypeId] ASC,
	[VehicleFeatureTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Barcode] ([BarcodeId], [BarcodeTypeId], [DataJson], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (N'aa7269e0-f3b6-4982-932d-6dc9260db518', 2, N'{"vehicleId":"2"}', 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[Barcode] ([BarcodeId], [BarcodeTypeId], [DataJson], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (N'814d7f13-1262-4608-afbb-b332e416cdc8', 1, N'{"busRouteStopId":"2"}', 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[BarcodeScanLog] ([BarcodeScanLogId], [BarcodeId], [UserId], [DeviceOperatingSystem], [DeviceOperatingSystemVersion], [Latitude], [Longitude], [DataJson], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (N'5d7ea162-2d99-42e0-a6e4-277ed815d775', N'814d7f13-1262-4608-afbb-b332e416cdc8', 3, N'iOS', N'11.4.1', 42.0500207, -87.9021503, N'{"embarkBusRouteStopId":"7", "disembarkBusRouteStopId":"9"}', 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[BarcodeScanLog] ([BarcodeScanLogId], [BarcodeId], [UserId], [DeviceOperatingSystem], [DeviceOperatingSystemVersion], [Latitude], [Longitude], [DataJson], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (N'e6e1d5b8-86dc-435b-865c-3c552e2d2106', N'aa7269e0-f3b6-4982-932d-6dc9260db518', 2, N'Pie', N'9', 41.8742605, -87.8165563, N'{"embarkBusRouteStopId":"2", "disembarkBusRouteStopId":"4"}', 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[BarcodeType] ([BarcodeTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'USERREWARD_BUSSTOP', 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[BarcodeType] ([BarcodeTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'USERREWARD_VEHICLE', 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[BarcodeTypeTranslation] ON 

INSERT [dbo].[BarcodeTypeTranslation] ([BarcodeTypeTranslationId], [BarcodeTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, 1, 1, N'Bus Stop', 100, 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[BarcodeTypeTranslation] ([BarcodeTypeTranslationId], [BarcodeTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, 2, 1, N'Vehicle', 110, 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[BarcodeTypeTranslation] OFF
SET IDENTITY_INSERT [dbo].[BusRoute] ON 

INSERT [dbo].[BusRoute] ([BusRouteId], [BusRouteNumber], [InServiceSince], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, 305, NULL, 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[BusRoute] ([BusRouteId], [BusRouteNumber], [InServiceSince], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, 208, CAST(N'2005-03-20' AS Date), 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOADz', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[BusRoute] OFF
SET IDENTITY_INSERT [dbo].[BusRouteStop] ON 

INSERT [dbo].[BusRouteStop] ([BusRouteStopId], [BusRouteId], [LocationId], [IsMajorStop], [IsPublishedStop], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, 1, N'7e640e8f-e19d-499c-9c31-89d337800b8e', 1, 1, 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[BusRouteStop] ([BusRouteStopId], [BusRouteId], [LocationId], [IsMajorStop], [IsPublishedStop], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, 1, N'e8f29db2-7f76-4f43-ab38-0da91d83a855', 1, 1, 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[BusRouteStop] ([BusRouteStopId], [BusRouteId], [LocationId], [IsMajorStop], [IsPublishedStop], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (3, 1, N'cb5da0c8-d5fc-4d1c-9f5d-a68f542f678c', 1, 1, 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[BusRouteStop] ([BusRouteStopId], [BusRouteId], [LocationId], [IsMajorStop], [IsPublishedStop], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (4, 1, N'cebecb98-654b-438b-9c91-d1a4d909de03', 1, 1, 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[BusRouteStop] ([BusRouteStopId], [BusRouteId], [LocationId], [IsMajorStop], [IsPublishedStop], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (5, 2, N'ee237273-588d-457d-92ef-2bba88256620', 1, 1, 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[BusRouteStop] ([BusRouteStopId], [BusRouteId], [LocationId], [IsMajorStop], [IsPublishedStop], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (6, 2, N'a850daf2-db96-41cf-86c5-6920c7416de7', 1, 1, 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[BusRouteStop] ([BusRouteStopId], [BusRouteId], [LocationId], [IsMajorStop], [IsPublishedStop], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (7, 2, N'72d58a2d-f287-40e6-9760-6d406d8b458c', 1, 1, 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[BusRouteStop] ([BusRouteStopId], [BusRouteId], [LocationId], [IsMajorStop], [IsPublishedStop], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (8, 2, N'a660993b-edb9-4c0f-af94-0d4e0c8c5c4a', 1, 1, 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[BusRouteStop] ([BusRouteStopId], [BusRouteId], [LocationId], [IsMajorStop], [IsPublishedStop], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (9, 2, N'41fbff2d-63c5-4761-a235-feafcc1b6f9c', 1, 1, 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[BusRouteStop] OFF
SET IDENTITY_INSERT [dbo].[BusRouteTranslation] ON 

INSERT [dbo].[BusRouteTranslation] ([BusRouteTranslationId], [BusRouteId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (3, 1, 1, N'Route 801 - Elgin-Geneva', 100, N'Provides weekday and Saturday service between Elgin and Geneva, serving the Elgin Transportation Center, Elgin Metra Station, South Elgin, Geneva Metra Station, Kane County Judicial Center and businesses on Randall Road between IL 38 and Hopps Road.Connects with Route 802 for service to Aurora as well as the St Charles-Geneva Call-n-Ride and Batavia Call-n-Ride for local service in St Charles, Geneva and Batavia', 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[BusRouteTranslation] ([BusRouteTranslationId], [BusRouteId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (4, 2, 1, N'Route 208 - Golf Road', 110, N'Provides daily service between Evanston and Schaumburg. Service operates primarily via Golf Road between Davis Street CTA Purple Line/Metra Station and the Pace Northwest Transportation Center. Service on Sundays has a shorter span of service. Serves the following major destinations: Evanston Township High School, Westfield Old Orchard, Golf Mill, Oakton Community College, Metra UP Northwest Line stations (Cumberland and Des Plaines), Pace Headquarters, Continental Towers, Meadows Corporate Center, Centennial Center, Hyatt, Woodfield Mall and Streets of Woodfield. Posted stop locations', 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[BusRouteTranslation] OFF
INSERT [dbo].[FeedbackInitiatorType] ([FeedbackInitiatorTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'CUSTOMER', 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackInitiatorType] ([FeedbackInitiatorTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'DRIVER', 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackInitiatorType] ([FeedbackInitiatorTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (4, N'DISPATCHER', 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[FeedbackInitiatorTypeTranslation] ON 

INSERT [dbo].[FeedbackInitiatorTypeTranslation] ([FeedbackInitiatorTypeTranslationId], [FeedbackInitiatorTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, 1, 1, N'Customer', 100, 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackInitiatorTypeTranslation] ([FeedbackInitiatorTypeTranslationId], [FeedbackInitiatorTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, 2, 1, N'Driver', 100, 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackInitiatorTypeTranslation] ([FeedbackInitiatorTypeTranslationId], [FeedbackInitiatorTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (3, 4, 1, N'Dispatch', 100, 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[FeedbackInitiatorTypeTranslation] OFF
INSERT [dbo].[FeedbackType] ([FeedbackTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'DRIVER_LATE', 1, CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackType] ([FeedbackTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'CHARGED_FEE_CLEAN', 1, CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackType] ([FeedbackTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (4, N'CHARGED_FEE_CANCEL', 1, CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackType] ([FeedbackTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (8, N'LOST_ITEM', 2, CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackType] ([FeedbackTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (16, N'CHARGED_OVERCHARGE', 1, CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackType] ([FeedbackTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (32, N'DRIVER_RUDE', 1, CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackType] ([FeedbackTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (64, N'PASSENGER_PROBLEM', 1, CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackType] ([FeedbackTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (128, N'DRIVER_UNSAFE', 1, CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackType] ([FeedbackTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (256, N'DRIVER_HARASS', 1, CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackType] ([FeedbackTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (512, N'DRIVER_CRIME', 1, CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackType] ([FeedbackTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1024, N'VEHICLE_QUALITY', 1, CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackType] ([FeedbackTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2048, N'DRIVER_LOST', 1, CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackType] ([FeedbackTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (4096, N'VEHICLE_DIFFERENT', 1, CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackType] ([FeedbackTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (8192, N'EXPERIENCE_POSITIVE', 2, CAST(N'2019-02-21T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackType] ([FeedbackTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (16384, N'EXPERIENCE_NEGATIVE', 2, CAST(N'2019-02-21T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[FeedbackTypeTranslation] ON 

INSERT [dbo].[FeedbackTypeTranslation] ([FeedbackTypeTranslationId], [FeedbackTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, 1, 1, N'My Driver Was Late', 100, 1, CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackTypeTranslation] ([FeedbackTypeTranslationId], [FeedbackTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, 2, 1, N'I Was Charged a Cleaning Fee', 100, 1, CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackTypeTranslation] ([FeedbackTypeTranslationId], [FeedbackTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (3, 4, 1, N'I Was Charged a Cancellation Fee', 100, 1, CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackTypeTranslation] ([FeedbackTypeTranslationId], [FeedbackTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (4, 8, 1, N'I Lost an Item', 90, 2, CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackTypeTranslation] ([FeedbackTypeTranslationId], [FeedbackTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (5, 16, 1, N'I Was Overcharged for a Ride', 100, 1, CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackTypeTranslation] ([FeedbackTypeTranslationId], [FeedbackTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (6, 32, 1, N'My Driver Was Rude', 100, 1, CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackTypeTranslation] ([FeedbackTypeTranslationId], [FeedbackTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (7, 64, 1, N'I Had a Problem With Another Ride Sharing Passenger', 100, 1, CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackTypeTranslation] ([FeedbackTypeTranslationId], [FeedbackTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (8, 128, 1, N'My Driver Was Unsafe', 100, 1, CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackTypeTranslation] ([FeedbackTypeTranslationId], [FeedbackTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (9, 256, 1, N'My Driver Harassed Me', 100, 1, CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackTypeTranslation] ([FeedbackTypeTranslationId], [FeedbackTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (10, 512, 1, N'I Witnessed My Driver Commit a Crime', 100, 1, CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackTypeTranslation] ([FeedbackTypeTranslationId], [FeedbackTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (11, 1024, 1, N'My Vehicle Seemed Beat-up or Worn Out', 100, 1, CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackTypeTranslation] ([FeedbackTypeTranslationId], [FeedbackTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (12, 2048, 1, N'My Driver Did Not Seem To Know Where They Were Going', 100, 1, CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackTypeTranslation] ([FeedbackTypeTranslationId], [FeedbackTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (13, 4096, 1, N'My Vehicle Identification Was Different From Listed Reservation', 100, 1, CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:03.8633333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackTypeTranslation] ([FeedbackTypeTranslationId], [FeedbackTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (14, 8192, 1, N'I Had a Great Experience', 80, 2, CAST(N'2019-02-21T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[FeedbackTypeTranslation] ([FeedbackTypeTranslationId], [FeedbackTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (15, 16384, 1, N'I Had a Bad Experience', 110, 2, CAST(N'2019-02-21T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[FeedbackTypeTranslation] OFF
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'MALE', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'FEMALE', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (4, N'AGENDER', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (8, N'ANDROGYNE', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (16, N'ANDROGYNOUS', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (32, N'BIGENDER', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (64, N'CISGENDER', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (128, N'FEMALE_TO_MALE', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (256, N'GENDER_FLUID', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (512, N'GENDER_NONCONFORMING', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1024, N'GENDER_QUESTIONING', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2048, N'GENDER_QUEER', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (4096, N'INTERSEX', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (8192, N'MALE_TO_FEMALE', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (16384, N'NEITHER', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (32768, N'NEUTROIS', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (65536, N'OTHER', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (131072, N'PANGENDER', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (262144, N'TRANS', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (524288, N'TRANS*', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1048576, N'TRANS_FEMALE', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2097152, N'TRANS_MALE', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (4194304, N'TRANS_PERSON', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (8388608, N'TRANSGENDER', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (16777216, N'TRANSMASCULINE', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (33554432, N'TRANSSEXUAL', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (67108864, N'TRANSSEXUAL_FEMALE', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (134217728, N'TRANSSEXUAL_MALE', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderType] ([GenderTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (268435456, N'TWO_SPIRIT', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[GenderTypeTranslation] ON 

INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, 1, 1, N'Male', 2, N'A male with a male gender identity.', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, 2, 1, N'Female', 1, N'A female with a female gender identity.', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (3, 4, 1, N'Agender', 100, N'People who lack a gender. Agender people may be of any physical sex, whether DFAB or DMAB (Female-bodied or Male-bodied), someone can still identify as Agender. Gender does not have anything to do with bodies. Think of it as SEX = BODY, GENDER = MINDSET.', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (4, 8, 1, N'Androgyne', 100, N'The combination of masculine and feminine characteristics. It can also refer to biological intersex physicality, especially with regard to plant and human sexuality.', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (5, 16, 1, N'Androgynous', 100, N'An androgynous person is a female or male who has a high degree of both feminine (expressive) and masculine (instrumental) traits. (same as the above definition)', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (6, 32, 1, N'Bigender', 100, N'A person who feels they exhibit two genders. The two genders may include any particular gender on or outside of the gender spectrum.', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (7, 64, 1, N'Cisgender', 100, N'Related types of gender identity where an individual''s experience of their own gender matches the sex they were assigned at birth.', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (8, 128, 1, N'Female to Male', 100, N'A transgender man, assigned female at birth, but identifies as male.', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (9, 256, 1, N'Gender Fluid', 100, N'A gender identity best described as a dynamic mix of boy and girl. A person who is Gender Fluid may always feel like a mix of the two traditional genders, but may feel more boy some days, and more girl other days.
Being Gender Fluid has nothing to do with which set of genitalia one has, nor their sexual orientation.', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (10, 512, 1, N'Gender Nonconforming', 100, N'Behaviour or gender expression that does not conform to dominant gender norms of male and female. People who exhibit gender variance may be called gender variant, gender non-conforming, or gender atypical.', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (11, 1024, 1, N'Gender Questioning', 100, N'In the process of exploration by people who may be unsure, still exploring, and concerned about applying a social label to themselves for various reasons.', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (12, 2048, 1, N'Gender Queer', 100, N'Catch-all category for gender identities other than man and woman, thus outside of the gender binary and cisnormativity.', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (13, 4096, 1, N'Intersex', 100, N'A variation in sex characteristics including chromosomes, gonads, or genitals that do not allow an individual to be distinctly identified as male or female.', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (14, 8192, 1, N'Male to Female', 100, N'A transgender woman, assigned male at birth, but identifies as female.', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (15, 16384, 1, N'Neither', 100, N'No definition; assume the person does not want to be identified as Male or Female.', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (16, 32768, 1, N'Neutrois', 100, N'an identity used by individuals who feel they fall outside the gender binary. Many feel Neutrois is a gender, like a third gender while others feel agendered. What they have in common is that they wish to minimize their birth gender markers.', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (17, 65536, 1, N'Other', 100, N'No definition; something other than the options available.', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (18, 131072, 1, N'Pangender', 100, N'People who do not wish to be labeled as female or male in gender, as they feel that they do not fit into binary genders because they feel they are all genders. The term has a great deal of overlap with genderqueer and is used by those in the LGBTcommunity meaning "all genders."', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (19, 262144, 1, N'Trans', 100, N'Encompassing a range of transgender identities.', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (20, 524288, 1, N'Trans*', 100, N'Umbrella term that refers to all of the identities within the gender identity spectrum. The asterisk makes special note in an effort to include all non-cisgender gender identities, including transgender, transsexual, transvestite, genderqueer, genderfluid, non-binary, genderfuck, genderless, agender, non-gendered, third gender, two-spirit, bigender, and trans man and trans woman. The origin behind the asterisk is a bit computer geeky.  When you add an asterisk to the end of a search term, you’re telling your computer to search for whatever you typed, plus any characters after (e.g., [search term*][extra letters], or trans*[-gender, -queer, -sexual, etc.]).  The idea was to include trans and other identities related to trans, in the most technical way.', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (21, 1048576, 1, N'Trans Female', 100, N'Transgender person with a female gender identity.', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (22, 2097152, 1, N'Trans Male', 100, N'Transgender person with a male gender identity.', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (23, 4194304, 1, N'Trans Person', 100, N'The state of one''s gender identity or gender expression not matching one''s assigned sex. Transgender is independent of sexual orientation; transgender people may identify as heterosexual, homosexual, bisexual, pansexual, polysexual, or asexual; some may consider conventional sexual orientation labels inadequate or inapplicable to them.', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (24, 8388608, 1, N'Transgender', 100, N'The state of one''s gender identity or gender expression not matching one''s assigned sex. Transgender is independent of sexual orientation; transgender people may identify as heterosexual, homosexual, bisexual, pansexual, polysexual, or asexual; some may consider conventional sexual orientation labels inadequate or inapplicable to them.', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (25, 16777216, 1, N'Transmasculine', 100, N'Those who were assigned female at birth, but identify as more male than female.', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (26, 33554432, 1, N'Transsexual', 100, N'Identifies with a gender inconsistent or not culturally associated with their assigned sex, i.e. in which a person''s assigned sex at birth conflicts with their psychological gender.', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (27, 67108864, 1, N'Transsexual Female', 100, N'Born a male who identifies as a female. Could have gender reassignment surgery to become a female.', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (28, 134217728, 1, N'Transsexual Male', 100, N'Born a female who identifies as a male. Could have gender reassignment surgery to become a male', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[GenderTypeTranslation] ([GenderTypeTranslationId], [GenderTypeId], [LanguageTypeId], [Value], [DisplayPriority], [Description], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (29, 268435456, 1, N'Two-Spirit', 100, N'Umbrella term sometimes used for what was once commonly known as berdaches, indigenous North Americans who fulfill one of many mixed gender roles in First Nations and Native American tribes. Third gender roles historically embodied by two-spirit people include performing work and wearing clothing associated with both men and women. The presence of male two-spirits "was a fundamental institution among most tribal peoples."', 1, CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:23.1566667' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[GenderTypeTranslation] OFF
SET IDENTITY_INSERT [dbo].[Holiday] ON 

INSERT [dbo].[Holiday] ([HolidayId], [Date], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, CAST(N'2019-01-01' AS Date), N'NEW_YEARS_2019', 2, CAST(N'2019-02-21T04:38:59.1833333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:59.1833333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[Holiday] ([HolidayId], [Date], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, CAST(N'2019-05-27' AS Date), N'MEMORIAL_DAY_2019', 2, CAST(N'2019-02-21T04:38:59.1833333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:59.1833333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[Holiday] ([HolidayId], [Date], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (3, CAST(N'2019-07-04' AS Date), N'INDEPENDENCE_DAY_2019', 2, CAST(N'2019-02-21T04:38:59.1833333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:59.1833333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[Holiday] ([HolidayId], [Date], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (4, CAST(N'2019-09-02' AS Date), N'LABOR_DAY_2019', 2, CAST(N'2019-02-21T04:38:59.1833333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:59.1833333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[Holiday] ([HolidayId], [Date], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (5, CAST(N'2019-11-28' AS Date), N'THANKSGIVING_DAY_2019', 2, CAST(N'2019-02-21T04:38:59.1833333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:59.1833333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[Holiday] ([HolidayId], [Date], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (6, CAST(N'2019-12-25' AS Date), N'CHRISTMAS_DAY_2019', 2, CAST(N'2019-02-21T04:38:59.1833333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:59.1833333' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[Holiday] OFF
SET IDENTITY_INSERT [dbo].[HolidayTranslation] ON 

INSERT [dbo].[HolidayTranslation] ([HolidayTranslationId], [HolidayId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, 1, 1, N'NEW_YEARS', 100, 1, CAST(N'2019-02-21T04:38:59.1833333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:59.1833333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[HolidayTranslation] ([HolidayTranslationId], [HolidayId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, 2, 1, N'MEMORIAL_DAY', 100, 1, CAST(N'2019-02-21T04:38:59.1833333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:59.1833333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[HolidayTranslation] ([HolidayTranslationId], [HolidayId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (3, 3, 1, N'INDEPENDENCE_DAY', 100, 1, CAST(N'2019-02-21T04:38:59.1833333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:59.1833333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[HolidayTranslation] ([HolidayTranslationId], [HolidayId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (4, 4, 1, N'LABOR_DAY', 100, 1, CAST(N'2019-02-21T04:38:59.1833333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:59.1833333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[HolidayTranslation] ([HolidayTranslationId], [HolidayId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (5, 5, 1, N'THANKSGIVING_DAY', 100, 1, CAST(N'2019-02-21T04:38:59.1833333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:59.1833333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[HolidayTranslation] ([HolidayTranslationId], [HolidayId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (6, 6, 1, N'CHRISTMAS_DAY', 100, 1, CAST(N'2019-02-21T04:38:59.1833333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:59.1833333' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[HolidayTranslation] OFF
INSERT [dbo].[LanguageType] ([LanguageTypeId], [Code], [DisplayText], [DisplayPriority], [NativeName], [ThreeLetterISOLanguageName], [TwoLetterISOLanguageName], [LanguageCultureIdentifier], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'en-US', N'English (United States)', 100, N'English (United States)', N'eng', N'en', 1033, 1, CAST(N'2019-02-21T04:37:59.4133333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:37:59.4133333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[Location] ([LocationId], [LocationTypeId], [Name], [Latitude], [Longitude], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (N'a660993b-edb9-4c0f-af94-0d4e0c8c5c4a', 1, N'Des Plaines Metra (Miner St & Lee St)', 42.0413025, -87.8866916, N'Miner St & Lee St', NULL, N'Des Plaines', N'IL', N'60016', 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[Location] ([LocationId], [LocationTypeId], [Name], [Latitude], [Longitude], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (N'e8f29db2-7f76-4f43-ab38-0da91d83a855', 1, N'Forest Park Transit Center/CTA Blue Line', 41.8742606, -87.8165564, N'', NULL, N'Forest Park', N'IL', N'60130', 1, CAST(N'2019-02-27T02:45:03.6566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:45:03.6566667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[Location] ([LocationId], [LocationTypeId], [Name], [Latitude], [Longitude], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (N'ee237273-588d-457d-92ef-2bba88256620', 1, N'Northwest Transportation Center', 42.0411231, -88.035892, NULL, NULL, N'Schaumburg', N'IL', N'60173', 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[Location] ([LocationId], [LocationTypeId], [Name], [Latitude], [Longitude], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (N'a850daf2-db96-41cf-86c5-6920c7416de7', 1, N'Cumberland Metra (485 Northwest Hwy)', 42.0525313, -87.9122748, N'485 Northwest Hwy', NULL, N'Des Plaines', N'IL', N'60016', 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[Location] ([LocationId], [LocationTypeId], [Name], [Latitude], [Longitude], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (N'72d58a2d-f287-40e6-9760-6d406d8b458c', 1, N'900 Northwest Hwy', 42.0500208, -87.9021504, N'900 E Northwest Hwy', NULL, N'Des Plaines', N'IL', N'60016', 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[Location] ([LocationId], [LocationTypeId], [Name], [Latitude], [Longitude], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (N'7e640e8f-e19d-499c-9c31-89d337800b8e', 1, N'Cicero CTA Blue Line', 41.872159, -87.744918, N'796 South Cicero Avenue', NULL, N'Chicago', N'IL', N'60644', 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[Location] ([LocationId], [LocationTypeId], [Name], [Latitude], [Longitude], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (N'cb5da0c8-d5fc-4d1c-9f5d-a68f542f678c', 1, N'Roosevelt/Austin', 41.8657613, -87.7762832, N'Austin/Roosevelt', NULL, N'Chicago', N'IL', N'60644', 2, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[Location] ([LocationId], [LocationTypeId], [Name], [Latitude], [Longitude], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (N'cebecb98-654b-438b-9c91-d1a4d909de03', 1, N'Roosevelt/Harlem', 41.8649373, -87.8066637, N'Roosevelt/Harlem', NULL, N'Forest Park', N'IL', N'60130', 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[Location] ([LocationId], [LocationTypeId], [Name], [Latitude], [Longitude], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (N'41fbff2d-63c5-4761-a235-feafcc1b6f9c', 1, N'Golf Mill Shopping Ctr (#220)', 42.0484013, -87.8375228, NULL, NULL, N'Niles', N'IL', N'60714', 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[LocationType] ([LocationTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'BUS_STOP', 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[LocationType] ([LocationTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'RESIDENTIAL', 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[LocationType] ([LocationTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (4, N'BUSINESS', 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[LocationTypeTranslation] ON 

INSERT [dbo].[LocationTypeTranslation] ([LocationTypeTranslationId], [LocationTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, 1, 1, N'Bus Stop', 100, 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[LocationTypeTranslation] ([LocationTypeTranslationId], [LocationTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, 2, 1, N'Home or Residence', 110, 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[LocationTypeTranslation] ([LocationTypeTranslationId], [LocationTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (3, 4, 1, N'Business or Organization', 120, 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[LocationTypeTranslation] OFF
INSERT [dbo].[NotificationType] ([NotificationTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'EMAIL', 1, CAST(N'2019-02-27T02:43:14.9833333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:43:14.9833333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[NotificationType] ([NotificationTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'SMS', 1, CAST(N'2019-02-27T02:43:14.9833333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:43:14.9833333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[NotificationType] ([NotificationTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (4, N'PHONE_CALL', 1, CAST(N'2019-02-27T02:43:14.9833333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:43:14.9833333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[NotificationType] ([NotificationTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (8, N'PUSH_NOTIFICATION', 1, CAST(N'2019-02-27T02:43:14.9833333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:43:14.9833333' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[NotificationTypeTranslation] ON 

INSERT [dbo].[NotificationTypeTranslation] ([NotificationTypeTranslationId], [NotificationTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, 1, 1, N'Email', 100, 1, CAST(N'2019-02-27T02:43:14.9833333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:43:14.9833333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[NotificationTypeTranslation] ([NotificationTypeTranslationId], [NotificationTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, 2, 1, N'SMS (text message)', 110, 1, CAST(N'2019-02-27T02:43:14.9833333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:43:14.9833333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[NotificationTypeTranslation] ([NotificationTypeTranslationId], [NotificationTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (3, 4, 1, N'Phone Call', 120, 1, CAST(N'2019-02-27T02:43:14.9833333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:43:14.9833333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[NotificationTypeTranslation] ([NotificationTypeTranslationId], [NotificationTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (4, 8, 1, N'Push Notification', 130, 1, CAST(N'2019-02-27T02:43:14.9833333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:43:14.9833333' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[NotificationTypeTranslation] OFF
INSERT [dbo].[ReservationCancellationReasonType] ([ReservationCancellationReasonTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'NO_LONGER_NEED', 1, CAST(N'2019-02-27T02:45:03.6566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:45:03.6600000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationCancellationReasonType] ([ReservationCancellationReasonTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'USING_ALTERNATE_TRANSPORT', 1, CAST(N'2019-02-27T02:45:03.6566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:45:03.6600000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationCancellationReasonType] ([ReservationCancellationReasonTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (4, N'DRIVER_UNAVAILABLE', 1, CAST(N'2019-02-27T02:45:03.6566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:45:03.6600000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationCancellationReasonType] ([ReservationCancellationReasonTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (8, N'REPLACED', 1, CAST(N'2019-02-27T02:45:03.6566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:45:03.6600000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationCancellationReasonType] ([ReservationCancellationReasonTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (16, N'VEHICLE_UNAVAILABLE', 1, CAST(N'2019-02-27T02:45:03.6566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:45:03.6600000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationCancellationReasonType] ([ReservationCancellationReasonTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (32, N'LINKED_RESERVATION_CANCELLED', 1, CAST(N'2019-02-27T02:45:03.6566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:45:03.6600000' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[ReservationCancellationReasonTypeTranslation] ON 

INSERT [dbo].[ReservationCancellationReasonTypeTranslation] ([ReservationCancellationReasonTypeTranslationId], [ReservationCancellationReasonTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, 1, 1, N'No longer need transportation', 100, 1, CAST(N'2019-02-27T02:45:03.6566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:45:03.6600000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationCancellationReasonTypeTranslation] ([ReservationCancellationReasonTypeTranslationId], [ReservationCancellationReasonTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, 2, 1, N'Using alternate transportation', 110, 1, CAST(N'2019-02-27T02:45:03.6566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:45:03.6600000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationCancellationReasonTypeTranslation] ([ReservationCancellationReasonTypeTranslationId], [ReservationCancellationReasonTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (3, 4, 1, N'Driver unavailable or sick', 120, 1, CAST(N'2019-02-27T02:45:03.6566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:45:03.6600000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationCancellationReasonTypeTranslation] ([ReservationCancellationReasonTypeTranslationId], [ReservationCancellationReasonTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (4, 8, 1, N'Replaced with another reservation', 130, 1, CAST(N'2019-02-27T02:45:03.6566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:45:03.6600000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationCancellationReasonTypeTranslation] ([ReservationCancellationReasonTypeTranslationId], [ReservationCancellationReasonTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (5, 16, 1, N'Vehicle unavailable or breakdown', 140, 1, CAST(N'2019-02-27T02:45:03.6566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:45:03.6600000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationCancellationReasonTypeTranslation] ([ReservationCancellationReasonTypeTranslationId], [ReservationCancellationReasonTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (6, 32, 1, N'A linked reservation was cancelled', 150, 1, CAST(N'2019-02-27T02:45:03.6566667' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:45:03.6600000' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[ReservationCancellationReasonTypeTranslation] OFF
INSERT [dbo].[ReservationRequestCancellationReasonType] ([ReservationRequestCancellationReasonTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'PICKUP_NOT_ACCEPTABLE', 1, CAST(N'2019-02-27T02:46:06.8433333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:46:06.8433333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationRequestCancellationReasonType] ([ReservationRequestCancellationReasonTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'INSUFFICIENT_CAPACITY_DRIVER', 1, CAST(N'2019-02-27T02:46:06.8433333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:46:06.8433333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationRequestCancellationReasonType] ([ReservationRequestCancellationReasonTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (4, N'INSUFFICIENT_CAPACITY_VEHICLEFEATURE', 1, CAST(N'2019-02-27T02:46:06.8433333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:46:06.8433333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationRequestCancellationReasonType] ([ReservationRequestCancellationReasonTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (8, N'RETURN_TRIP_NOT_ACCEPTABLE', 1, CAST(N'2019-02-27T02:46:06.8433333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:46:06.8433333' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[ReservationRequestCancellationReasonTypeTranslation] ON 

INSERT [dbo].[ReservationRequestCancellationReasonTypeTranslation] ([ReservationRequestCancellationReasonTypeTranslationId], [ReservationRequestCancellationReasonTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, 1, 1, N'Pick up time window is not acceptable', 100, 1, CAST(N'2019-02-27T02:46:06.8433333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:46:06.8433333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationRequestCancellationReasonTypeTranslation] ([ReservationRequestCancellationReasonTypeTranslationId], [ReservationRequestCancellationReasonTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, 2, 1, N'Insufficient capacity (driver)', 110, 1, CAST(N'2019-02-27T02:46:06.8433333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:46:06.8433333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationRequestCancellationReasonTypeTranslation] ([ReservationRequestCancellationReasonTypeTranslationId], [ReservationRequestCancellationReasonTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (3, 4, 1, N'Insufficient capacity (vehicle feature)', 120, 1, CAST(N'2019-02-27T02:46:06.8433333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:46:06.8433333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationRequestCancellationReasonTypeTranslation] ([ReservationRequestCancellationReasonTypeTranslationId], [ReservationRequestCancellationReasonTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (4, 8, 1, N'Return trip options are not acceptable', 130, 1, CAST(N'2019-02-27T02:46:06.8433333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:46:06.8433333' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[ReservationRequestCancellationReasonTypeTranslation] OFF
INSERT [dbo].[ReservationRequestStatusType] ([ReservationRequestStatusTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'PENDING_CONFIRMATION', 1, CAST(N'2019-02-27T02:46:52.6733333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:46:52.6766667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationRequestStatusType] ([ReservationRequestStatusTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'CONFIRMED', 1, CAST(N'2019-02-27T02:46:52.6733333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:46:52.6766667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationRequestStatusType] ([ReservationRequestStatusTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (4, N'CANCELLED', 1, CAST(N'2019-02-27T02:46:52.6733333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:46:52.6766667' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[ReservationRequestStatusTypeTranslation] ON 

INSERT [dbo].[ReservationRequestStatusTypeTranslation] ([ReservationRequestStatusTypeTranslationId], [ReservationRequestStatusTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, 1, 1, N'Pending Confirmation', 100, 1, CAST(N'2019-02-27T02:46:52.6733333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:46:52.6733333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationRequestStatusTypeTranslation] ([ReservationRequestStatusTypeTranslationId], [ReservationRequestStatusTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, 2, 1, N'Confirmed', 110, 1, CAST(N'2019-02-27T02:46:52.6733333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:46:52.6733333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationRequestStatusTypeTranslation] ([ReservationRequestStatusTypeTranslationId], [ReservationRequestStatusTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (3, 4, 1, N'Cancelled', 120, 1, CAST(N'2019-02-27T02:46:52.6733333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:46:52.6733333' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[ReservationRequestStatusTypeTranslation] OFF
INSERT [dbo].[ReservationStatusType] ([ReservationStatusTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'SCHEDULED', 1, CAST(N'2019-02-27T02:47:04.0133333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:47:04.0166667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationStatusType] ([ReservationStatusTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'ROUTE_PLANNED', 1, CAST(N'2019-02-27T02:47:04.0133333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:47:04.0166667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationStatusType] ([ReservationStatusTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (4, N'EN_ROUTE', 1, CAST(N'2019-02-27T02:47:04.0133333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:47:04.0166667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationStatusType] ([ReservationStatusTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (8, N'RUNNING_LATE', 1, CAST(N'2019-02-27T02:47:04.0133333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:47:04.0166667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationStatusType] ([ReservationStatusTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (16, N'ARRIVED_AT_PICKUP', 1, CAST(N'2019-02-27T02:47:04.0133333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:47:04.0166667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationStatusType] ([ReservationStatusTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (32, N'DEPARTED_PICKUP', 1, CAST(N'2019-02-27T02:47:04.0133333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:47:04.0166667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationStatusType] ([ReservationStatusTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (64, N'PASSENGER_NO_SHOW', 1, CAST(N'2019-02-27T02:47:04.0133333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:47:04.0166667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationStatusType] ([ReservationStatusTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (128, N'ARRIVED_AT_DESTINATION', 1, CAST(N'2019-02-27T02:47:04.0133333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:47:04.0166667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationStatusType] ([ReservationStatusTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (256, N'DEPARTED_DESTINATION', 1, CAST(N'2019-02-27T02:47:04.0133333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:47:04.0166667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationStatusType] ([ReservationStatusTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (512, N'CANCELLED', 1, CAST(N'2019-02-27T02:47:04.0133333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:47:04.0166667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[ReservationStatusType] ([ReservationStatusTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1024, N'PENDING_CHANGE', 1, CAST(N'2019-02-27T02:47:04.0133333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-27T02:47:04.0166667' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[UserRewardAccountTransactionType] ([UserRewardAccountTransactionTypeId], [Code], [DebitOrCredit], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'DEPOSIT', N'D', 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[UserRewardAccountTransactionType] ([UserRewardAccountTransactionTypeId], [Code], [DebitOrCredit], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'WITHDRAWAL', N'C', 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[UserRewardAccountTransactionType] ([UserRewardAccountTransactionTypeId], [Code], [DebitOrCredit], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (4, N'TRANSFER_IN', N'D', 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[UserRewardAccountTransactionType] ([UserRewardAccountTransactionTypeId], [Code], [DebitOrCredit], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (8, N'TRANSFER_OUT', N'C', 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [UserName], [Email], [BirthDate], [FirstName], [LastName], [GenderTypeId], [Password], [Salt], [LastLogin], [PreferredLanguageId], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'CurrentUser', N'currentUser@user.com', CAST(N'1999-01-01T00:00:00.0000000' AS DateTime2), N'Current', N'User', 1, N'password', N'-1', CAST(N'2019-04-02T02:07:59.1200000' AS DateTime2), 1, 1, CAST(N'2019-04-02T02:07:59.1200000' AS DateTime2), N'CurrentUser', CAST(N'2019-04-02T02:07:59.1200000' AS DateTime2), N'CurrentUser', 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [BirthDate], [FirstName], [LastName], [GenderTypeId], [Password], [Salt], [LastLogin], [PreferredLanguageId], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'Bob@example.com', N'Bob@example.com', CAST(N'1996-01-01T00:00:00.0000000' AS DateTime2), N'Bobby', N'Busrider', 1, N'', N'', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, 0, CAST(N'2019-01-01T00:00:00.0000000' AS DateTime2), N'Automated Test', CAST(N'2019-01-01T00:00:00.0000000' AS DateTime2), N'Automated Test', 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [BirthDate], [FirstName], [LastName], [GenderTypeId], [Password], [Salt], [LastLogin], [PreferredLanguageId], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (3, N'Jen@example.com', N'Jen@example.com', NULL, N'Jenny', N'Commuter', 2, N'', N'', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, 0, CAST(N'2019-01-01T00:00:00.0000000' AS DateTime2), N'Automated Test', CAST(N'2019-01-01T00:00:00.0000000' AS DateTime2), N'Automated Test', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[Vehicle] ON 

INSERT [dbo].[Vehicle] ([VehicleId], [VehicleTypeId], [VehicleStatusTypeId], [Latitude], [Longitude], [VIN], [LicensePlateNumber], [StartDateInService], [EndDateInService], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, 1, 1, NULL, NULL, N'RFGUB25147S003505', NULL, CAST(N'2017-01-01' AS Date), NULL, 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[Vehicle] ([VehicleId], [VehicleTypeId], [VehicleStatusTypeId], [Latitude], [Longitude], [VIN], [LicensePlateNumber], [StartDateInService], [EndDateInService], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, 2, 1, NULL, NULL, N'2HGEJ6322TH103411', NULL, CAST(N'2018-01-01' AS Date), NULL, 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[Vehicle] OFF
INSERT [dbo].[Vehicle_BusRoute] ([VehicleId], [BusRouteId], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, 1, 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[Vehicle_BusRoute] ([VehicleId], [BusRouteId], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, 2, 1, CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-04-04T00:00:00.0000000' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[VehicleFeatureType] ([VehicleFeatureTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'WHEELCHAIR_ACCESSIBLE', 1, CAST(N'2019-02-21T04:39:04.0533333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:39:04.0533333' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[VehicleFeatureTypeTranslation] ON 

INSERT [dbo].[VehicleFeatureTypeTranslation] ([VehicleFeatureTypeTranslationId], [VehicleFeatureTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, 1, 1, N'Wheelchair Accessible', 100, 1, CAST(N'2019-02-21T04:38:53.3433333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:53.3433333' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[VehicleFeatureTypeTranslation] OFF
INSERT [dbo].[VehicleStatusType] ([VehicleStatusTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'ACTIVE', 1, CAST(N'2019-02-21T04:38:53.3433333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:53.3433333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[VehicleStatusType] ([VehicleStatusTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'INACTIVE', 1, CAST(N'2019-02-21T04:38:53.3433333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:53.3433333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[VehicleStatusType] ([VehicleStatusTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (4, N'IN_SHOP', 1, CAST(N'2019-02-21T04:38:53.3433333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:53.3433333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[VehicleStatusType] ([VehicleStatusTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (8, N'OUT_OF_SERVICE', 1, CAST(N'2019-02-21T04:38:53.3433333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:53.3433333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[VehicleStatusType] ([VehicleStatusTypeId], [Code], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (16, N'SOLD', 1, CAST(N'2019-02-21T04:38:53.3433333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:53.3433333' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[VehicleStatusTypeTranslation] ON 

INSERT [dbo].[VehicleStatusTypeTranslation] ([VehicleStatusTypeTranslationId], [VehicleStatusTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, 1, 1, N'Active', 100, 1, CAST(N'2019-02-21T04:38:53.3433333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:53.3433333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[VehicleStatusTypeTranslation] ([VehicleStatusTypeTranslationId], [VehicleStatusTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, 2, 1, N'Inactive', 100, 1, CAST(N'2019-02-21T04:38:53.3433333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:53.3433333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[VehicleStatusTypeTranslation] ([VehicleStatusTypeTranslationId], [VehicleStatusTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (3, 4, 1, N'In Shop', 100, 1, CAST(N'2019-02-21T04:38:53.3433333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:53.3433333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[VehicleStatusTypeTranslation] ([VehicleStatusTypeTranslationId], [VehicleStatusTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (4, 8, 1, N'Out of Service', 100, 1, CAST(N'2019-02-21T04:38:53.3433333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:53.3433333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[VehicleStatusTypeTranslation] ([VehicleStatusTypeTranslationId], [VehicleStatusTypeId], [LanguageTypeId], [Value], [DisplayPriority], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (5, 16, 1, N'Sold', 100, 1, CAST(N'2019-02-21T04:38:53.3433333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:38:53.3433333' AS DateTime2), N'INITIAL LOAD', 0)
SET IDENTITY_INSERT [dbo].[VehicleStatusTypeTranslation] OFF
INSERT [dbo].[VehicleType] ([VehicleTypeId], [Code], [DisplayText], [DisplayPriority], [Description], [Capacity], [LengthInFeetMin], [LengthInFeetMax], [LengthWithBumpers], [WidthInFeet], [WidthWithMirrorsInFeet], [HeightInFeet], [WheelbaseInFeet], [FrontOverhangInFeet], [RearOverhangInFeet], [GroundClearanceInFeet], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'CONNECTOR', N'Connector', 80, NULL, 10, 20, 23, NULL, 8, NULL, 10, NULL, NULL, NULL, NULL, 1, CAST(N'2019-02-21T04:36:55.9033333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:36:55.9033333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[VehicleType] ([VehicleTypeId], [Code], [DisplayText], [DisplayPriority], [Description], [Capacity], [LengthInFeetMin], [LengthInFeetMax], [LengthWithBumpers], [WidthInFeet], [WidthWithMirrorsInFeet], [HeightInFeet], [WheelbaseInFeet], [FrontOverhangInFeet], [RearOverhangInFeet], [GroundClearanceInFeet], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'LOCAL_BUS', N'Local Bus', 90, NULL, 20, 40, NULL, 40.7, 8.5, 10, 10.5, 25, 7, 8, 11, 1, CAST(N'2019-02-21T04:36:55.9033333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:36:55.9033333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[VehicleType] ([VehicleTypeId], [Code], [DisplayText], [DisplayPriority], [Description], [Capacity], [LengthInFeetMin], [LengthInFeetMax], [LengthWithBumpers], [WidthInFeet], [WidthWithMirrorsInFeet], [HeightInFeet], [WheelbaseInFeet], [FrontOverhangInFeet], [RearOverhangInFeet], [GroundClearanceInFeet], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (4, N'EXPRESS_BUS', N'Express Bus/ART', 100, NULL, 25, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-02-21T04:36:55.9033333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:36:55.9033333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[VehicleType] ([VehicleTypeId], [Code], [DisplayText], [DisplayPriority], [Description], [Capacity], [LengthInFeetMin], [LengthInFeetMax], [LengthWithBumpers], [WidthInFeet], [WidthWithMirrorsInFeet], [HeightInFeet], [WheelbaseInFeet], [FrontOverhangInFeet], [RearOverhangInFeet], [GroundClearanceInFeet], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (8, N'VANPOOL_VAN_6', N'Vanpool Van (6)', 110, N'Passenger Van (6 capacity)', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-02-21T04:36:55.9033333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:36:55.9033333' AS DateTime2), N'INITIAL LOAD', 0)
INSERT [dbo].[VehicleType] ([VehicleTypeId], [Code], [DisplayText], [DisplayPriority], [Description], [Capacity], [LengthInFeetMin], [LengthInFeetMax], [LengthWithBumpers], [WidthInFeet], [WidthWithMirrorsInFeet], [HeightInFeet], [WheelbaseInFeet], [FrontOverhangInFeet], [RearOverhangInFeet], [GroundClearanceInFeet], [DataVersion], [CreatedUtcDate], [CreatedBy], [ModifiedUtcDate], [ModifiedBy], [IsDeleted]) VALUES (16, N'VANPOOL_VAN_14', N'Vanpool Van (14)', 100, N'Passenger Van (14 capacity)', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-02-21T04:36:55.9033333' AS DateTime2), N'INITIAL LOAD', CAST(N'2019-02-21T04:36:55.9033333' AS DateTime2), N'INITIAL LOAD', 0)
/****** Object:  Index [IX_BarcodeScanLog_UserId]    Script Date: 4/15/2019 10:27:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_BarcodeScanLog_UserId] ON [dbo].[BarcodeScanLog]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_BarcodeTypeTranslation]    Script Date: 4/15/2019 10:27:35 PM ******/
ALTER TABLE [dbo].[BarcodeTypeTranslation] ADD  CONSTRAINT [PK_BarcodeTypeTranslation] PRIMARY KEY NONCLUSTERED 
(
	[BarcodeTypeTranslationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_BusRouteTranslation]    Script Date: 4/15/2019 10:27:35 PM ******/
ALTER TABLE [dbo].[BusRouteTranslation] ADD  CONSTRAINT [PK_BusRouteTranslation] PRIMARY KEY NONCLUSTERED 
(
	[BusRouteTranslationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_FeedbackInitiatorTypeTranslation]    Script Date: 4/15/2019 10:27:35 PM ******/
ALTER TABLE [dbo].[FeedbackInitiatorTypeTranslation] ADD  CONSTRAINT [PK_FeedbackInitiatorTypeTranslation] PRIMARY KEY NONCLUSTERED 
(
	[FeedbackInitiatorTypeTranslationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_FeedbackTypeTranslation]    Script Date: 4/15/2019 10:27:35 PM ******/
ALTER TABLE [dbo].[FeedbackTypeTranslation] ADD  CONSTRAINT [PK_FeedbackTypeTranslation] PRIMARY KEY NONCLUSTERED 
(
	[FeedbackTypeTranslationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_GenderTypeTranslation]    Script Date: 4/15/2019 10:27:35 PM ******/
ALTER TABLE [dbo].[GenderTypeTranslation] ADD  CONSTRAINT [PK_GenderTypeTranslation] PRIMARY KEY NONCLUSTERED 
(
	[GenderTypeTranslationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Holiday]    Script Date: 4/15/2019 10:27:35 PM ******/
ALTER TABLE [dbo].[Holiday] ADD  CONSTRAINT [UC_Holiday] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_HolidayTranslation]    Script Date: 4/15/2019 10:27:35 PM ******/
ALTER TABLE [dbo].[HolidayTranslation] ADD  CONSTRAINT [PK_HolidayTranslation] PRIMARY KEY NONCLUSTERED 
(
	[HolidayTranslationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_LanguageType_Code]    Script Date: 4/15/2019 10:27:35 PM ******/
ALTER TABLE [dbo].[LanguageType] ADD  CONSTRAINT [UC_LanguageType_Code] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_LocationTypeTranslation]    Script Date: 4/15/2019 10:27:35 PM ******/
ALTER TABLE [dbo].[LocationTypeTranslation] ADD  CONSTRAINT [PK_LocationTypeTranslation] PRIMARY KEY NONCLUSTERED 
(
	[LocationTypeTranslationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_NotificationTypeTranslation]    Script Date: 4/15/2019 10:27:35 PM ******/
ALTER TABLE [dbo].[NotificationTypeTranslation] ADD  CONSTRAINT [PK_NotificationTypeTranslation] PRIMARY KEY NONCLUSTERED 
(
	[NotificationTypeTranslationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_ReservationCancellationReasonTypeTranslation]    Script Date: 4/15/2019 10:27:35 PM ******/
ALTER TABLE [dbo].[ReservationCancellationReasonTypeTranslation] ADD  CONSTRAINT [PK_ReservationCancellationReasonTypeTranslation] PRIMARY KEY NONCLUSTERED 
(
	[ReservationCancellationReasonTypeTranslationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_ReservationRequestCancellationReasonTypeTranslation]    Script Date: 4/15/2019 10:27:35 PM ******/
ALTER TABLE [dbo].[ReservationRequestCancellationReasonTypeTranslation] ADD  CONSTRAINT [PK_ReservationRequestCancellationReasonTypeTranslation] PRIMARY KEY NONCLUSTERED 
(
	[ReservationRequestCancellationReasonTypeTranslationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_ReservationRequestStatusTypeTranslation]    Script Date: 4/15/2019 10:27:35 PM ******/
ALTER TABLE [dbo].[ReservationRequestStatusTypeTranslation] ADD  CONSTRAINT [PK_ReservationRequestStatusTypeTranslation] PRIMARY KEY NONCLUSTERED 
(
	[ReservationRequestStatusTypeTranslationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_ReservationStatusTypeTranslation]    Script Date: 4/15/2019 10:27:35 PM ******/
ALTER TABLE [dbo].[ReservationStatusTypeTranslation] ADD  CONSTRAINT [PK_ReservationStatusTypeTranslation] PRIMARY KEY NONCLUSTERED 
(
	[ReservationStatusTypeTranslationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RidePosition_RideId]    Script Date: 4/15/2019 10:27:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_RidePosition_RideId] ON [dbo].[RidePosition]
(
	[RideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_RideServiceTypeTranslation]    Script Date: 4/15/2019 10:27:35 PM ******/
ALTER TABLE [dbo].[RideServiceTypeTranslation] ADD  CONSTRAINT [PK_RideServiceTypeTranslation] PRIMARY KEY NONCLUSTERED 
(
	[RideServiceTypeTranslationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserRewardAccount]    Script Date: 4/15/2019 10:27:35 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserRewardAccount] ON [dbo].[UserRewardAccount]
(
	[UserRewardAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_UserRewardAccountTransactionTypeTranslation]    Script Date: 4/15/2019 10:27:35 PM ******/
ALTER TABLE [dbo].[UserRewardAccountTransactionTypeTranslation] ADD  CONSTRAINT [PK_UserRewardAccountTransactionTypeTranslation] PRIMARY KEY NONCLUSTERED 
(
	[UserRewardAccountTransactionTypeTranslationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_VehicleFeatureTypeTranslation]    Script Date: 4/15/2019 10:27:35 PM ******/
ALTER TABLE [dbo].[VehicleFeatureTypeTranslation] ADD  CONSTRAINT [PK_VehicleFeatureTypeTranslation] PRIMARY KEY NONCLUSTERED 
(
	[VehicleFeatureTypeTranslationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_VehicleStatusTypeTranslation]    Script Date: 4/15/2019 10:27:35 PM ******/
ALTER TABLE [dbo].[VehicleStatusTypeTranslation] ADD  CONSTRAINT [PK_VehicleStatusTypeTranslation] PRIMARY KEY NONCLUSTERED 
(
	[VehicleStatusTypeTranslationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Barcode] ADD  CONSTRAINT [DF_Barcode_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[Barcode] ADD  CONSTRAINT [DF_Barcode_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[Barcode] ADD  CONSTRAINT [DF_Barcode_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[Barcode] ADD  CONSTRAINT [DF_Barcode_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[BarcodeScanLog] ADD  CONSTRAINT [DF_BarcodeScanLog_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[BarcodeScanLog] ADD  CONSTRAINT [DF_BarcodeScanLog_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[BarcodeScanLog] ADD  CONSTRAINT [DF_BarcodeScanLog_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[BarcodeScanLog] ADD  CONSTRAINT [DF_BarcodeScanLog_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[BarcodeType] ADD  CONSTRAINT [DF_BarcodeType_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[BarcodeType] ADD  CONSTRAINT [DF_BarcodeType_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[BarcodeType] ADD  CONSTRAINT [DF_BarcodeType_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[BarcodeType] ADD  CONSTRAINT [DF_BarcodeType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[BarcodeTypeTranslation] ADD  CONSTRAINT [DF_BarcodeTypeTranslation_DisplayPriority]  DEFAULT ((100)) FOR [DisplayPriority]
GO
ALTER TABLE [dbo].[BarcodeTypeTranslation] ADD  CONSTRAINT [DF_BarcodeTypeTranslation_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[BarcodeTypeTranslation] ADD  CONSTRAINT [DF_BarcodeTypeTranslation_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[BarcodeTypeTranslation] ADD  CONSTRAINT [DF_BarcodeTypeTranslation_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[BarcodeTypeTranslation] ADD  CONSTRAINT [DF_BarcodeTypeTranslation_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[BusRoute] ADD  CONSTRAINT [DF_BusRoute_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[BusRoute] ADD  CONSTRAINT [DF_BusRoute_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[BusRoute] ADD  CONSTRAINT [DF_BusRoute_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[BusRoute] ADD  CONSTRAINT [DF_BusRoute_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[BusRouteStop] ADD  CONSTRAINT [DF_BusRouteStop_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[BusRouteStop] ADD  CONSTRAINT [DF_BusRouteStop_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[BusRouteStop] ADD  CONSTRAINT [DF_BusRouteStop_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[BusRouteStop] ADD  CONSTRAINT [DF_BusRouteStop_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[BusRouteTranslation] ADD  CONSTRAINT [DF_BusRouteTranslation_DisplayPriority]  DEFAULT ((100)) FOR [DisplayPriority]
GO
ALTER TABLE [dbo].[BusRouteTranslation] ADD  CONSTRAINT [DF_BusRouteTranslation_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[BusRouteTranslation] ADD  CONSTRAINT [DF_BusRouteTranslation_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[BusRouteTranslation] ADD  CONSTRAINT [DF_BusRouteTranslation_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[BusRouteTranslation] ADD  CONSTRAINT [DF_BusRouteTranslation_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Driver] ADD  CONSTRAINT [DF_Driver_IsEligibleForDriving]  DEFAULT ((1)) FOR [IsEligibleForDriving]
GO
ALTER TABLE [dbo].[Driver] ADD  CONSTRAINT [DF_Driver_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[Driver] ADD  CONSTRAINT [DF_Driver_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[Driver] ADD  CONSTRAINT [DF_Driver_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[Driver] ADD  CONSTRAINT [DF_Driver_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[DriverShift] ADD  CONSTRAINT [DF_DriverShift_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[DriverShift] ADD  CONSTRAINT [DF_DriverShift_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[DriverShift] ADD  CONSTRAINT [DF_DriverShift_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[DriverShift] ADD  CONSTRAINT [DF_DriverShift_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[FeedbackInitiatorType] ADD  CONSTRAINT [DF_FeedbackInitiatorType_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[FeedbackInitiatorType] ADD  CONSTRAINT [DF_FeedbackInitiatorType_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[FeedbackInitiatorType] ADD  CONSTRAINT [DF_FeedbackInitiatorType_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[FeedbackInitiatorType] ADD  CONSTRAINT [DF_FeedbackInitiatorType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[FeedbackInitiatorTypeTranslation] ADD  CONSTRAINT [DF_FeedbackInitiatorTypeTranslation_DisplayPriority]  DEFAULT ((100)) FOR [DisplayPriority]
GO
ALTER TABLE [dbo].[FeedbackInitiatorTypeTranslation] ADD  CONSTRAINT [DF_FeedbackInitiatorTypeTranslation_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[FeedbackInitiatorTypeTranslation] ADD  CONSTRAINT [DF_FeedbackInitiatorTypeTranslation_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[FeedbackInitiatorTypeTranslation] ADD  CONSTRAINT [DF_FeedbackInitiatorTypeTranslation_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[FeedbackInitiatorTypeTranslation] ADD  CONSTRAINT [DF_FeedbackInitiatorTypeTranslation_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[FeedbackType] ADD  CONSTRAINT [DF_FeedbackType_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[FeedbackType] ADD  CONSTRAINT [DF_FeedbackType_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[FeedbackType] ADD  CONSTRAINT [DF_FeedbackType_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[FeedbackType] ADD  CONSTRAINT [DF_FeedbackType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[FeedbackTypeTranslation] ADD  CONSTRAINT [DF_FeedbackTypeTranslation_DisplayPriority]  DEFAULT ((100)) FOR [DisplayPriority]
GO
ALTER TABLE [dbo].[FeedbackTypeTranslation] ADD  CONSTRAINT [DF_FeedbackTypeTranslation_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[FeedbackTypeTranslation] ADD  CONSTRAINT [DF_FeedbackTypeTranslation_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[FeedbackTypeTranslation] ADD  CONSTRAINT [DF_FeedbackTypeTranslation_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[FeedbackTypeTranslation] ADD  CONSTRAINT [DF_FeedbackTypeTranslation_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[GenderType] ADD  CONSTRAINT [DF_GenderType_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[GenderType] ADD  CONSTRAINT [DF_GenderType_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[GenderType] ADD  CONSTRAINT [DF_GenderType_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[GenderType] ADD  CONSTRAINT [DF_GenderType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[GenderTypeTranslation] ADD  CONSTRAINT [DF_GenderTypeTranslation_DisplayPriority]  DEFAULT ((100)) FOR [DisplayPriority]
GO
ALTER TABLE [dbo].[GenderTypeTranslation] ADD  CONSTRAINT [DF_GenderTypeTranslation_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[GenderTypeTranslation] ADD  CONSTRAINT [DF_GenderTypeTranslation_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[GenderTypeTranslation] ADD  CONSTRAINT [DF_GenderTypeTranslation_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[GenderTypeTranslation] ADD  CONSTRAINT [DF_GenderTypeTranslation_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Holiday] ADD  CONSTRAINT [DF_Holiday_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[Holiday] ADD  CONSTRAINT [DF_Holiday_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[Holiday] ADD  CONSTRAINT [DF_Holiday_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[Holiday] ADD  CONSTRAINT [DF_Holiday_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[HolidayTranslation] ADD  CONSTRAINT [DF_HolidayTranslation_DisplayPriority]  DEFAULT ((100)) FOR [DisplayPriority]
GO
ALTER TABLE [dbo].[HolidayTranslation] ADD  CONSTRAINT [DF_HolidayTranslation_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[HolidayTranslation] ADD  CONSTRAINT [DF_HolidayTranslation_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[HolidayTranslation] ADD  CONSTRAINT [DF_HolidayTranslation_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[HolidayTranslation] ADD  CONSTRAINT [DF_HolidayTranslation_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[LanguageType] ADD  CONSTRAINT [DF_LanguageType_DisplayPriority]  DEFAULT ((100)) FOR [DisplayPriority]
GO
ALTER TABLE [dbo].[LanguageType] ADD  CONSTRAINT [DF_LanguageType_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[LanguageType] ADD  CONSTRAINT [DF_LanguageType_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[LanguageType] ADD  CONSTRAINT [DF_LanguageType_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[LanguageType] ADD  CONSTRAINT [DF_LanguageType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Location] ADD  CONSTRAINT [DF_Location_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[Location] ADD  CONSTRAINT [DF_Location_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[Location] ADD  CONSTRAINT [DF_Location_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[Location] ADD  CONSTRAINT [DF_Location_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[LocationType] ADD  CONSTRAINT [DF_LocationType_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[LocationType] ADD  CONSTRAINT [DF_LocationType_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[LocationType] ADD  CONSTRAINT [DF_LocationType_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[LocationType] ADD  CONSTRAINT [DF_LocationType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[LocationTypeTranslation] ADD  CONSTRAINT [DF_LocationTypeTranslation_DisplayPriority]  DEFAULT ((100)) FOR [DisplayPriority]
GO
ALTER TABLE [dbo].[LocationTypeTranslation] ADD  CONSTRAINT [DF_LocationTypeTranslation_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[LocationTypeTranslation] ADD  CONSTRAINT [DF_LocationTypeTranslation_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[LocationTypeTranslation] ADD  CONSTRAINT [DF_LocationTypeTranslation_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[LocationTypeTranslation] ADD  CONSTRAINT [DF_LocationTypeTranslation_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[NotificationType] ADD  CONSTRAINT [DF_NotificationType_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[NotificationType] ADD  CONSTRAINT [DF_NotificationType_CreatedUTCDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[NotificationType] ADD  CONSTRAINT [DF_NotificationType_ModifiedUTCDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[NotificationType] ADD  CONSTRAINT [DF_NotificationType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[NotificationTypeTranslation] ADD  CONSTRAINT [DF_NotificationTypeTranslation_DisplayPriority]  DEFAULT ((100)) FOR [DisplayPriority]
GO
ALTER TABLE [dbo].[NotificationTypeTranslation] ADD  CONSTRAINT [DF_NotificationTypeTranslation_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[NotificationTypeTranslation] ADD  CONSTRAINT [DF_NotificationTypeTranslation_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[NotificationTypeTranslation] ADD  CONSTRAINT [DF_NotificationTypeTranslation_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[NotificationTypeTranslation] ADD  CONSTRAINT [DF_NotificationTypeTranslation_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Reservation] ADD  CONSTRAINT [DF_Reservation_NumberOfWheelchairs]  DEFAULT ((0)) FOR [NumberOfWheelchairs]
GO
ALTER TABLE [dbo].[Reservation] ADD  CONSTRAINT [DF_Reservation_NumberOfBikes]  DEFAULT ((0)) FOR [NumberOfBikes]
GO
ALTER TABLE [dbo].[Reservation] ADD  CONSTRAINT [DF_Reservation_PersonalCareAttendantIncluded]  DEFAULT ((0)) FOR [PersonalCareAttendantIncluded]
GO
ALTER TABLE [dbo].[Reservation] ADD  CONSTRAINT [DF_Reservation_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[Reservation] ADD  CONSTRAINT [DF_Reservation_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[Reservation] ADD  CONSTRAINT [DF_Reservation_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[Reservation] ADD  CONSTRAINT [DF_Reservation_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ReservationCancellationReasonType] ADD  CONSTRAINT [DF_ReservationCancellationReasonType_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[ReservationCancellationReasonType] ADD  CONSTRAINT [DF_ReservationCancellationReasonType_CreatedUTCDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[ReservationCancellationReasonType] ADD  CONSTRAINT [DF_ReservationCancellationReasonType_ModifiedUTCDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[ReservationCancellationReasonType] ADD  CONSTRAINT [DF_ReservationCancellationReasonType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ReservationCancellationReasonTypeTranslation] ADD  CONSTRAINT [DF_ReservationCancellationReasonTypeTranslation_DisplayPriority]  DEFAULT ((100)) FOR [DisplayPriority]
GO
ALTER TABLE [dbo].[ReservationCancellationReasonTypeTranslation] ADD  CONSTRAINT [DF_ReservationCancellationReasonTypeTranslation_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[ReservationCancellationReasonTypeTranslation] ADD  CONSTRAINT [DF_ReservationCancellationReasonTypeTranslation_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[ReservationCancellationReasonTypeTranslation] ADD  CONSTRAINT [DF_ReservationCancellationReasonTypeTranslation_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[ReservationCancellationReasonTypeTranslation] ADD  CONSTRAINT [DF_ReservationCancellationReasonTypeTranslation_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ReservationRequest] ADD  CONSTRAINT [DF_ReservationRequest_NumberOfWheelchairs]  DEFAULT ((0)) FOR [NumberOfWheelchairs]
GO
ALTER TABLE [dbo].[ReservationRequest] ADD  CONSTRAINT [DF_ReservationRequest_NumberOfBikes]  DEFAULT ((0)) FOR [NumberOfBikes]
GO
ALTER TABLE [dbo].[ReservationRequest] ADD  CONSTRAINT [DF_ReservationRequest_PersonalCareAttendantIncluded]  DEFAULT ((0)) FOR [PersonalCareAttendantIncluded]
GO
ALTER TABLE [dbo].[ReservationRequest] ADD  CONSTRAINT [DF_ReservationRequest_PassengerRequiresAssistance]  DEFAULT ((0)) FOR [PassengerRequiresAssistance]
GO
ALTER TABLE [dbo].[ReservationRequest] ADD  CONSTRAINT [DF_ReservationRequest_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[ReservationRequest] ADD  CONSTRAINT [DF_ReservationRequest_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[ReservationRequest] ADD  CONSTRAINT [DF_ReservationRequest_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[ReservationRequest] ADD  CONSTRAINT [DF_ReservationRequest_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ReservationRequestCancellationReasonType] ADD  CONSTRAINT [DF_ReservationRequestCancellationReasonType_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[ReservationRequestCancellationReasonType] ADD  CONSTRAINT [DF_ReservationRequestCancellationReasonType_CreatedUTCDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[ReservationRequestCancellationReasonType] ADD  CONSTRAINT [DF_ReservationRequestCancellationReasonType_ModifiedUTCDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[ReservationRequestCancellationReasonType] ADD  CONSTRAINT [DF_ReservationRequestCancellationReasonType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ReservationRequestCancellationReasonTypeTranslation] ADD  CONSTRAINT [DF_ReservationRequestCancellationReasonTypeTranslation_DisplayPriority]  DEFAULT ((100)) FOR [DisplayPriority]
GO
ALTER TABLE [dbo].[ReservationRequestCancellationReasonTypeTranslation] ADD  CONSTRAINT [DF_ReservationRequestCancellationReasonTypeTranslation_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[ReservationRequestCancellationReasonTypeTranslation] ADD  CONSTRAINT [DF_ReservationRequestCancellationReasonTypeTranslation_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[ReservationRequestCancellationReasonTypeTranslation] ADD  CONSTRAINT [DF_ReservationRequestCancellationReasonTypeTranslation_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[ReservationRequestCancellationReasonTypeTranslation] ADD  CONSTRAINT [DF_ReservationRequestCancellationReasonTypeTranslation_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ReservationRequestOption] ADD  CONSTRAINT [DF_ReservationRequestOption_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ReservationRequestStatusType] ADD  CONSTRAINT [DF_ReservationRequestStatusType_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[ReservationRequestStatusType] ADD  CONSTRAINT [DF_ReservationRequestStatusType_CreatedUTCDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[ReservationRequestStatusType] ADD  CONSTRAINT [DF_ReservationRequestStatusType_ModifiedUTCDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[ReservationRequestStatusType] ADD  CONSTRAINT [DF_ReservationRequestStatusType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ReservationRequestStatusTypeTranslation] ADD  CONSTRAINT [DF_ReservationRequestStatusTypeTranslation_DisplayPriority]  DEFAULT ((100)) FOR [DisplayPriority]
GO
ALTER TABLE [dbo].[ReservationRequestStatusTypeTranslation] ADD  CONSTRAINT [DF_ReservationRequestStatusTypeTranslation_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[ReservationRequestStatusTypeTranslation] ADD  CONSTRAINT [DF_ReservationRequestStatusTypeTranslation_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[ReservationRequestStatusTypeTranslation] ADD  CONSTRAINT [DF_ReservationRequestStatusTypeTranslation_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[ReservationRequestStatusTypeTranslation] ADD  CONSTRAINT [DF_ReservationRequestStatusTypeTranslation_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ReservationStatusType] ADD  CONSTRAINT [DF_ReservationStatusType_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[ReservationStatusType] ADD  CONSTRAINT [DF_ReservationStatusType_CreatedUTCDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[ReservationStatusType] ADD  CONSTRAINT [DF_ReservationStatusType_ModifiedUTCDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[ReservationStatusType] ADD  CONSTRAINT [DF_ReservationStatusType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ReservationStatusTypeTranslation] ADD  CONSTRAINT [DF_ReservationStatusTypeTranslation_DisplayPriority]  DEFAULT ((100)) FOR [DisplayPriority]
GO
ALTER TABLE [dbo].[ReservationStatusTypeTranslation] ADD  CONSTRAINT [DF_ReservationStatusTypeTranslation_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[ReservationStatusTypeTranslation] ADD  CONSTRAINT [DF_ReservationStatusTypeTranslation_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[ReservationStatusTypeTranslation] ADD  CONSTRAINT [DF_ReservationStatusTypeTranslation_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[ReservationStatusTypeTranslation] ADD  CONSTRAINT [DF_ReservationStatusTypeTranslation_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Ride] ADD  CONSTRAINT [DF_Ride_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[Ride] ADD  CONSTRAINT [DF_Ride_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[Ride] ADD  CONSTRAINT [DF_Ride_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[Ride] ADD  CONSTRAINT [DF_Ride_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[RidePosition] ADD  CONSTRAINT [DF_RidePosition_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[RidePosition] ADD  CONSTRAINT [DF_RidePosition_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[RidePosition] ADD  CONSTRAINT [DF_RidePosition_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[RidePosition] ADD  CONSTRAINT [DF_RidePosition_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[RideServiceType] ADD  CONSTRAINT [DF_RideServiceType_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[RideServiceType] ADD  CONSTRAINT [DF_RideServiceType_CreatedUTCDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[RideServiceType] ADD  CONSTRAINT [DF_RideServiceType_ModifiedUTCDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[RideServiceType] ADD  CONSTRAINT [DF_RideServiceType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[RideServiceTypeTranslation] ADD  CONSTRAINT [DF_RideServiceTypeTranslation_DisplayPriority]  DEFAULT ((100)) FOR [DisplayPriority]
GO
ALTER TABLE [dbo].[RideServiceTypeTranslation] ADD  CONSTRAINT [DF_RideServiceTypeTranslation_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[RideServiceTypeTranslation] ADD  CONSTRAINT [DF_RideServiceTypeTranslation_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[RideServiceTypeTranslation] ADD  CONSTRAINT [DF_RideServiceTypeTranslation_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[RideServiceTypeTranslation] ADD  CONSTRAINT [DF_RideServiceTypeTranslation_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[UserRewardAccount] ADD  CONSTRAINT [DF_UserRewardAccount_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[UserRewardAccount] ADD  CONSTRAINT [DF_UserRewardAccount_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[UserRewardAccount] ADD  CONSTRAINT [DF_UserRewardAccount_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[UserRewardAccount] ADD  CONSTRAINT [DF_UserRewardAccount_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[UserRewardAccountTransaction] ADD  CONSTRAINT [DF_UserRewardAccountTransaction_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[UserRewardAccountTransaction] ADD  CONSTRAINT [DF_UserRewardAccountTransaction_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[UserRewardAccountTransaction] ADD  CONSTRAINT [DF_UserRewardAccountTransaction_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[UserRewardAccountTransaction] ADD  CONSTRAINT [DF_UserRewardAccountTransaction_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[UserRewardAccountTransactionType] ADD  CONSTRAINT [DF_UserRewardAccountTransactionType_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[UserRewardAccountTransactionType] ADD  CONSTRAINT [DF_UserRewardAccountTransactionType_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[UserRewardAccountTransactionType] ADD  CONSTRAINT [DF_UserRewardAccountTransactionType_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[UserRewardAccountTransactionType] ADD  CONSTRAINT [DF_UserRewardAccountTransactionType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[UserRewardAccountTransactionTypeTranslation] ADD  CONSTRAINT [DF_UserRewardAccountTransactionTypeTranslation_DisplayPriority]  DEFAULT ((100)) FOR [DisplayPriority]
GO
ALTER TABLE [dbo].[UserRewardAccountTransactionTypeTranslation] ADD  CONSTRAINT [DF_UserRewardAccountTransactionTypeTranslation_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[UserRewardAccountTransactionTypeTranslation] ADD  CONSTRAINT [DF_UserRewardAccountTransactionTypeTranslation_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[UserRewardAccountTransactionTypeTranslation] ADD  CONSTRAINT [DF_UserRewardAccountTransactionTypeTranslation_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[UserRewardAccountTransactionTypeTranslation] ADD  CONSTRAINT [DF_UserRewardAccountTransactionTypeTranslation_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_PreferredLanguageId]  DEFAULT ((1)) FOR [PreferredLanguageId]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Users_Location] ADD  CONSTRAINT [DF_Users_Location_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[Users_Location] ADD  CONSTRAINT [DF_Users_Location_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[Users_Location] ADD  CONSTRAINT [DF_Users_Location_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[Users_Location] ADD  CONSTRAINT [DF_Users_Location_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Users_NotificationType] ADD  CONSTRAINT [DF_Users_NotificationType_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[Users_NotificationType] ADD  CONSTRAINT [DF_Users_NotificationType_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[Users_NotificationType] ADD  CONSTRAINT [DF_Users_NotificationType_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[Users_NotificationType] ADD  CONSTRAINT [DF_Users_NotificationType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Vehicle] ADD  CONSTRAINT [DF_Vehicle_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[Vehicle] ADD  CONSTRAINT [DF_Vehicle_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[Vehicle] ADD  CONSTRAINT [DF_Vehicle_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[Vehicle] ADD  CONSTRAINT [DF_Vehicle_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Vehicle_BusRoute] ADD  CONSTRAINT [DF_Vehicle_BusRoute_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[Vehicle_BusRoute] ADD  CONSTRAINT [DF_Vehicle_BusRoute_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[Vehicle_BusRoute] ADD  CONSTRAINT [DF_Vehicle_BusRoute_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[Vehicle_BusRoute] ADD  CONSTRAINT [DF_Vehicle_BusRoute_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Vehicle_VehicleFeatureType] ADD  CONSTRAINT [DF_Vehicle_VehicleFeatureType_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[Vehicle_VehicleFeatureType] ADD  CONSTRAINT [DF_Vehicle_VehicleFeatureType_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[Vehicle_VehicleFeatureType] ADD  CONSTRAINT [DF_Vehicle_VehicleFeatureType_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[Vehicle_VehicleFeatureType] ADD  CONSTRAINT [DF_Vehicle_VehicleFeatureType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[VehicleFeatureType] ADD  CONSTRAINT [DF_VehicleFeatureType_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[VehicleFeatureType] ADD  CONSTRAINT [DF_VehicleFeatureType_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[VehicleFeatureType] ADD  CONSTRAINT [DF_VehicleFeatureType_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[VehicleFeatureType] ADD  CONSTRAINT [DF_VehicleFeatureType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[VehicleFeatureTypeTranslation] ADD  CONSTRAINT [DF_VehicleFeatureTypeTranslation_DisplayPriority]  DEFAULT ((100)) FOR [DisplayPriority]
GO
ALTER TABLE [dbo].[VehicleFeatureTypeTranslation] ADD  CONSTRAINT [DF_VehicleFeatureTypeTranslation_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[VehicleFeatureTypeTranslation] ADD  CONSTRAINT [DF_VehicleFeatureTypeTranslation_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[VehicleFeatureTypeTranslation] ADD  CONSTRAINT [DF_VehicleFeatureTypeTranslation_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[VehicleFeatureTypeTranslation] ADD  CONSTRAINT [DF_VehicleFeatureTypeTranslation_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[VehicleStatusType] ADD  CONSTRAINT [DF_VehicleStatusType_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[VehicleStatusType] ADD  CONSTRAINT [DF_VehicleStatusType_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[VehicleStatusType] ADD  CONSTRAINT [DF_VehicleStatusType_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[VehicleStatusType] ADD  CONSTRAINT [DF_VehicleStatusType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[VehicleStatusTypeTranslation] ADD  CONSTRAINT [DF_VehicleStatusTypeTranslation_DisplayPriority]  DEFAULT ((100)) FOR [DisplayPriority]
GO
ALTER TABLE [dbo].[VehicleStatusTypeTranslation] ADD  CONSTRAINT [DF_VehicleStatusTypeTranslation_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[VehicleStatusTypeTranslation] ADD  CONSTRAINT [DF_VehicleStatusTypeTranslation_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[VehicleStatusTypeTranslation] ADD  CONSTRAINT [DF_VehicleStatusTypeTranslation_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[VehicleStatusTypeTranslation] ADD  CONSTRAINT [DF_VehicleStatusTypeTranslation_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[VehicleType] ADD  CONSTRAINT [DF_VehicleType_DisplayPriority]  DEFAULT ((100)) FOR [DisplayPriority]
GO
ALTER TABLE [dbo].[VehicleType] ADD  CONSTRAINT [DF_VehicleType_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[VehicleType] ADD  CONSTRAINT [DF_VehicleType_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[VehicleType] ADD  CONSTRAINT [DF_VehicleType_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[VehicleType] ADD  CONSTRAINT [DF_VehicleType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[VehicleType_VehicleFeatureType] ADD  CONSTRAINT [DF_VehicleType_VehicleFeatureType_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO
ALTER TABLE [dbo].[VehicleType_VehicleFeatureType] ADD  CONSTRAINT [DF_VehicleType_VehicleFeatureType_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO
ALTER TABLE [dbo].[VehicleType_VehicleFeatureType] ADD  CONSTRAINT [DF_VehicleType_VehicleFeatureType_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO
ALTER TABLE [dbo].[VehicleType_VehicleFeatureType] ADD  CONSTRAINT [DF_VehicleType_VehicleFeatureType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Barcode]  WITH CHECK ADD  CONSTRAINT [FK_Barcode_BarcodeType] FOREIGN KEY([BarcodeTypeId])
REFERENCES [dbo].[BarcodeType] ([BarcodeTypeId])
GO
ALTER TABLE [dbo].[Barcode] CHECK CONSTRAINT [FK_Barcode_BarcodeType]
GO
ALTER TABLE [dbo].[BarcodeScanLog]  WITH CHECK ADD  CONSTRAINT [FK_BarcodeScanLog_Barcode] FOREIGN KEY([BarcodeId])
REFERENCES [dbo].[Barcode] ([BarcodeId])
GO
ALTER TABLE [dbo].[BarcodeScanLog] CHECK CONSTRAINT [FK_BarcodeScanLog_Barcode]
GO
ALTER TABLE [dbo].[BarcodeTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_BarcodeTypeTranslation_BarcodeType] FOREIGN KEY([BarcodeTypeId])
REFERENCES [dbo].[BarcodeType] ([BarcodeTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BarcodeTypeTranslation] CHECK CONSTRAINT [FK_BarcodeTypeTranslation_BarcodeType]
GO
ALTER TABLE [dbo].[BarcodeTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_BarcodeTypeTranslation_LanguageType] FOREIGN KEY([LanguageTypeId])
REFERENCES [dbo].[LanguageType] ([LanguageTypeId])
GO
ALTER TABLE [dbo].[BarcodeTypeTranslation] CHECK CONSTRAINT [FK_BarcodeTypeTranslation_LanguageType]
GO
ALTER TABLE [dbo].[BusRouteStop]  WITH CHECK ADD  CONSTRAINT [FK_BusRouteStop_BusRoute] FOREIGN KEY([BusRouteId])
REFERENCES [dbo].[BusRoute] ([BusRouteId])
GO
ALTER TABLE [dbo].[BusRouteStop] CHECK CONSTRAINT [FK_BusRouteStop_BusRoute]
GO
ALTER TABLE [dbo].[BusRouteStop]  WITH CHECK ADD  CONSTRAINT [FK_BusRouteStop_Location] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([LocationId])
GO
ALTER TABLE [dbo].[BusRouteStop] CHECK CONSTRAINT [FK_BusRouteStop_Location]
GO
ALTER TABLE [dbo].[BusRouteTranslation]  WITH CHECK ADD  CONSTRAINT [FK_BusRouteTranslation_BusRoute] FOREIGN KEY([BusRouteId])
REFERENCES [dbo].[BusRoute] ([BusRouteId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BusRouteTranslation] CHECK CONSTRAINT [FK_BusRouteTranslation_BusRoute]
GO
ALTER TABLE [dbo].[BusRouteTranslation]  WITH CHECK ADD  CONSTRAINT [FK_BusRouteTranslation_LanguageType] FOREIGN KEY([LanguageTypeId])
REFERENCES [dbo].[LanguageType] ([LanguageTypeId])
GO
ALTER TABLE [dbo].[BusRouteTranslation] CHECK CONSTRAINT [FK_BusRouteTranslation_LanguageType]
GO
ALTER TABLE [dbo].[Driver]  WITH CHECK ADD  CONSTRAINT [FK_Driver_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Driver] CHECK CONSTRAINT [FK_Driver_Users]
GO
ALTER TABLE [dbo].[Driver]  WITH CHECK ADD  CONSTRAINT [FK_Driver_Vehicle] FOREIGN KEY([CurrentVehicleId])
REFERENCES [dbo].[Vehicle] ([VehicleId])
GO
ALTER TABLE [dbo].[Driver] CHECK CONSTRAINT [FK_Driver_Vehicle]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_FeedbackInitiatorType] FOREIGN KEY([FeedbackInitiatorTypeId])
REFERENCES [dbo].[FeedbackInitiatorType] ([FeedbackInitiatorTypeId])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_FeedbackInitiatorType]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_FeedbackType] FOREIGN KEY([FeedbackTypeId])
REFERENCES [dbo].[FeedbackType] ([FeedbackTypeId])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_FeedbackType]
GO
ALTER TABLE [dbo].[FeedbackInitiatorTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_FeedbackInitiatorTypeTranslation_FeedbackInitiatorType] FOREIGN KEY([FeedbackInitiatorTypeId])
REFERENCES [dbo].[FeedbackInitiatorType] ([FeedbackInitiatorTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FeedbackInitiatorTypeTranslation] CHECK CONSTRAINT [FK_FeedbackInitiatorTypeTranslation_FeedbackInitiatorType]
GO
ALTER TABLE [dbo].[FeedbackInitiatorTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_FeedbackInitiatorTypeTranslation_LanguageType] FOREIGN KEY([LanguageTypeId])
REFERENCES [dbo].[LanguageType] ([LanguageTypeId])
GO
ALTER TABLE [dbo].[FeedbackInitiatorTypeTranslation] CHECK CONSTRAINT [FK_FeedbackInitiatorTypeTranslation_LanguageType]
GO
ALTER TABLE [dbo].[FeedbackTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_FeedbackTypeTranslation_FeedbackType] FOREIGN KEY([FeedbackTypeId])
REFERENCES [dbo].[FeedbackType] ([FeedbackTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FeedbackTypeTranslation] CHECK CONSTRAINT [FK_FeedbackTypeTranslation_FeedbackType]
GO
ALTER TABLE [dbo].[FeedbackTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_FeedbackTypeTranslation_LanguageType] FOREIGN KEY([LanguageTypeId])
REFERENCES [dbo].[LanguageType] ([LanguageTypeId])
GO
ALTER TABLE [dbo].[FeedbackTypeTranslation] CHECK CONSTRAINT [FK_FeedbackTypeTranslation_LanguageType]
GO
ALTER TABLE [dbo].[GenderTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_GenderTypeTranslation_GenderType] FOREIGN KEY([GenderTypeId])
REFERENCES [dbo].[GenderType] ([GenderTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GenderTypeTranslation] CHECK CONSTRAINT [FK_GenderTypeTranslation_GenderType]
GO
ALTER TABLE [dbo].[GenderTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_GenderTypeTranslation_LanguageType] FOREIGN KEY([LanguageTypeId])
REFERENCES [dbo].[LanguageType] ([LanguageTypeId])
GO
ALTER TABLE [dbo].[GenderTypeTranslation] CHECK CONSTRAINT [FK_GenderTypeTranslation_LanguageType]
GO
ALTER TABLE [dbo].[HolidayTranslation]  WITH CHECK ADD  CONSTRAINT [FK_HolidayTranslation_Holiday] FOREIGN KEY([HolidayId])
REFERENCES [dbo].[Holiday] ([HolidayId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HolidayTranslation] CHECK CONSTRAINT [FK_HolidayTranslation_Holiday]
GO
ALTER TABLE [dbo].[HolidayTranslation]  WITH CHECK ADD  CONSTRAINT [FK_HolidayTranslation_LanguageType] FOREIGN KEY([LanguageTypeId])
REFERENCES [dbo].[LanguageType] ([LanguageTypeId])
GO
ALTER TABLE [dbo].[HolidayTranslation] CHECK CONSTRAINT [FK_HolidayTranslation_LanguageType]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_LocationType] FOREIGN KEY([LocationTypeId])
REFERENCES [dbo].[LocationType] ([LocationTypeId])
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_LocationType]
GO
ALTER TABLE [dbo].[LocationTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_LocationTypeTranslation_LanguageType] FOREIGN KEY([LanguageTypeId])
REFERENCES [dbo].[LanguageType] ([LanguageTypeId])
GO
ALTER TABLE [dbo].[LocationTypeTranslation] CHECK CONSTRAINT [FK_LocationTypeTranslation_LanguageType]
GO
ALTER TABLE [dbo].[LocationTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_LocationTypeTranslation_LocationType] FOREIGN KEY([LocationTypeId])
REFERENCES [dbo].[LocationType] ([LocationTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LocationTypeTranslation] CHECK CONSTRAINT [FK_LocationTypeTranslation_LocationType]
GO
ALTER TABLE [dbo].[NotificationTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_NotificationTypeTranslation_LanguageType] FOREIGN KEY([LanguageTypeId])
REFERENCES [dbo].[LanguageType] ([LanguageTypeId])
GO
ALTER TABLE [dbo].[NotificationTypeTranslation] CHECK CONSTRAINT [FK_NotificationTypeTranslation_LanguageType]
GO
ALTER TABLE [dbo].[NotificationTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_NotificationTypeTranslation_NotificationType] FOREIGN KEY([NotificationTypeId])
REFERENCES [dbo].[NotificationType] ([NotificationTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NotificationTypeTranslation] CHECK CONSTRAINT [FK_NotificationTypeTranslation_NotificationType]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Location] FOREIGN KEY([PickUpLocationId])
REFERENCES [dbo].[Location] ([LocationId])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Location]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_ReservationCancellationReasonType] FOREIGN KEY([ReservationCancellationReasonId])
REFERENCES [dbo].[ReservationCancellationReasonType] ([ReservationCancellationReasonTypeId])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_ReservationCancellationReasonType]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_ReservationRequestOption] FOREIGN KEY([ReservationRequestOptionId])
REFERENCES [dbo].[ReservationRequestOption] ([ReservationRequestOptionId])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_ReservationRequestOption]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Users]
GO
ALTER TABLE [dbo].[ReservationCancellationReasonTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_ReservationCancellationReasonTypeTranslation_LanguageType] FOREIGN KEY([LanguageTypeId])
REFERENCES [dbo].[LanguageType] ([LanguageTypeId])
GO
ALTER TABLE [dbo].[ReservationCancellationReasonTypeTranslation] CHECK CONSTRAINT [FK_ReservationCancellationReasonTypeTranslation_LanguageType]
GO
ALTER TABLE [dbo].[ReservationCancellationReasonTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_ReservationCancellationReasonTypeTranslation_ReservationCancellationReasonType] FOREIGN KEY([ReservationCancellationReasonTypeId])
REFERENCES [dbo].[ReservationCancellationReasonType] ([ReservationCancellationReasonTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReservationCancellationReasonTypeTranslation] CHECK CONSTRAINT [FK_ReservationCancellationReasonTypeTranslation_ReservationCancellationReasonType]
GO
ALTER TABLE [dbo].[ReservationRequest]  WITH CHECK ADD  CONSTRAINT [FK_ReservationRequest_DestinationLocation] FOREIGN KEY([DestinationLocationId])
REFERENCES [dbo].[Location] ([LocationId])
GO
ALTER TABLE [dbo].[ReservationRequest] CHECK CONSTRAINT [FK_ReservationRequest_DestinationLocation]
GO
ALTER TABLE [dbo].[ReservationRequest]  WITH CHECK ADD  CONSTRAINT [FK_ReservationRequest_PickupLocation] FOREIGN KEY([PickupLocationId])
REFERENCES [dbo].[Location] ([LocationId])
GO
ALTER TABLE [dbo].[ReservationRequest] CHECK CONSTRAINT [FK_ReservationRequest_PickupLocation]
GO
ALTER TABLE [dbo].[ReservationRequest]  WITH CHECK ADD  CONSTRAINT [FK_ReservationRequest_Reservation] FOREIGN KEY([ReplacesReservationId])
REFERENCES [dbo].[Reservation] ([ReservationId])
GO
ALTER TABLE [dbo].[ReservationRequest] CHECK CONSTRAINT [FK_ReservationRequest_Reservation]
GO
ALTER TABLE [dbo].[ReservationRequest]  WITH CHECK ADD  CONSTRAINT [FK_ReservationRequest_ReservationRequestCancellationReasonType] FOREIGN KEY([ReservationRequestCancellationReasonTypeId])
REFERENCES [dbo].[ReservationRequestCancellationReasonType] ([ReservationRequestCancellationReasonTypeId])
GO
ALTER TABLE [dbo].[ReservationRequest] CHECK CONSTRAINT [FK_ReservationRequest_ReservationRequestCancellationReasonType]
GO
ALTER TABLE [dbo].[ReservationRequest]  WITH CHECK ADD  CONSTRAINT [FK_ReservationRequest_ReservationRequestStatusType] FOREIGN KEY([ReservationRequestStatusTypeId])
REFERENCES [dbo].[ReservationRequestStatusType] ([ReservationRequestStatusTypeId])
GO
ALTER TABLE [dbo].[ReservationRequest] CHECK CONSTRAINT [FK_ReservationRequest_ReservationRequestStatusType]
GO
ALTER TABLE [dbo].[ReservationRequest]  WITH CHECK ADD  CONSTRAINT [FK_ReservationRequest_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[ReservationRequest] CHECK CONSTRAINT [FK_ReservationRequest_Users]
GO
ALTER TABLE [dbo].[ReservationRequestCancellationReasonTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_ReservationRequestCancellationReasonTypeTranslation_LanguageType] FOREIGN KEY([LanguageTypeId])
REFERENCES [dbo].[LanguageType] ([LanguageTypeId])
GO
ALTER TABLE [dbo].[ReservationRequestCancellationReasonTypeTranslation] CHECK CONSTRAINT [FK_ReservationRequestCancellationReasonTypeTranslation_LanguageType]
GO
ALTER TABLE [dbo].[ReservationRequestCancellationReasonTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_ReservationRequestCancellationReasonTypeTranslation_ReservationRequestCancellationReasonType] FOREIGN KEY([ReservationRequestCancellationReasonTypeId])
REFERENCES [dbo].[ReservationRequestCancellationReasonType] ([ReservationRequestCancellationReasonTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReservationRequestCancellationReasonTypeTranslation] CHECK CONSTRAINT [FK_ReservationRequestCancellationReasonTypeTranslation_ReservationRequestCancellationReasonType]
GO
ALTER TABLE [dbo].[ReservationRequestStatusTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_ReservationRequestStatusTypeTranslation_LanguageType] FOREIGN KEY([LanguageTypeId])
REFERENCES [dbo].[LanguageType] ([LanguageTypeId])
GO
ALTER TABLE [dbo].[ReservationRequestStatusTypeTranslation] CHECK CONSTRAINT [FK_ReservationRequestStatusTypeTranslation_LanguageType]
GO
ALTER TABLE [dbo].[ReservationRequestStatusTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_ReservationRequestStatusTypeTranslation_ReservationRequestStatusType] FOREIGN KEY([ReservationRequestStatusTypeId])
REFERENCES [dbo].[ReservationRequestStatusType] ([ReservationRequestStatusTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReservationRequestStatusTypeTranslation] CHECK CONSTRAINT [FK_ReservationRequestStatusTypeTranslation_ReservationRequestStatusType]
GO
ALTER TABLE [dbo].[ReservationStatusTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_ReservationStatusTypeTranslation_LanguageType] FOREIGN KEY([LanguageTypeId])
REFERENCES [dbo].[LanguageType] ([LanguageTypeId])
GO
ALTER TABLE [dbo].[ReservationStatusTypeTranslation] CHECK CONSTRAINT [FK_ReservationStatusTypeTranslation_LanguageType]
GO
ALTER TABLE [dbo].[ReservationStatusTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_ReservationStatusTypeTranslation_ReservationStatusType] FOREIGN KEY([ReservationStatusTypeId])
REFERENCES [dbo].[ReservationStatusType] ([ReservationStatusTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReservationStatusTypeTranslation] CHECK CONSTRAINT [FK_ReservationStatusTypeTranslation_ReservationStatusType]
GO
ALTER TABLE [dbo].[Ride]  WITH CHECK ADD  CONSTRAINT [FK_Ride_Driver] FOREIGN KEY([DriverId])
REFERENCES [dbo].[Driver] ([DriverId])
GO
ALTER TABLE [dbo].[Ride] CHECK CONSTRAINT [FK_Ride_Driver]
GO
ALTER TABLE [dbo].[Ride]  WITH CHECK ADD  CONSTRAINT [FK_Ride_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Ride] CHECK CONSTRAINT [FK_Ride_Users]
GO
ALTER TABLE [dbo].[Ride]  WITH CHECK ADD  CONSTRAINT [FK_Ride_Vehicle] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[Vehicle] ([VehicleId])
GO
ALTER TABLE [dbo].[Ride] CHECK CONSTRAINT [FK_Ride_Vehicle]
GO
ALTER TABLE [dbo].[RidePosition]  WITH CHECK ADD  CONSTRAINT [FK_RidePosition_Ride] FOREIGN KEY([RideId])
REFERENCES [dbo].[Ride] ([RideId])
GO
ALTER TABLE [dbo].[RidePosition] CHECK CONSTRAINT [FK_RidePosition_Ride]
GO
ALTER TABLE [dbo].[RideServiceTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_RideServiceTypeTranslation_LanguageType] FOREIGN KEY([LanguageTypeId])
REFERENCES [dbo].[LanguageType] ([LanguageTypeId])
GO
ALTER TABLE [dbo].[RideServiceTypeTranslation] CHECK CONSTRAINT [FK_RideServiceTypeTranslation_LanguageType]
GO
ALTER TABLE [dbo].[RideServiceTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_RideServiceTypeTranslation_RideServiceType] FOREIGN KEY([RideServiceTypeId])
REFERENCES [dbo].[RideServiceType] ([RideServiceTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RideServiceTypeTranslation] CHECK CONSTRAINT [FK_RideServiceTypeTranslation_RideServiceType]
GO
ALTER TABLE [dbo].[UserRewardAccountTransaction]  WITH CHECK ADD  CONSTRAINT [FK_UserRewardAccountTransaction_UserRewardAccount] FOREIGN KEY([UserRewardAccountId])
REFERENCES [dbo].[UserRewardAccount] ([UserRewardAccountId])
GO
ALTER TABLE [dbo].[UserRewardAccountTransaction] CHECK CONSTRAINT [FK_UserRewardAccountTransaction_UserRewardAccount]
GO
ALTER TABLE [dbo].[UserRewardAccountTransaction]  WITH CHECK ADD  CONSTRAINT [FK_UserRewardAccountTransaction_UserRewardAccountTransactionType] FOREIGN KEY([UserRewardAccountTransactionTypeId])
REFERENCES [dbo].[UserRewardAccountTransactionType] ([UserRewardAccountTransactionTypeId])
GO
ALTER TABLE [dbo].[UserRewardAccountTransaction] CHECK CONSTRAINT [FK_UserRewardAccountTransaction_UserRewardAccountTransactionType]
GO
ALTER TABLE [dbo].[UserRewardAccountTransactionTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_UserRewardAccountTransactionTypeTranslation_LanguageType] FOREIGN KEY([LanguageTypeId])
REFERENCES [dbo].[LanguageType] ([LanguageTypeId])
GO
ALTER TABLE [dbo].[UserRewardAccountTransactionTypeTranslation] CHECK CONSTRAINT [FK_UserRewardAccountTransactionTypeTranslation_LanguageType]
GO
ALTER TABLE [dbo].[UserRewardAccountTransactionTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_UserRewardAccountTransactionTypeTranslation_UserRewardAccountTransactionType] FOREIGN KEY([UserRewardAccountTransactionTypeId])
REFERENCES [dbo].[UserRewardAccountTransactionType] ([UserRewardAccountTransactionTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRewardAccountTransactionTypeTranslation] CHECK CONSTRAINT [FK_UserRewardAccountTransactionTypeTranslation_UserRewardAccountTransactionType]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_GenderType_GenderTypeId] FOREIGN KEY([GenderTypeId])
REFERENCES [dbo].[GenderType] ([GenderTypeId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_GenderType_GenderTypeId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_LanguageType] FOREIGN KEY([PreferredLanguageId])
REFERENCES [dbo].[LanguageType] ([LanguageTypeId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_LanguageType]
GO
ALTER TABLE [dbo].[Users_Location]  WITH CHECK ADD  CONSTRAINT [FK_Users_Location_Location] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([LocationId])
GO
ALTER TABLE [dbo].[Users_Location] CHECK CONSTRAINT [FK_Users_Location_Location]
GO
ALTER TABLE [dbo].[Users_Location]  WITH CHECK ADD  CONSTRAINT [FK_Users_Location_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Users_Location] CHECK CONSTRAINT [FK_Users_Location_Users]
GO
ALTER TABLE [dbo].[Users_NotificationType]  WITH CHECK ADD  CONSTRAINT [FK_Users_NotificationType_NotificationType] FOREIGN KEY([NotificationTypeId])
REFERENCES [dbo].[NotificationType] ([NotificationTypeId])
GO
ALTER TABLE [dbo].[Users_NotificationType] CHECK CONSTRAINT [FK_Users_NotificationType_NotificationType]
GO
ALTER TABLE [dbo].[Users_NotificationType]  WITH CHECK ADD  CONSTRAINT [FK_Users_NotificationType_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Users_NotificationType] CHECK CONSTRAINT [FK_Users_NotificationType_Users]
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_VehicleStatusType] FOREIGN KEY([VehicleStatusTypeId])
REFERENCES [dbo].[VehicleStatusType] ([VehicleStatusTypeId])
GO
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FK_Vehicle_VehicleStatusType]
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_VehicleType] FOREIGN KEY([VehicleTypeId])
REFERENCES [dbo].[VehicleType] ([VehicleTypeId])
GO
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FK_Vehicle_VehicleType]
GO
ALTER TABLE [dbo].[Vehicle_BusRoute]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_BusRoute_BusRoute] FOREIGN KEY([BusRouteId])
REFERENCES [dbo].[BusRoute] ([BusRouteId])
GO
ALTER TABLE [dbo].[Vehicle_BusRoute] CHECK CONSTRAINT [FK_Vehicle_BusRoute_BusRoute]
GO
ALTER TABLE [dbo].[Vehicle_BusRoute]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_BusRoute_Vehicle] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[Vehicle] ([VehicleId])
GO
ALTER TABLE [dbo].[Vehicle_BusRoute] CHECK CONSTRAINT [FK_Vehicle_BusRoute_Vehicle]
GO
ALTER TABLE [dbo].[Vehicle_VehicleFeatureType]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_VehicleFeatureType_Vehicle] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[Vehicle] ([VehicleId])
GO
ALTER TABLE [dbo].[Vehicle_VehicleFeatureType] CHECK CONSTRAINT [FK_Vehicle_VehicleFeatureType_Vehicle]
GO
ALTER TABLE [dbo].[Vehicle_VehicleFeatureType]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_VehicleFeatureType_VehicleFeatureType] FOREIGN KEY([VehicleFeatureTypeId])
REFERENCES [dbo].[VehicleFeatureType] ([VehicleFeatureTypeId])
GO
ALTER TABLE [dbo].[Vehicle_VehicleFeatureType] CHECK CONSTRAINT [FK_Vehicle_VehicleFeatureType_VehicleFeatureType]
GO
ALTER TABLE [dbo].[VehicleFeatureTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_VehicleFeatureTypeTranslation_LanguageType] FOREIGN KEY([LanguageTypeId])
REFERENCES [dbo].[LanguageType] ([LanguageTypeId])
GO
ALTER TABLE [dbo].[VehicleFeatureTypeTranslation] CHECK CONSTRAINT [FK_VehicleFeatureTypeTranslation_LanguageType]
GO
ALTER TABLE [dbo].[VehicleFeatureTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_VehicleFeatureTypeTranslation_VehicleFeatureType] FOREIGN KEY([VehicleFeatureTypeId])
REFERENCES [dbo].[VehicleFeatureType] ([VehicleFeatureTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VehicleFeatureTypeTranslation] CHECK CONSTRAINT [FK_VehicleFeatureTypeTranslation_VehicleFeatureType]
GO
ALTER TABLE [dbo].[VehicleStatusTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_VehicleStatusTypeTranslation_LanguageType] FOREIGN KEY([LanguageTypeId])
REFERENCES [dbo].[LanguageType] ([LanguageTypeId])
GO
ALTER TABLE [dbo].[VehicleStatusTypeTranslation] CHECK CONSTRAINT [FK_VehicleStatusTypeTranslation_LanguageType]
GO
ALTER TABLE [dbo].[VehicleStatusTypeTranslation]  WITH CHECK ADD  CONSTRAINT [FK_VehicleStatusTypeTranslation_VehicleStatusType] FOREIGN KEY([VehicleStatusTypeId])
REFERENCES [dbo].[VehicleStatusType] ([VehicleStatusTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VehicleStatusTypeTranslation] CHECK CONSTRAINT [FK_VehicleStatusTypeTranslation_VehicleStatusType]
GO
ALTER TABLE [dbo].[VehicleType_VehicleFeatureType]  WITH CHECK ADD  CONSTRAINT [FK_VehicleType_VehicleFeatureType_VehicleFeatureType] FOREIGN KEY([VehicleFeatureTypeId])
REFERENCES [dbo].[VehicleFeatureType] ([VehicleFeatureTypeId])
GO
ALTER TABLE [dbo].[VehicleType_VehicleFeatureType] CHECK CONSTRAINT [FK_VehicleType_VehicleFeatureType_VehicleFeatureType]
GO
ALTER TABLE [dbo].[VehicleType_VehicleFeatureType]  WITH CHECK ADD  CONSTRAINT [FK_VehicleType_VehicleFeatureType_VehicleType] FOREIGN KEY([VehicleTypeId])
REFERENCES [dbo].[VehicleType] ([VehicleTypeId])
GO
ALTER TABLE [dbo].[VehicleType_VehicleFeatureType] CHECK CONSTRAINT [FK_VehicleType_VehicleFeatureType_VehicleType]
GO
/****** Object:  Trigger [dbo].[trg_Barcode_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_Barcode_Update] ON [dbo].[Barcode]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Barcode a
        INNER JOIN inserted b
          ON a.BarcodeId = b.BarcodeId


GO
ALTER TABLE [dbo].[Barcode] ENABLE TRIGGER [trg_Barcode_Update]
GO
/****** Object:  Trigger [dbo].[trg_BarcodeScanLog_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_BarcodeScanLog_Update] ON [dbo].[BarcodeScanLog]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM BarcodeScanLog a
        INNER JOIN inserted b
          ON a.BarcodeScanLogId = b.BarcodeScanLogId


GO
ALTER TABLE [dbo].[BarcodeScanLog] ENABLE TRIGGER [trg_BarcodeScanLog_Update]
GO
/****** Object:  Trigger [dbo].[trg_BarcodeType_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_BarcodeType_Update] ON [dbo].[BarcodeType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM BarcodeType a
        INNER JOIN inserted b
          ON a.BarcodeTypeId = b.BarcodeTypeId


GO
ALTER TABLE [dbo].[BarcodeType] ENABLE TRIGGER [trg_BarcodeType_Update]
GO
/****** Object:  Trigger [dbo].[trg_BarcodeTypeTranslation_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_BarcodeTypeTranslation_Update] ON [dbo].[BarcodeTypeTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM BarcodeTypeTranslation a
        INNER JOIN inserted b
          ON a.BarcodeTypeTranslationId = b.BarcodeTypeTranslationId


GO
ALTER TABLE [dbo].[BarcodeTypeTranslation] ENABLE TRIGGER [trg_BarcodeTypeTranslation_Update]
GO
/****** Object:  Trigger [dbo].[trg_BusRoute_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_BusRoute_Update] ON [dbo].[BusRoute]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM BusRoute a
        INNER JOIN inserted b
          ON a.BusRouteId = b.BusRouteId


GO
ALTER TABLE [dbo].[BusRoute] ENABLE TRIGGER [trg_BusRoute_Update]
GO
/****** Object:  Trigger [dbo].[trg_BusRouteStop_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_BusRouteStop_Update] ON [dbo].[BusRouteStop]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM BusRouteStop a
        INNER JOIN inserted b
          ON a.BusRouteStopId = b.BusRouteStopId


GO
ALTER TABLE [dbo].[BusRouteStop] ENABLE TRIGGER [trg_BusRouteStop_Update]
GO
/****** Object:  Trigger [dbo].[trg_BusRouteTranslation_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_BusRouteTranslation_Update] ON [dbo].[BusRouteTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM BusRouteTranslation a
        INNER JOIN inserted b
          ON a.BusRouteTranslationId = b.BusRouteTranslationId


GO
ALTER TABLE [dbo].[BusRouteTranslation] ENABLE TRIGGER [trg_BusRouteTranslation_Update]
GO
/****** Object:  Trigger [dbo].[trg_Driver_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_Driver_Update] ON [dbo].[Driver]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Driver a
        INNER JOIN inserted b
          ON a.DriverId = b.DriverId


GO
ALTER TABLE [dbo].[Driver] ENABLE TRIGGER [trg_Driver_Update]
GO
/****** Object:  Trigger [dbo].[trg_DriverShift_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_DriverShift_Update] ON [dbo].[DriverShift]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM DriverShift a
        INNER JOIN inserted b
          ON a.DriverShiftId = b.DriverShiftId


GO
ALTER TABLE [dbo].[DriverShift] ENABLE TRIGGER [trg_DriverShift_Update]
GO
/****** Object:  Trigger [dbo].[trg_Feedback_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_Feedback_Update] ON [dbo].[Feedback]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Feedback a
        INNER JOIN inserted b
          ON a.FeedbackId = b.FeedbackId


GO
ALTER TABLE [dbo].[Feedback] ENABLE TRIGGER [trg_Feedback_Update]
GO
/****** Object:  Trigger [dbo].[trg_FeedbackInitiatorType_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_FeedbackInitiatorType_Update] ON [dbo].[FeedbackInitiatorType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM FeedbackInitiatorType a
        INNER JOIN inserted b
          ON a.FeedbackInitiatorTypeId = b.FeedbackInitiatorTypeId


GO
ALTER TABLE [dbo].[FeedbackInitiatorType] ENABLE TRIGGER [trg_FeedbackInitiatorType_Update]
GO
/****** Object:  Trigger [dbo].[trg_FeedbackInitiatorTypeTranslation_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_FeedbackInitiatorTypeTranslation_Update] ON [dbo].[FeedbackInitiatorTypeTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM FeedbackInitiatorTypeTranslation a
        INNER JOIN inserted b
          ON a.FeedbackInitiatorTypeTranslationId = b.FeedbackInitiatorTypeTranslationId


GO
ALTER TABLE [dbo].[FeedbackInitiatorTypeTranslation] ENABLE TRIGGER [trg_FeedbackInitiatorTypeTranslation_Update]
GO
/****** Object:  Trigger [dbo].[trg_FeedbackType_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_FeedbackType_Update] ON [dbo].[FeedbackType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM FeedbackType a
        INNER JOIN inserted b
          ON a.FeedbackTypeId = b.FeedbackTypeId


GO
ALTER TABLE [dbo].[FeedbackType] ENABLE TRIGGER [trg_FeedbackType_Update]
GO
/****** Object:  Trigger [dbo].[trg_FeedbackTypeTranslation_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_FeedbackTypeTranslation_Update] ON [dbo].[FeedbackTypeTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM FeedbackTypeTranslation a
        INNER JOIN inserted b
          ON a.FeedbackTypeTranslationId = b.FeedbackTypeTranslationId


GO
ALTER TABLE [dbo].[FeedbackTypeTranslation] ENABLE TRIGGER [trg_FeedbackTypeTranslation_Update]
GO
/****** Object:  Trigger [dbo].[trg_GenderType_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_GenderType_Update] ON [dbo].[GenderType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM GenderType a
        INNER JOIN inserted b
          ON a.GenderTypeId = b.GenderTypeId


GO
ALTER TABLE [dbo].[GenderType] ENABLE TRIGGER [trg_GenderType_Update]
GO
/****** Object:  Trigger [dbo].[trg_GenderTypeTranslation_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_GenderTypeTranslation_Update] ON [dbo].[GenderTypeTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM GenderTypeTranslation a
        INNER JOIN inserted b
          ON a.GenderTypeTranslationId = b.GenderTypeTranslationId


GO
ALTER TABLE [dbo].[GenderTypeTranslation] ENABLE TRIGGER [trg_GenderTypeTranslation_Update]
GO
/****** Object:  Trigger [dbo].[trg_Holiday_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_Holiday_Update] ON [dbo].[Holiday]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Holiday a
        INNER JOIN inserted b
          ON a.HolidayId = b.HolidayId


GO
ALTER TABLE [dbo].[Holiday] ENABLE TRIGGER [trg_Holiday_Update]
GO
/****** Object:  Trigger [dbo].[trg_HolidayTranslation_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_HolidayTranslation_Update] ON [dbo].[HolidayTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM HolidayTranslation a
        INNER JOIN inserted b
          ON a.HolidayTranslationId = b.HolidayTranslationId


GO
ALTER TABLE [dbo].[HolidayTranslation] ENABLE TRIGGER [trg_HolidayTranslation_Update]
GO
/****** Object:  Trigger [dbo].[trg_LanguageType_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_LanguageType_Update] ON [dbo].[LanguageType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM LanguageType a
        INNER JOIN inserted b
          ON a.LanguageTypeId = b.LanguageTypeId


GO
ALTER TABLE [dbo].[LanguageType] ENABLE TRIGGER [trg_LanguageType_Update]
GO
/****** Object:  Trigger [dbo].[trg_Location_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_Location_Update] ON [dbo].[Location]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Location a
        INNER JOIN inserted b
          ON a.LocationId = b.LocationId


GO
ALTER TABLE [dbo].[Location] ENABLE TRIGGER [trg_Location_Update]
GO
/****** Object:  Trigger [dbo].[trg_LocationType_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_LocationType_Update] ON [dbo].[LocationType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM LocationType a
        INNER JOIN inserted b
          ON a.LocationTypeId = b.LocationTypeId


GO
ALTER TABLE [dbo].[LocationType] ENABLE TRIGGER [trg_LocationType_Update]
GO
/****** Object:  Trigger [dbo].[trg_LocationTypeTranslation_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_LocationTypeTranslation_Update] ON [dbo].[LocationTypeTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM LocationTypeTranslation a
        INNER JOIN inserted b
          ON a.LocationTypeTranslationId = b.LocationTypeTranslationId


GO
ALTER TABLE [dbo].[LocationTypeTranslation] ENABLE TRIGGER [trg_LocationTypeTranslation_Update]
GO
/****** Object:  Trigger [dbo].[trg_NotificationType_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_NotificationType_Update] ON [dbo].[NotificationType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM NotificationType a
        INNER JOIN inserted b
          ON a.NotificationTypeId = b.NotificationTypeId


GO
ALTER TABLE [dbo].[NotificationType] ENABLE TRIGGER [trg_NotificationType_Update]
GO
/****** Object:  Trigger [dbo].[trg_NotificationTypeTranslation_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_NotificationTypeTranslation_Update] ON [dbo].[NotificationTypeTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM NotificationTypeTranslation a
        INNER JOIN inserted b
          ON a.NotificationTypeTranslationId = b.NotificationTypeTranslationId


GO
ALTER TABLE [dbo].[NotificationTypeTranslation] ENABLE TRIGGER [trg_NotificationTypeTranslation_Update]
GO
/****** Object:  Trigger [dbo].[trg_Reservation_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_Reservation_Update] ON [dbo].[Reservation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Reservation a
        INNER JOIN inserted b
          ON a.ReservationId = b.ReservationId


GO
ALTER TABLE [dbo].[Reservation] ENABLE TRIGGER [trg_Reservation_Update]
GO
/****** Object:  Trigger [dbo].[trg_ReservationCancellationReasonType_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_ReservationCancellationReasonType_Update] ON [dbo].[ReservationCancellationReasonType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM ReservationCancellationReasonType a
        INNER JOIN inserted b
          ON a.ReservationCancellationReasonTypeId = b.ReservationCancellationReasonTypeId


GO
ALTER TABLE [dbo].[ReservationCancellationReasonType] ENABLE TRIGGER [trg_ReservationCancellationReasonType_Update]
GO
/****** Object:  Trigger [dbo].[trg_ReservationCancellationReasonTypeTranslation_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_ReservationCancellationReasonTypeTranslation_Update] ON [dbo].[ReservationCancellationReasonTypeTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM ReservationCancellationReasonTypeTranslation a
        INNER JOIN inserted b
          ON a.ReservationCancellationReasonTypeTranslationId = b.ReservationCancellationReasonTypeTranslationId


GO
ALTER TABLE [dbo].[ReservationCancellationReasonTypeTranslation] ENABLE TRIGGER [trg_ReservationCancellationReasonTypeTranslation_Update]
GO
/****** Object:  Trigger [dbo].[trg_ReservationRequest_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_ReservationRequest_Update] ON [dbo].[ReservationRequest]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM ReservationRequest a
        INNER JOIN inserted b
          ON a.ReservationRequestId = b.ReservationRequestId


GO
ALTER TABLE [dbo].[ReservationRequest] ENABLE TRIGGER [trg_ReservationRequest_Update]
GO
/****** Object:  Trigger [dbo].[trg_ReservationRequestCancellationReasonType_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_ReservationRequestCancellationReasonType_Update] ON [dbo].[ReservationRequestCancellationReasonType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM ReservationRequestCancellationReasonType a
        INNER JOIN inserted b
          ON a.ReservationRequestCancellationReasonTypeId = b.ReservationRequestCancellationReasonTypeId


GO
ALTER TABLE [dbo].[ReservationRequestCancellationReasonType] ENABLE TRIGGER [trg_ReservationRequestCancellationReasonType_Update]
GO
/****** Object:  Trigger [dbo].[trg_ReservationRequestCancellationReasonTypeTranslation_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_ReservationRequestCancellationReasonTypeTranslation_Update] ON [dbo].[ReservationRequestCancellationReasonTypeTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM ReservationRequestCancellationReasonTypeTranslation a
        INNER JOIN inserted b
          ON a.ReservationRequestCancellationReasonTypeTranslationId = b.ReservationRequestCancellationReasonTypeTranslationId


GO
ALTER TABLE [dbo].[ReservationRequestCancellationReasonTypeTranslation] ENABLE TRIGGER [trg_ReservationRequestCancellationReasonTypeTranslation_Update]
GO
/****** Object:  Trigger [dbo].[trg_ReservationRequestOption_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_ReservationRequestOption_Update] ON [dbo].[ReservationRequestOption]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM ReservationRequestOption a
        INNER JOIN inserted b
          ON a.ReservationRequestOptionId = b.ReservationRequestOptionId


GO
ALTER TABLE [dbo].[ReservationRequestOption] ENABLE TRIGGER [trg_ReservationRequestOption_Update]
GO
/****** Object:  Trigger [dbo].[trg_ReservationRequestStatusType_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_ReservationRequestStatusType_Update] ON [dbo].[ReservationRequestStatusType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM ReservationRequestStatusType a
        INNER JOIN inserted b
          ON a.ReservationRequestStatusTypeId = b.ReservationRequestStatusTypeId


GO
ALTER TABLE [dbo].[ReservationRequestStatusType] ENABLE TRIGGER [trg_ReservationRequestStatusType_Update]
GO
/****** Object:  Trigger [dbo].[trg_ReservationRequestStatusTypeTranslation_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_ReservationRequestStatusTypeTranslation_Update] ON [dbo].[ReservationRequestStatusTypeTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM ReservationRequestStatusTypeTranslation a
        INNER JOIN inserted b
          ON a.ReservationRequestStatusTypeTranslationId = b.ReservationRequestStatusTypeTranslationId


GO
ALTER TABLE [dbo].[ReservationRequestStatusTypeTranslation] ENABLE TRIGGER [trg_ReservationRequestStatusTypeTranslation_Update]
GO
/****** Object:  Trigger [dbo].[trg_ReservationStatusType_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_ReservationStatusType_Update] ON [dbo].[ReservationStatusType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM ReservationStatusType a
        INNER JOIN inserted b
          ON a.ReservationStatusTypeId = b.ReservationStatusTypeId


GO
ALTER TABLE [dbo].[ReservationStatusType] ENABLE TRIGGER [trg_ReservationStatusType_Update]
GO
/****** Object:  Trigger [dbo].[trg_ReservationStatusTypeTranslation_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





      CREATE TRIGGER [dbo].[trg_ReservationStatusTypeTranslation_Update] ON [dbo].[ReservationStatusTypeTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM ReservationStatusTypeTranslation a
        INNER JOIN inserted b
          ON a.ReservationStatusTypeTranslationId = b.ReservationStatusTypeTranslationId


GO
ALTER TABLE [dbo].[ReservationStatusTypeTranslation] ENABLE TRIGGER [trg_ReservationStatusTypeTranslation_Update]
GO
/****** Object:  Trigger [dbo].[trg_Ride_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


      CREATE TRIGGER [dbo].[trg_Ride_Update] ON [dbo].[Ride]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Ride a
        INNER JOIN inserted b
          ON a.RideId = b.RideId


GO
ALTER TABLE [dbo].[Ride] ENABLE TRIGGER [trg_Ride_Update]
GO
/****** Object:  Trigger [dbo].[trg_RidePosition_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


      CREATE TRIGGER [dbo].[trg_RidePosition_Update] ON [dbo].[RidePosition]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM RidePosition a
        INNER JOIN inserted b
          ON a.RidePositionId = b.RidePositionId


GO
ALTER TABLE [dbo].[RidePosition] ENABLE TRIGGER [trg_RidePosition_Update]
GO
/****** Object:  Trigger [dbo].[trg_RideServiceType_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




      CREATE TRIGGER [dbo].[trg_RideServiceType_Update] ON [dbo].[RideServiceType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM RideServiceType a
        INNER JOIN inserted b
          ON a.RideServiceTypeId = b.RideServiceTypeId


GO
ALTER TABLE [dbo].[RideServiceType] ENABLE TRIGGER [trg_RideServiceType_Update]
GO
/****** Object:  Trigger [dbo].[trg_RideServiceTypeTranslation_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




      CREATE TRIGGER [dbo].[trg_RideServiceTypeTranslation_Update] ON [dbo].[RideServiceTypeTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM RideServiceTypeTranslation a
        INNER JOIN inserted b
          ON a.RideServiceTypeTranslationId = b.RideServiceTypeTranslationId


GO
ALTER TABLE [dbo].[RideServiceTypeTranslation] ENABLE TRIGGER [trg_RideServiceTypeTranslation_Update]
GO
/****** Object:  Trigger [dbo].[trg_UserRewardAccount_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




      CREATE TRIGGER [dbo].[trg_UserRewardAccount_Update] ON [dbo].[UserRewardAccount]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM UserRewardAccount a
        INNER JOIN inserted b
          ON a.UserRewardAccountId = b.UserRewardAccountId


GO
ALTER TABLE [dbo].[UserRewardAccount] ENABLE TRIGGER [trg_UserRewardAccount_Update]
GO
/****** Object:  Trigger [dbo].[trg_UserRewardAccountTransaction_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




      CREATE TRIGGER [dbo].[trg_UserRewardAccountTransaction_Update] ON [dbo].[UserRewardAccountTransaction]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM UserRewardAccountTransaction a
        INNER JOIN inserted b
          ON a.UserRewardAccountTransactionId = b.UserRewardAccountTransactionId


GO
ALTER TABLE [dbo].[UserRewardAccountTransaction] ENABLE TRIGGER [trg_UserRewardAccountTransaction_Update]
GO
/****** Object:  Trigger [dbo].[trg_UserRewardAccountTransactionType_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




      CREATE TRIGGER [dbo].[trg_UserRewardAccountTransactionType_Update] ON [dbo].[UserRewardAccountTransactionType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM UserRewardAccountTransactionType a
        INNER JOIN inserted b
          ON a.UserRewardAccountTransactionTypeId = b.UserRewardAccountTransactionTypeId


GO
ALTER TABLE [dbo].[UserRewardAccountTransactionType] ENABLE TRIGGER [trg_UserRewardAccountTransactionType_Update]
GO
/****** Object:  Trigger [dbo].[trg_UserRewardAccountTransactionTypeTranslation_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




      CREATE TRIGGER [dbo].[trg_UserRewardAccountTransactionTypeTranslation_Update] ON [dbo].[UserRewardAccountTransactionTypeTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM UserRewardAccountTransactionTypeTranslation a
        INNER JOIN inserted b
          ON a.UserRewardAccountTransactionTypeTranslationId = b.UserRewardAccountTransactionTypeTranslationId


GO
ALTER TABLE [dbo].[UserRewardAccountTransactionTypeTranslation] ENABLE TRIGGER [trg_UserRewardAccountTransactionTypeTranslation_Update]
GO
/****** Object:  Trigger [dbo].[trg_Users_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [dbo].[trg_Users_Update] ON [dbo].[Users]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Users a
        INNER JOIN inserted b
          ON a.UserId = b.UserId
GO
ALTER TABLE [dbo].[Users] ENABLE TRIGGER [trg_Users_Update]
GO
/****** Object:  Trigger [dbo].[trg_Users_Location_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


      CREATE TRIGGER [dbo].[trg_Users_Location_Update] ON [dbo].[Users_Location]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Users_Location a
        INNER JOIN inserted b
          ON a.UserId = b.UserId AND a.LocationId = b.LocationId


GO
ALTER TABLE [dbo].[Users_Location] ENABLE TRIGGER [trg_Users_Location_Update]
GO
/****** Object:  Trigger [dbo].[trg_Users_NotificationType_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


      CREATE TRIGGER [dbo].[trg_Users_NotificationType_Update] ON [dbo].[Users_NotificationType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Users_NotificationType a
        INNER JOIN inserted b
          ON a.UserId = b.UserId AND a.NotificationTypeId = b.NotificationTypeId


GO
ALTER TABLE [dbo].[Users_NotificationType] ENABLE TRIGGER [trg_Users_NotificationType_Update]
GO
/****** Object:  Trigger [dbo].[trg_Vehicle_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


      CREATE TRIGGER [dbo].[trg_Vehicle_Update] ON [dbo].[Vehicle]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Vehicle a
        INNER JOIN inserted b
          ON a.VehicleId = b.VehicleId


GO
ALTER TABLE [dbo].[Vehicle] ENABLE TRIGGER [trg_Vehicle_Update]
GO
/****** Object:  Trigger [dbo].[trg_Vehicle_BusRoute_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


      CREATE TRIGGER [dbo].[trg_Vehicle_BusRoute_Update] ON [dbo].[Vehicle_BusRoute]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Vehicle_BusRoute a
        INNER JOIN inserted b
          ON a.VehicleId = b.VehicleId AND a.BusRouteId = b.BusRouteId


GO
ALTER TABLE [dbo].[Vehicle_BusRoute] ENABLE TRIGGER [trg_Vehicle_BusRoute_Update]
GO
/****** Object:  Trigger [dbo].[trg_Vehicle_VehicleFeatureType_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


      CREATE TRIGGER [dbo].[trg_Vehicle_VehicleFeatureType_Update] ON [dbo].[Vehicle_VehicleFeatureType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Vehicle_VehicleFeatureType a
        INNER JOIN inserted b
          ON a.VehicleId = b.VehicleId AND a.VehicleFeatureTypeId = b.VehicleFeatureTypeId


GO
ALTER TABLE [dbo].[Vehicle_VehicleFeatureType] ENABLE TRIGGER [trg_Vehicle_VehicleFeatureType_Update]
GO
/****** Object:  Trigger [dbo].[trg_VehicleFeatureType_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


      CREATE TRIGGER [dbo].[trg_VehicleFeatureType_Update] ON [dbo].[VehicleFeatureType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM VehicleFeatureType a
        INNER JOIN inserted b
          ON a.VehicleFeatureTypeId = b.VehicleFeatureTypeId


GO
ALTER TABLE [dbo].[VehicleFeatureType] ENABLE TRIGGER [trg_VehicleFeatureType_Update]
GO
/****** Object:  Trigger [dbo].[trg_VehicleFeatureTypeTranslation_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



      CREATE TRIGGER [dbo].[trg_VehicleFeatureTypeTranslation_Update] ON [dbo].[VehicleFeatureTypeTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM VehicleFeatureTypeTranslation a
        INNER JOIN inserted b
          ON a.VehicleFeatureTypeTranslationId = b.VehicleFeatureTypeTranslationId


GO
ALTER TABLE [dbo].[VehicleFeatureTypeTranslation] ENABLE TRIGGER [trg_VehicleFeatureTypeTranslation_Update]
GO
/****** Object:  Trigger [dbo].[trg_VehicleStatusType_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


      CREATE TRIGGER [dbo].[trg_VehicleStatusType_Update] ON [dbo].[VehicleStatusType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM VehicleStatusType a
        INNER JOIN inserted b
          ON a.VehicleStatusTypeId = b.VehicleStatusTypeId


GO
ALTER TABLE [dbo].[VehicleStatusType] ENABLE TRIGGER [trg_VehicleStatusType_Update]
GO
/****** Object:  Trigger [dbo].[trg_VehicleStatusTypeTranslation_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


      CREATE TRIGGER [dbo].[trg_VehicleStatusTypeTranslation_Update] ON [dbo].[VehicleStatusTypeTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM VehicleStatusTypeTranslation a
        INNER JOIN inserted b
          ON a.VehicleStatusTypeTranslationId = b.VehicleStatusTypeTranslationId


GO
ALTER TABLE [dbo].[VehicleStatusTypeTranslation] ENABLE TRIGGER [trg_VehicleStatusTypeTranslation_Update]
GO
/****** Object:  Trigger [dbo].[trg_VehicleType_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


      CREATE TRIGGER [dbo].[trg_VehicleType_Update] ON [dbo].[VehicleType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM VehicleType a
        INNER JOIN inserted b
          ON a.VehicleTypeId = b.VehicleTypeId


GO
ALTER TABLE [dbo].[VehicleType] ENABLE TRIGGER [trg_VehicleType_Update]
GO
/****** Object:  Trigger [dbo].[trg_VehicleType_VehicleFeatureType_Update]    Script Date: 4/15/2019 10:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


      CREATE TRIGGER [dbo].[trg_VehicleType_VehicleFeatureType_Update] ON [dbo].[VehicleType_VehicleFeatureType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM VehicleType_VehicleFeatureType a
        INNER JOIN inserted b
          ON a.VehicleTypeId = b.VehicleTypeId AND a.VehicleFeatureTypeId = b.VehicleFeatureTypeId


GO
ALTER TABLE [dbo].[VehicleType_VehicleFeatureType] ENABLE TRIGGER [trg_VehicleType_VehicleFeatureType_Update]
GO
