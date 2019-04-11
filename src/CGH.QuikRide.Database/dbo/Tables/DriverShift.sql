CREATE TABLE [dbo].[DriverShift] (
    [DriverShiftId]   UNIQUEIDENTIFIER NOT NULL,
    [DriverId]        INT              NOT NULL,
    [StartUtcDate]    DATETIME2 (7)    NOT NULL,
    [EndUtcDate]      DATETIME2 (7)    NOT NULL,
    [DataVersion]     INT              CONSTRAINT [DF_DriverShift_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]  DATETIME2 (7)    CONSTRAINT [DF_DriverShift_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]       NVARCHAR (200)   NOT NULL,
    [ModifiedUtcDate] DATETIME2 (7)    CONSTRAINT [DF_DriverShift_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]      NVARCHAR (200)   NOT NULL,
    [IsDeleted]       BIT              CONSTRAINT [DF_DriverShift_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_DriverShift] PRIMARY KEY CLUSTERED ([DriverShiftId] ASC)
);

