CREATE TABLE [dbo].[VehicleStatusTypeTranslation] (
    [VehicleStatusTypeTranslationId] INT             IDENTITY (1, 1) NOT NULL,
    [VehicleStatusTypeId]            INT             NOT NULL,
    [LanguageTypeId]                 INT             NOT NULL,
    [Value]                          NVARCHAR (4000) NOT NULL,
    [DisplayPriority]                INT             CONSTRAINT [DF_VehicleStatusTypeTranslation_DisplayPriority] DEFAULT ((100)) NOT NULL,
    [DataVersion]                    INT             CONSTRAINT [DF_VehicleStatusTypeTranslation_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]                 DATETIME2 (7)   CONSTRAINT [DF_VehicleStatusTypeTranslation_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]                      NVARCHAR (200)  NOT NULL,
    [ModifiedUtcDate]                DATETIME2 (7)   CONSTRAINT [DF_VehicleStatusTypeTranslation_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]                     NVARCHAR (200)  NOT NULL,
    [IsDeleted]                      BIT             CONSTRAINT [DF_VehicleStatusTypeTranslation_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_VehicleStatusTypeTranslation] PRIMARY KEY NONCLUSTERED ([VehicleStatusTypeTranslationId] ASC),
    CONSTRAINT [FK_VehicleStatusTypeTranslation_LanguageType] FOREIGN KEY ([LanguageTypeId]) REFERENCES [dbo].[LanguageType] ([LanguageTypeId]),
    CONSTRAINT [FK_VehicleStatusTypeTranslation_VehicleStatusType] FOREIGN KEY ([VehicleStatusTypeId]) REFERENCES [dbo].[VehicleStatusType] ([VehicleStatusTypeId]) ON DELETE CASCADE,
    CONSTRAINT [AK_VehicleStatusTypeTranslation] UNIQUE CLUSTERED ([VehicleStatusTypeId] ASC, [LanguageTypeId] ASC)
);


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