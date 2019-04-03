CREATE TABLE [dbo].[VehicleStatusType] (
    [VehicleStatusTypeId] INT             NOT NULL,
    [LanguageTypeId]      INT             NOT NULL,
    [Code]                VARCHAR (50)    NOT NULL,
    [DisplayText]         NVARCHAR (128)  NOT NULL,
    [DisplayPriority]     INT             CONSTRAINT [DF_VehicleStatusType_DisplayPriority] DEFAULT ((100)) NOT NULL,
    [Description]         NVARCHAR (1024) NULL,
    [DataVersion]         INT             CONSTRAINT [DF_VehicleStatusType_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]      DATETIME2 (7)   CONSTRAINT [DF_VehicleStatusType_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]           NVARCHAR (200)  NOT NULL,
    [ModifiedUtcDate]     DATETIME2 (7)   CONSTRAINT [DF_VehicleStatusType_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]          NVARCHAR (200)  NOT NULL,
    [IsDeleted]           BIT             CONSTRAINT [DF_VehicleStatusType_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_VehicleStatusType] PRIMARY KEY CLUSTERED ([VehicleStatusTypeId] ASC),
    CONSTRAINT [FK_VehicleStatusType_LanguageType] FOREIGN KEY ([LanguageTypeId]) REFERENCES [dbo].[LanguageType] ([LanguageTypeId]),
    CONSTRAINT [UC_VehicleStatusType_LanguageTypeId_Code] UNIQUE NONCLUSTERED ([LanguageTypeId] ASC, [Code] ASC)
);


GO

      CREATE TRIGGER [trgVehicleStatusTypeUpdate] ON VehicleStatusType
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM VehicleStatusType a
        INNER JOIN inserted b
          ON a.VehicleStatusTypeId = b.VehicleStatusTypeId