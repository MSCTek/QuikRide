CREATE TABLE [dbo].[VehicleFeatureType] (
    [VehicleFeatureTypeId] INT             NOT NULL,
    [LanguageTypeId]       INT             NOT NULL,
    [Code]                 VARCHAR (50)    NOT NULL,
    [DisplayText]          NVARCHAR (128)  NOT NULL,
    [DisplayPriority]      INT             CONSTRAINT [DF_VehicleFeatureType_DisplayPriority] DEFAULT ((100)) NOT NULL,
    [Description]          NVARCHAR (1024) NULL,
    [DataVersion]          INT             CONSTRAINT [DF_VehicleFeatureType_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]       DATETIME2 (7)   CONSTRAINT [DF_VehicleFeatureType_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]            NVARCHAR (200)  NOT NULL,
    [ModifiedUtcDate]      DATETIME2 (7)   CONSTRAINT [DF_VehicleFeatureType_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]           NVARCHAR (200)  NOT NULL,
    [IsDeleted]            BIT             CONSTRAINT [DF_VehicleFeatureType_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_VehicleFeatureType] PRIMARY KEY CLUSTERED ([VehicleFeatureTypeId] ASC),
    CONSTRAINT [FK_VehicleFeatureType_LanguageType] FOREIGN KEY ([LanguageTypeId]) REFERENCES [dbo].[LanguageType] ([LanguageTypeId]),
    CONSTRAINT [UC_VehicleFeatureType_LanguageTypeId_Code] UNIQUE NONCLUSTERED ([LanguageTypeId] ASC, [Code] ASC)
);


GO

      CREATE TRIGGER [trgVehicleFeatureTypeUpdate] ON VehicleFeatureType
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM VehicleFeatureType a
        INNER JOIN inserted b
          ON a.VehicleFeatureTypeId = b.VehicleFeatureTypeId