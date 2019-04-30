CREATE TABLE [dbo].[VehicleFeatureTypeTranslation] (
    [VehicleFeatureTypeTranslationId] INT             IDENTITY (1, 1) NOT NULL,
    [VehicleFeatureTypeId]            INT             NOT NULL,
    [LanguageTypeId]                  INT             NOT NULL,
    [Value]                           NVARCHAR (4000) NOT NULL,
    [DisplayPriority]                 INT             CONSTRAINT [DF_VehicleFeatureTypeTranslation_DisplayPriority] DEFAULT ((100)) NOT NULL,
    [DataVersion]                     INT             CONSTRAINT [DF_VehicleFeatureTypeTranslation_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]                  DATETIME2 (7)   CONSTRAINT [DF_VehicleFeatureTypeTranslation_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]                       NVARCHAR (200)  NOT NULL,
    [ModifiedUtcDate]                 DATETIME2 (7)   CONSTRAINT [DF_VehicleFeatureTypeTranslation_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]                      NVARCHAR (200)  NOT NULL,
    [IsDeleted]                       BIT             CONSTRAINT [DF_VehicleFeatureTypeTranslation_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_VehicleFeatureTypeTranslation] PRIMARY KEY NONCLUSTERED ([VehicleFeatureTypeTranslationId] ASC),
    CONSTRAINT [FK_VehicleFeatureTypeTranslation_LanguageType] FOREIGN KEY ([LanguageTypeId]) REFERENCES [dbo].[LanguageType] ([LanguageTypeId]),
    CONSTRAINT [FK_VehicleFeatureTypeTranslation_VehicleFeatureType] FOREIGN KEY ([VehicleFeatureTypeId]) REFERENCES [dbo].[VehicleFeatureType] ([VehicleFeatureTypeId]) ON DELETE CASCADE,
    CONSTRAINT [AK_VehicleFeatureTypeTranslation] UNIQUE CLUSTERED ([VehicleFeatureTypeId] ASC, [LanguageTypeId] ASC)
);


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