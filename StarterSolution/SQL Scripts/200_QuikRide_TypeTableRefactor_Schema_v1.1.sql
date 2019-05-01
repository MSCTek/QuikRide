BEGIN TRANSACTION
GO

DROP TABLE IF EXISTS dbo.LookupList

GO
/****** Object:  Table [dbo].[LookupList]    Script Date: 4/30/2019 7:57:47 PM ******/
CREATE TABLE [dbo].[LookupList](
	[LookupListId] [int] NOT NULL IDENTITY (1, 1),
	[LanguageTypeId] [int] NOT NULL,
	[ForeignKeyTablePkId] [int] NOT NULL,
	[ForeignKeyTableName] [nvarchar](200) NOT NULL,
	[DisplayPriority] [int] NOT NULL,
	[DisplayText] [nvarchar](4000) NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[TagJson] [nvarchar](MAX) NULL,
	[DataVersion] [int] NOT NULL,
	[CreatedUtcDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](200) NOT NULL,
	[ModifiedUtcDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_LookupList] PRIMARY KEY CLUSTERED 
(
	[LookupListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[LookupList] ADD  CONSTRAINT [DF_LookupList_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO

ALTER TABLE [dbo].[LookupList] ADD  CONSTRAINT [DF_LookupList_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO

ALTER TABLE [dbo].[LookupList] ADD  CONSTRAINT [DF_LookupList_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO

ALTER TABLE [dbo].[LookupList] ADD  CONSTRAINT [DF_LookupList_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO

ALTER TABLE dbo.LookupList ADD CONSTRAINT
	FK_LookupList_LanguageType FOREIGN KEY
	(
	LanguageTypeId
	) REFERENCES dbo.LanguageType
	(
	LanguageTypeId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.LookupList SET (LOCK_ESCALATION = TABLE)


GO
-- [trg_LookupList_Update]
CREATE TRIGGER [dbo].[trg_LookupList_Update] ON [dbo].[LookupList]
FOR UPDATE
AS 

SET NOCOUNT ON

UPDATE a SET 
a.DataVersion = b.DataVersion + 1
FROM LookupList a
INNER JOIN inserted b
    ON a.LookupListId = b.LookupListId

GO


-- BarcodeTypeTranslation
INSERT INTO [dbo].[LookupList]
           ([LanguageTypeId]
	       ,[ForeignKeyTablePkId] 
           ,[ForeignKeyTableName] 
           ,[DisplayPriority]
           ,[DisplayText]
           ,[Description]
           ,[TagJson]
           ,[DataVersion]
           ,[CreatedUtcDate]
           ,[CreatedBy]
           ,[ModifiedUtcDate]
           ,[ModifiedBy]
           ,[IsDeleted])
SELECT 
	translation.[LanguageTypeId]
	,typetable.[BarcodeTypeId]
	,'BarcodeType'
	,translation.DisplayPriority
	,translation.[Value]
	,null  --,translation.[Description]
	,null
	,translation.DataVersion
	,translation.CreatedUtcDate
	,translation.CreatedBy
	,translation.ModifiedUtcDate
	,translation.ModifiedBy
	,translation.IsDeleted
FROM [dbo].[BarcodeTypeTranslation] translation
JOIN [dbo].[BarcodeType] typetable
	ON translation.BarcodeTypeId = typetable.BarcodeTypeId


-- BusRouteTranslation
INSERT INTO [dbo].[LookupList]
           ([LanguageTypeId]
	       ,[ForeignKeyTablePkId] 
           ,[ForeignKeyTableName] 
           ,[DisplayPriority]
           ,[DisplayText]
           ,[Description]
           ,[TagJson]
           ,[DataVersion]
           ,[CreatedUtcDate]
           ,[CreatedBy]
           ,[ModifiedUtcDate]
           ,[ModifiedBy]
           ,[IsDeleted])
SELECT 
	translation.[LanguageTypeId]
	,typetable.[BusRouteId]
	,'BusRoute'
	,translation.DisplayPriority
	,translation.[Value]
	,translation.[Description]
	,null
	,translation.DataVersion
	,translation.CreatedUtcDate
	,translation.CreatedBy
	,translation.ModifiedUtcDate
	,translation.ModifiedBy
	,translation.IsDeleted
FROM [dbo].[BusRouteTranslation] translation
JOIN [dbo].[BusRoute] typetable
	ON translation.BusRouteId = typetable.BusRouteId


-- FeedbackInitiatorType
INSERT INTO [dbo].[LookupList]
           ([LanguageTypeId]
	       ,[ForeignKeyTablePkId] 
           ,[ForeignKeyTableName] 
           ,[DisplayPriority]
           ,[DisplayText]
           ,[Description]
           ,[TagJson]
           ,[DataVersion]
           ,[CreatedUtcDate]
           ,[CreatedBy]
           ,[ModifiedUtcDate]
           ,[ModifiedBy]
           ,[IsDeleted])
SELECT 
	translation.[LanguageTypeId]
	,typetable.[FeedbackInitiatorTypeId]
	,'FeedbackInitiatorType'
	,translation.DisplayPriority
	,translation.[Value]
	,null  --,translation.[Description]
	,null
	,translation.DataVersion
	,translation.CreatedUtcDate
	,translation.CreatedBy
	,translation.ModifiedUtcDate
	,translation.ModifiedBy
	,translation.IsDeleted
FROM [dbo].[FeedbackInitiatorTypeTranslation] translation
JOIN [dbo].[FeedbackInitiatorType] typetable
	ON translation.FeedbackInitiatorTypeId = typetable.FeedbackInitiatorTypeId




INSERT INTO [dbo].[LookupList]
           ([LanguageTypeId]
	       ,[ForeignKeyTablePkId] 
           ,[ForeignKeyTableName] 
           ,[DisplayPriority]
           ,[DisplayText]
           ,[Description]
           ,[TagJson]
           ,[DataVersion]
           ,[CreatedUtcDate]
           ,[CreatedBy]
           ,[ModifiedUtcDate]
           ,[ModifiedBy]
           ,[IsDeleted])
SELECT 
	translation.[LanguageTypeId]
	,typetable.[FeedbackTypeId]
	,'FeedbackType'
	,translation.DisplayPriority
	,translation.[Value]
	,null  --,translation.[Description]
	,null
	,translation.DataVersion
	,translation.CreatedUtcDate
	,translation.CreatedBy
	,translation.ModifiedUtcDate
	,translation.ModifiedBy
	,translation.IsDeleted
FROM [dbo].[FeedbackTypeTranslation] translation
JOIN [dbo].[FeedbackType] typetable
	ON translation.FeedbackTypeId = typetable.FeedbackTypeId


-- GenderType
INSERT INTO [dbo].[LookupList]
           ([LanguageTypeId]
	       ,[ForeignKeyTablePkId] 
           ,[ForeignKeyTableName] 
           ,[DisplayPriority]
           ,[DisplayText]
           ,[Description]
           ,[TagJson]
           ,[DataVersion]
           ,[CreatedUtcDate]
           ,[CreatedBy]
           ,[ModifiedUtcDate]
           ,[ModifiedBy]
           ,[IsDeleted])
SELECT 
	translation.[LanguageTypeId]
	,typetable.[GenderTypeId]
	,'GenderType'
	,translation.DisplayPriority
	,translation.[Value]
	,translation.[Description]
	,null
	,translation.DataVersion
	,translation.CreatedUtcDate
	,translation.CreatedBy
	,translation.ModifiedUtcDate
	,translation.ModifiedBy
	,translation.IsDeleted
FROM [dbo].[GenderTypeTranslation] translation
JOIN [dbo].[GenderType] typetable
	ON translation.GenderTypeId = typetable.GenderTypeId


-- Holiday
INSERT INTO [dbo].[LookupList]
           ([LanguageTypeId]
	       ,[ForeignKeyTablePkId] 
           ,[ForeignKeyTableName] 
           ,[DisplayPriority]
           ,[DisplayText]
           ,[Description]
           ,[TagJson]
           ,[DataVersion]
           ,[CreatedUtcDate]
           ,[CreatedBy]
           ,[ModifiedUtcDate]
           ,[ModifiedBy]
           ,[IsDeleted])
SELECT 
	translation.[LanguageTypeId]
	,typetable.[HolidayId]
	,'Holiday'
	,translation.DisplayPriority
	,translation.[Value]
	,null  --,translation.[Description]
	,null
	,translation.DataVersion
	,translation.CreatedUtcDate
	,translation.CreatedBy
	,translation.ModifiedUtcDate
	,translation.ModifiedBy
	,translation.IsDeleted
FROM [dbo].[HolidayTranslation] translation
JOIN [dbo].[Holiday] typetable
	ON translation.HolidayId = typetable.HolidayId



-- LocationType
INSERT INTO [dbo].[LookupList]
           ([LanguageTypeId]
	       ,[ForeignKeyTablePkId] 
           ,[ForeignKeyTableName] 
           ,[DisplayPriority]
           ,[DisplayText]
           ,[Description]
           ,[TagJson]
           ,[DataVersion]
           ,[CreatedUtcDate]
           ,[CreatedBy]
           ,[ModifiedUtcDate]
           ,[ModifiedBy]
           ,[IsDeleted])
SELECT 
	translation.[LanguageTypeId]
	,typetable.[LocationTypeId]
	,'LocationType'
	,translation.DisplayPriority
	,translation.[Value]
	,null  --,translation.[Description]
	,null
	,translation.DataVersion
	,translation.CreatedUtcDate
	,translation.CreatedBy
	,translation.ModifiedUtcDate
	,translation.ModifiedBy
	,translation.IsDeleted
FROM [dbo].[LocationTypeTranslation] translation
JOIN [dbo].[LocationType] typetable
	ON translation.LocationTypeId = typetable.LocationTypeId


-- NotificationType
INSERT INTO [dbo].[LookupList]
           ([LanguageTypeId]
	       ,[ForeignKeyTablePkId] 
           ,[ForeignKeyTableName] 
           ,[DisplayPriority]
           ,[DisplayText]
           ,[Description]
           ,[TagJson]
           ,[DataVersion]
           ,[CreatedUtcDate]
           ,[CreatedBy]
           ,[ModifiedUtcDate]
           ,[ModifiedBy]
           ,[IsDeleted])
SELECT 
	translation.[LanguageTypeId]
	,typetable.[NotificationTypeId]
	,'NotificationType'
	,translation.DisplayPriority
	,translation.[Value]
	,null  --,translation.[Description]
	,null
	,translation.DataVersion
	,translation.CreatedUtcDate
	,translation.CreatedBy
	,translation.ModifiedUtcDate
	,translation.ModifiedBy
	,translation.IsDeleted
FROM [dbo].[NotificationTypeTranslation] translation
JOIN [dbo].[NotificationType] typetable
	ON translation.NotificationTypeId = typetable.NotificationTypeId



-- ReservationCancellationReasonType
INSERT INTO [dbo].[LookupList]
           ([LanguageTypeId]
	       ,[ForeignKeyTablePkId] 
           ,[ForeignKeyTableName] 
           ,[DisplayPriority]
           ,[DisplayText]
           ,[Description]
           ,[TagJson]
           ,[DataVersion]
           ,[CreatedUtcDate]
           ,[CreatedBy]
           ,[ModifiedUtcDate]
           ,[ModifiedBy]
           ,[IsDeleted])
SELECT 
	translation.[LanguageTypeId]
	,typetable.[ReservationCancellationReasonTypeId]
	,'ReservationCancellationReasonType'
	,translation.DisplayPriority
	,translation.[Value]
	,null  --,translation.[Description]
	,null
	,translation.DataVersion
	,translation.CreatedUtcDate
	,translation.CreatedBy
	,translation.ModifiedUtcDate
	,translation.ModifiedBy
	,translation.IsDeleted
FROM [dbo].[ReservationCancellationReasonTypeTranslation] translation
JOIN [dbo].[ReservationCancellationReasonType] typetable
	ON translation.ReservationCancellationReasonTypeId = typetable.ReservationCancellationReasonTypeId



-- ReservationRequestCancellationReasonType
INSERT INTO [dbo].[LookupList]
           ([LanguageTypeId]
	       ,[ForeignKeyTablePkId] 
           ,[ForeignKeyTableName] 
           ,[DisplayPriority]
           ,[DisplayText]
           ,[Description]
           ,[TagJson]
           ,[DataVersion]
           ,[CreatedUtcDate]
           ,[CreatedBy]
           ,[ModifiedUtcDate]
           ,[ModifiedBy]
           ,[IsDeleted])
SELECT 
	translation.[LanguageTypeId]
	,typetable.[ReservationRequestCancellationReasonTypeId]
	,'ReservationRequestCancellationReasonType'
	,translation.DisplayPriority
	,translation.[Value]
	,null  --,translation.[Description]
	,null
	,translation.DataVersion
	,translation.CreatedUtcDate
	,translation.CreatedBy
	,translation.ModifiedUtcDate
	,translation.ModifiedBy
	,translation.IsDeleted
FROM [dbo].[ReservationRequestCancellationReasonTypeTranslation] translation
JOIN [dbo].[ReservationRequestCancellationReasonType] typetable
	ON translation.ReservationRequestCancellationReasonTypeId = typetable.ReservationRequestCancellationReasonTypeId


-- ReservationRequestStatusType
INSERT INTO [dbo].[LookupList]
           ([LanguageTypeId]
	       ,[ForeignKeyTablePkId] 
           ,[ForeignKeyTableName] 
           ,[DisplayPriority]
           ,[DisplayText]
           ,[Description]
           ,[TagJson]
           ,[DataVersion]
           ,[CreatedUtcDate]
           ,[CreatedBy]
           ,[ModifiedUtcDate]
           ,[ModifiedBy]
           ,[IsDeleted])
SELECT 
	translation.[LanguageTypeId]
	,typetable.[ReservationRequestStatusTypeId]
	,'ReservationRequestStatusType'
	,translation.DisplayPriority
	,translation.[Value]
	,null  --,translation.[Description]
	,null
	,translation.DataVersion
	,translation.CreatedUtcDate
	,translation.CreatedBy
	,translation.ModifiedUtcDate
	,translation.ModifiedBy
	,translation.IsDeleted
FROM [dbo].[ReservationRequestStatusTypeTranslation] translation
JOIN [dbo].[ReservationRequestStatusType] typetable
	ON translation.ReservationRequestStatusTypeId = typetable.ReservationRequestStatusTypeId

-- ReservationStatusType
INSERT INTO [dbo].[LookupList]
           ([LanguageTypeId]
	       ,[ForeignKeyTablePkId] 
           ,[ForeignKeyTableName] 
           ,[DisplayPriority]
           ,[DisplayText]
           ,[Description]
           ,[TagJson]
           ,[DataVersion]
           ,[CreatedUtcDate]
           ,[CreatedBy]
           ,[ModifiedUtcDate]
           ,[ModifiedBy]
           ,[IsDeleted])
SELECT 
	translation.[LanguageTypeId]
	,typetable.[ReservationStatusTypeId]
	,'ReservationStatusType'
	,translation.DisplayPriority
	,translation.[Value]
	,null  --,translation.[Description]
	,null
	,translation.DataVersion
	,translation.CreatedUtcDate
	,translation.CreatedBy
	,translation.ModifiedUtcDate
	,translation.ModifiedBy
	,translation.IsDeleted
FROM [dbo].[ReservationStatusTypeTranslation] translation
JOIN [dbo].[ReservationStatusType] typetable
	ON translation.ReservationStatusTypeId = typetable.ReservationStatusTypeId



-- RideServiceType
INSERT INTO [dbo].[LookupList]
           ([LanguageTypeId]
	       ,[ForeignKeyTablePkId] 
           ,[ForeignKeyTableName] 
           ,[DisplayPriority]
           ,[DisplayText]
           ,[Description]
           ,[TagJson]
           ,[DataVersion]
           ,[CreatedUtcDate]
           ,[CreatedBy]
           ,[ModifiedUtcDate]
           ,[ModifiedBy]
           ,[IsDeleted])
SELECT 
	translation.[LanguageTypeId]
	,typetable.[RideServiceTypeId]
	,'RideServiceType'
	,translation.DisplayPriority
	,translation.[Value]
	,null  --,translation.[Description]
	,null
	,translation.DataVersion
	,translation.CreatedUtcDate
	,translation.CreatedBy
	,translation.ModifiedUtcDate
	,translation.ModifiedBy
	,translation.IsDeleted
FROM [dbo].[RideServiceTypeTranslation] translation
JOIN [dbo].[RideServiceType] typetable
	ON translation.RideServiceTypeId = typetable.RideServiceTypeId


-- UserRewardAccountTransactionType
INSERT INTO [dbo].[LookupList]
           ([LanguageTypeId]
	       ,[ForeignKeyTablePkId] 
           ,[ForeignKeyTableName] 
           ,[DisplayPriority]
           ,[DisplayText]
           ,[Description]
           ,[TagJson]
           ,[DataVersion]
           ,[CreatedUtcDate]
           ,[CreatedBy]
           ,[ModifiedUtcDate]
           ,[ModifiedBy]
           ,[IsDeleted])
SELECT 
	translation.[LanguageTypeId]
	,typetable.[UserRewardAccountTransactionTypeId]
	,'UserRewardAccountTransactionType'
	,translation.DisplayPriority
	,translation.[Value]
	,translation.[Description]
	,null
	,translation.DataVersion
	,translation.CreatedUtcDate
	,translation.CreatedBy
	,translation.ModifiedUtcDate
	,translation.ModifiedBy
	,translation.IsDeleted
FROM [dbo].[UserRewardAccountTransactionTypeTranslation] translation
JOIN [dbo].[UserRewardAccountTransactionType] typetable
	ON translation.UserRewardAccountTransactionTypeId = typetable.UserRewardAccountTransactionTypeId


-- VehicleFeatureType
INSERT INTO [dbo].[LookupList]
           ([LanguageTypeId]
	       ,[ForeignKeyTablePkId] 
           ,[ForeignKeyTableName] 
           ,[DisplayPriority]
           ,[DisplayText]
           ,[Description]
           ,[TagJson]
           ,[DataVersion]
           ,[CreatedUtcDate]
           ,[CreatedBy]
           ,[ModifiedUtcDate]
           ,[ModifiedBy]
           ,[IsDeleted])
SELECT 
	translation.[LanguageTypeId]
	,typetable.[VehicleFeatureTypeId]
	,'VehicleFeatureType'
	,translation.DisplayPriority
	,translation.[Value]
	,null  --,translation.[Description]
	,null
	,translation.DataVersion
	,translation.CreatedUtcDate
	,translation.CreatedBy
	,translation.ModifiedUtcDate
	,translation.ModifiedBy
	,translation.IsDeleted
FROM [dbo].[VehicleFeatureTypeTranslation] translation
JOIN [dbo].[VehicleFeatureType] typetable
	ON translation.VehicleFeatureTypeId = typetable.VehicleFeatureTypeId


-- VehicleStatusType
INSERT INTO [dbo].[LookupList]
           ([LanguageTypeId]
	       ,[ForeignKeyTablePkId] 
           ,[ForeignKeyTableName] 
           ,[DisplayPriority]
           ,[DisplayText]
           ,[Description]
           ,[TagJson]
           ,[DataVersion]
           ,[CreatedUtcDate]
           ,[CreatedBy]
           ,[ModifiedUtcDate]
           ,[ModifiedBy]
           ,[IsDeleted])
SELECT 
	translation.[LanguageTypeId]
	,typetable.[VehicleStatusTypeId]
	,'VehicleStatusType'
	,translation.DisplayPriority
	,translation.[Value]
	,null  --,translation.[Description]
	,null
	,translation.DataVersion
	,translation.CreatedUtcDate
	,translation.CreatedBy
	,translation.ModifiedUtcDate
	,translation.ModifiedBy
	,translation.IsDeleted
FROM [dbo].[VehicleStatusTypeTranslation] translation
JOIN [dbo].[VehicleStatusType] typetable
	ON translation.VehicleStatusTypeId = typetable.VehicleStatusTypeId

DROP TABLE IF EXISTS [dbo].[BarcodeTypeTranslation]
DROP TABLE IF EXISTS [dbo].[BusRouteTranslation]
DROP TABLE IF EXISTS [dbo].[FeedbackInitiatorTypeTranslation]
DROP TABLE IF EXISTS [dbo].[FeedbackTypeTranslation]
DROP TABLE IF EXISTS [dbo].[GenderTypeTranslation]
DROP TABLE IF EXISTS [dbo].[HolidayTranslation]
DROP TABLE IF EXISTS [dbo].[LocationTypeTranslation]
DROP TABLE IF EXISTS [dbo].[NotificationTypeTranslation]
DROP TABLE IF EXISTS [dbo].[ReservationCancellationReasonTypeTranslation]
DROP TABLE IF EXISTS [dbo].[ReservationRequestCancellationReasonTypeTranslation]
DROP TABLE IF EXISTS [dbo].[ReservationRequestStatusTypeTranslation]
DROP TABLE IF EXISTS [dbo].[ReservationStatusTypeTranslation]
DROP TABLE IF EXISTS [dbo].[RideServiceTypeTranslation]
DROP TABLE IF EXISTS [dbo].[UserRewardAccountTransactionTypeTranslation]
DROP TABLE IF EXISTS [dbo].[VehicleFeatureTypeTranslation]
DROP TABLE IF EXISTS [dbo].[VehicleStatusTypeTranslation]


GO
-- ROLLBACK
COMMIT
