-- Change script for QuikRide database

-- [DriverShift]
CREATE TABLE [DriverShift](
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

ALTER TABLE [DriverShift] ADD  CONSTRAINT [DF_DriverShift_DataVersion]  DEFAULT ((1)) FOR [DataVersion]
GO

ALTER TABLE [DriverShift] ADD  CONSTRAINT [DF_DriverShift_CreatedUtcDate]  DEFAULT (getutcdate()) FOR [CreatedUtcDate]
GO

ALTER TABLE [DriverShift] ADD  CONSTRAINT [DF_DriverShift_ModifiedUtcDate]  DEFAULT (getutcdate()) FOR [ModifiedUtcDate]
GO

ALTER TABLE [DriverShift] ADD  CONSTRAINT [DF_DriverShift_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO

-- [FeedbackInitiatorType]
CREATE TABLE [FeedbackInitiatorType] (
    [FeedbackInitiatorTypeId] INT             NOT NULL,
    [LanguageTypeId]          INT             NOT NULL,
    [Code]                    VARCHAR (50)    NOT NULL,
    [DisplayText]             NVARCHAR (128)  NOT NULL,
    [DisplayPriority]         INT             CONSTRAINT [DF_FeedbackInitiatorType_DisplayPriority] DEFAULT ((100)) NOT NULL,
    [Description]             NVARCHAR (1024) NULL,
    [DataVersion]             INT             CONSTRAINT [DF_FeedbackInitiatorType_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]          DATETIME2 (7)   CONSTRAINT [DF_FeedbackInitiatorType_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]               NVARCHAR (200)  NOT NULL,
    [ModifiedUtcDate]         DATETIME2 (7)   CONSTRAINT [DF_FeedbackInitiatorType_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]              NVARCHAR (200)  NOT NULL,
    [IsDeleted]               BIT             CONSTRAINT [DF_FeedbackInitiatorType_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_FeedbackInitiatorType] PRIMARY KEY CLUSTERED ([FeedbackInitiatorTypeId] ASC),
    CONSTRAINT [FK_FeedbackInitiatorType_LanguageType] FOREIGN KEY ([LanguageTypeId]) REFERENCES [LanguageType] ([LanguageTypeId]),
    CONSTRAINT [UC_FeedbackInitiatorType_LanguageTypeId_Code] UNIQUE NONCLUSTERED ([LanguageTypeId] ASC, [Code] ASC)
);
GO


BEGIN TRANSACTION
ALTER TABLE Driver
	DROP CONSTRAINT FK_Driver_Vehicle
GO
ALTER TABLE Vehicle SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE Driver
	DROP CONSTRAINT FK_Driver_Users
GO
ALTER TABLE Users SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE Driver
	DROP CONSTRAINT DF_Driver_DataVersion
GO
ALTER TABLE Driver
	DROP CONSTRAINT DF_Driver_CreatedUtcDate
GO
ALTER TABLE Driver
	DROP CONSTRAINT DF_Driver_ModifiedUtcDate
GO
ALTER TABLE Driver
	DROP CONSTRAINT DF_Driver_IsDeleted
GO
CREATE TABLE Tmp_Driver
	(
	DriverId int NOT NULL IDENTITY (1, 1),
	UserId int NOT NULL,
	IsEligibleForDriving bit NOT NULL,
	CurrentVehicleId int NULL,
	Latitude float(53) NULL,
	Longitude float(53) NULL,
	DataVersion int NOT NULL,
	CreatedUtcDate datetime2(7) NOT NULL,
	CreatedBy nvarchar(200) NOT NULL,
	ModifiedUtcDate datetime2(7) NOT NULL,
	ModifiedBy nvarchar(200) NOT NULL,
	IsDeleted bit NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE Tmp_Driver SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE Tmp_Driver ADD CONSTRAINT
	DF_Driver_IsEligibleForDriving DEFAULT 1 FOR IsEligibleForDriving
GO
ALTER TABLE Tmp_Driver ADD CONSTRAINT
	DF_Driver_DataVersion DEFAULT ((1)) FOR DataVersion
GO
ALTER TABLE Tmp_Driver ADD CONSTRAINT
	DF_Driver_CreatedUtcDate DEFAULT (getutcdate()) FOR CreatedUtcDate
GO
ALTER TABLE Tmp_Driver ADD CONSTRAINT
	DF_Driver_ModifiedUtcDate DEFAULT (getutcdate()) FOR ModifiedUtcDate
GO
ALTER TABLE Tmp_Driver ADD CONSTRAINT
	DF_Driver_IsDeleted DEFAULT ((0)) FOR IsDeleted
GO
SET IDENTITY_INSERT Tmp_Driver ON
GO
IF EXISTS(SELECT * FROM Driver)
	 EXEC('INSERT INTO Tmp_Driver (DriverId, UserId, CurrentVehicleId, Latitude, Longitude, DataVersion, CreatedUtcDate, CreatedBy, ModifiedUtcDate, ModifiedBy, IsDeleted)
		SELECT DriverId, UserId, CurrentVehicleId, Latitude, Longitude, DataVersion, CreatedUtcDate, CreatedBy, ModifiedUtcDate, ModifiedBy, IsDeleted FROM Driver WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT Tmp_Driver OFF
GO
ALTER TABLE Ride
	DROP CONSTRAINT FK_Ride_Driver
GO
DROP TABLE Driver
GO
EXECUTE sp_rename N'Tmp_Driver', N'Driver', 'OBJECT' 
GO
ALTER TABLE Driver ADD CONSTRAINT
	PK_Driver PRIMARY KEY CLUSTERED 
	(
	DriverId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE Driver ADD CONSTRAINT
	FK_Driver_Users FOREIGN KEY
	(
	UserId
	) REFERENCES Users
	(
	UserId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE Driver ADD CONSTRAINT
	FK_Driver_Vehicle FOREIGN KEY
	(
	CurrentVehicleId
	) REFERENCES Vehicle
	(
	VehicleId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
CREATE TRIGGER [trgDriverUpdate] ON Driver
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Driver a
        INNER JOIN inserted b
          ON a.DriverId = b.DriverId
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE Ride ADD CONSTRAINT
	FK_Ride_Driver FOREIGN KEY
	(
	DriverId
	) REFERENCES Driver
	(
	DriverId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE Ride SET (LOCK_ESCALATION = TABLE)
COMMIT

--  Feedback table modifications

BEGIN TRANSACTION
GO
ALTER TABLE FeedbackInitiatorType SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE Feedback
	DROP CONSTRAINT FK_Feedback_FeedbackType
GO
ALTER TABLE FeedbackType SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE Feedback
	DROP CONSTRAINT DF_Feedback_DataVersion
GO
ALTER TABLE Feedback
	DROP CONSTRAINT DF_Feedback_CreatedUtcDate
GO
ALTER TABLE Feedback
	DROP CONSTRAINT DF_Feedback_ModifiedUtcDate
GO
ALTER TABLE Feedback
	DROP CONSTRAINT DF_Feedback_IsDeleted
GO
CREATE TABLE Tmp_Feedback
	(
	FeedbackId uniqueidentifier NOT NULL,
	Title nvarchar(1024) NULL,
	Description nvarchar(2048) NULL,
	FeedbackTypeId int NOT NULL,
	FeedbackInitiatorTypeId int NOT NULL,
	Source varchar(50) NOT NULL,
	Latitude float(53) NOT NULL,
	Longitude float(53) NOT NULL,
	Dispositioned bit NOT NULL,
	UserId int NULL,
	DriverId int NULL,
	VehicleId int NULL,
	DataVersion int NOT NULL,
	CreatedUtcDate datetime2(7) NOT NULL,
	CreatedBy nvarchar(200) NOT NULL,
	ModifiedUtcDate datetime2(7) NOT NULL,
	ModifiedBy nvarchar(200) NOT NULL,
	IsDeleted bit NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE Tmp_Feedback SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE Tmp_Feedback ADD CONSTRAINT
	DF_Feedback_DataVersion DEFAULT ((1)) FOR DataVersion
GO
ALTER TABLE Tmp_Feedback ADD CONSTRAINT
	DF_Feedback_CreatedUtcDate DEFAULT (getutcdate()) FOR CreatedUtcDate
GO
ALTER TABLE Tmp_Feedback ADD CONSTRAINT
	DF_Feedback_ModifiedUtcDate DEFAULT (getutcdate()) FOR ModifiedUtcDate
GO
ALTER TABLE Tmp_Feedback ADD CONSTRAINT
	DF_Feedback_IsDeleted DEFAULT ((0)) FOR IsDeleted
GO
IF EXISTS(SELECT * FROM Feedback)
	 EXEC('INSERT INTO Tmp_Feedback (FeedbackId, Title, Description, FeedbackTypeId, Latitude, Longitude, Dispositioned, UserId, DriverId, VehicleId, DataVersion, CreatedUtcDate, CreatedBy, ModifiedUtcDate, ModifiedBy, IsDeleted)
		SELECT FeedbackId, Title, Description, FeedbackTypeId, Latitude, Longitude, Dispositioned, UserId, DriverId, VehicleId, DataVersion, CreatedUtcDate, CreatedBy, ModifiedUtcDate, ModifiedBy, IsDeleted FROM Feedback WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE Feedback
GO
EXECUTE sp_rename N'Tmp_Feedback', N'Feedback', 'OBJECT' 
GO
ALTER TABLE Feedback ADD CONSTRAINT
	PK_Feedback PRIMARY KEY CLUSTERED 
	(
	FeedbackId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE Feedback ADD CONSTRAINT
	FK_Feedback_FeedbackType FOREIGN KEY
	(
	FeedbackTypeId
	) REFERENCES FeedbackType
	(
	FeedbackTypeId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE Feedback ADD CONSTRAINT
	FK_Feedback_FeedbackInitiatorType FOREIGN KEY
	(
	FeedbackInitiatorTypeId
	) REFERENCES FeedbackInitiatorType
	(
	FeedbackInitiatorTypeId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
CREATE TRIGGER [trgFeedbackUpdate] ON Feedback
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Feedback a
        INNER JOIN inserted b
          ON a.FeedbackId = b.FeedbackId
GO
COMMIT


-- Users table changes
BEGIN TRANSACTION
GO
ALTER TABLE LanguageType SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE Users
	DROP CONSTRAINT FK_Users_GenderType_GenderTypeId
GO
ALTER TABLE GenderType SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE Users
	DROP CONSTRAINT DF_Users_DataVersion
GO
ALTER TABLE Users
	DROP CONSTRAINT DF_Users_CreatedUtcDate
GO
ALTER TABLE Users
	DROP CONSTRAINT DF_Users_ModifiedUtcDate
GO
ALTER TABLE Users
	DROP CONSTRAINT DF_Users_IsDeleted
GO
CREATE TABLE Tmp_Users
	(
	UserId int NOT NULL IDENTITY (1, 1),
	UserName nvarchar(255) NULL,
	Email nvarchar(255) NULL,
	BirthDate datetime2(7) NULL,
	FirstName nvarchar(255) NULL,
	LastName nvarchar(255) NULL,
	GenderTypeId int NOT NULL,
	Password nvarchar(255) NULL,
	Salt nvarchar(255) NULL,
	LastLogin datetime2(7) NOT NULL,
	PreferredLanguageId int NOT NULL,
	DataVersion int NOT NULL,
	CreatedUtcDate datetime2(7) NOT NULL,
	CreatedBy nvarchar(200) NOT NULL,
	ModifiedUtcDate datetime2(7) NOT NULL,
	ModifiedBy nvarchar(200) NOT NULL,
	IsDeleted bit NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE Tmp_Users SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE Tmp_Users ADD CONSTRAINT 
	[DF_Users_PreferredLanguageId] DEFAULT ((1)) FOR PreferredLanguageId
GO
ALTER TABLE Tmp_Users ADD CONSTRAINT
	DF_Users_DataVersion DEFAULT ((1)) FOR DataVersion
GO
ALTER TABLE Tmp_Users ADD CONSTRAINT
	DF_Users_CreatedUtcDate DEFAULT (getutcdate()) FOR CreatedUtcDate
GO
ALTER TABLE Tmp_Users ADD CONSTRAINT
	DF_Users_ModifiedUtcDate DEFAULT (getutcdate()) FOR ModifiedUtcDate
GO
ALTER TABLE Tmp_Users ADD CONSTRAINT
	DF_Users_IsDeleted DEFAULT ((0)) FOR IsDeleted
GO
SET IDENTITY_INSERT Tmp_Users ON
GO
IF EXISTS(SELECT * FROM Users)
	 EXEC('INSERT INTO Tmp_Users (UserId, UserName, Email, BirthDate, FirstName, LastName, GenderTypeId, Password, Salt, LastLogin, DataVersion, CreatedUtcDate, CreatedBy, ModifiedUtcDate, ModifiedBy, IsDeleted)
		SELECT UserId, UserName, Email, BirthDate, FirstName, LastName, GenderTypeId, Password, Salt, LastLogin, DataVersion, CreatedUtcDate, CreatedBy, ModifiedUtcDate, ModifiedBy, IsDeleted FROM Users WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT Tmp_Users OFF
GO
ALTER TABLE Driver
	DROP CONSTRAINT FK_Driver_Users
GO
ALTER TABLE Reservation
	DROP CONSTRAINT FK_Reservation_Users
GO
ALTER TABLE ReservationRequest
	DROP CONSTRAINT FK_ReservationRequest_Users
GO
ALTER TABLE Ride
	DROP CONSTRAINT FK_Ride_Users
GO
ALTER TABLE Users_Location
	DROP CONSTRAINT FK_Users_Location_Users
GO
ALTER TABLE Users_NotificationType
	DROP CONSTRAINT FK_Users_NotificationType_Users
GO
DROP TABLE Users
GO
EXECUTE sp_rename N'Tmp_Users', N'Users', 'OBJECT' 
GO
ALTER TABLE Users ADD CONSTRAINT
	PK_Users PRIMARY KEY CLUSTERED 
	(
	UserId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE Users ADD CONSTRAINT
	FK_Users_GenderType_GenderTypeId FOREIGN KEY
	(
	GenderTypeId
	) REFERENCES GenderType
	(
	GenderTypeId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE Users ADD CONSTRAINT
	FK_Users_LanguageType FOREIGN KEY
	(
	PreferredLanguageId
	) REFERENCES LanguageType
	(
	LanguageTypeId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
CREATE TRIGGER [trgUsersUpdate] ON Users
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Users a
        INNER JOIN inserted b
          ON a.UserId = b.UserId
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE Users_NotificationType ADD CONSTRAINT
	FK_Users_NotificationType_Users FOREIGN KEY
	(
	UserId
	) REFERENCES Users
	(
	UserId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE Users_NotificationType SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE Users_Location ADD CONSTRAINT
	FK_Users_Location_Users FOREIGN KEY
	(
	UserId
	) REFERENCES Users
	(
	UserId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE Users_Location SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE Ride ADD CONSTRAINT
	FK_Ride_Users FOREIGN KEY
	(
	UserId
	) REFERENCES Users
	(
	UserId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE Ride SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE ReservationRequest ADD CONSTRAINT
	FK_ReservationRequest_Users FOREIGN KEY
	(
	UserId
	) REFERENCES Users
	(
	UserId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE ReservationRequest SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE Reservation ADD CONSTRAINT
	FK_Reservation_Users FOREIGN KEY
	(
	UserId
	) REFERENCES Users
	(
	UserId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE Reservation SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE Driver ADD CONSTRAINT
	FK_Driver_Users FOREIGN KEY
	(
	UserId
	) REFERENCES Users
	(
	UserId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE Driver SET (LOCK_ESCALATION = TABLE)
GO
COMMIT