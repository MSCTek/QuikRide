CREATE TABLE [dbo].[RideServiceType] (
    [RideServiceTypeId] INT             NOT NULL,
    [LanguageTypeId]    INT             NOT NULL,
    [Code]              VARCHAR (50)    NOT NULL,
    [DisplayText]       NVARCHAR (128)  NOT NULL,
    [DisplayPriority]   INT             CONSTRAINT [DF_RideServiceType_DisplayPriority] DEFAULT ((100)) NOT NULL,
    [Description]       NVARCHAR (1024) NULL,
    [DataVersion]       INT             CONSTRAINT [DF_RideServiceType_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]    DATETIME2 (7)   CONSTRAINT [DF_RideServiceType_CreatedUTCDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]         NVARCHAR (200)  NOT NULL,
    [ModifiedUtcDate]   DATETIME2 (7)   CONSTRAINT [DF_RideServiceType_ModifiedUTCDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]        NVARCHAR (200)  NOT NULL,
    [IsDeleted]         BIT             CONSTRAINT [DF_RideServiceType_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_RideServiceType] PRIMARY KEY CLUSTERED ([RideServiceTypeId] ASC),
    CONSTRAINT [FK_RideServiceType_LanguageType] FOREIGN KEY ([LanguageTypeId]) REFERENCES [dbo].[LanguageType] ([LanguageTypeId]),
    CONSTRAINT [UC_RideServiceType_LanguageTypeId_Code] UNIQUE NONCLUSTERED ([LanguageTypeId] ASC, [Code] ASC)
);


GO

      CREATE TRIGGER [trgRideServiceTypeUpdate] ON RideServiceType
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM RideServiceType a
        INNER JOIN inserted b
          ON a.RideServiceTypeId = b.RideServiceTypeId