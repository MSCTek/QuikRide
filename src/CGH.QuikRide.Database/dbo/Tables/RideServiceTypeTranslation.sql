CREATE TABLE [dbo].[RideServiceTypeTranslation] (
    [RideServiceTypeTranslationId] INT             IDENTITY (1, 1) NOT NULL,
    [RideServiceTypeId]            INT             NOT NULL,
    [LanguageTypeId]               INT             NOT NULL,
    [Value]                        NVARCHAR (4000) NOT NULL,
    [DisplayPriority]              INT             CONSTRAINT [DF_RideServiceTypeTranslation_DisplayPriority] DEFAULT ((100)) NOT NULL,
    [DataVersion]                  INT             CONSTRAINT [DF_RideServiceTypeTranslation_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]               DATETIME2 (7)   CONSTRAINT [DF_RideServiceTypeTranslation_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]                    NVARCHAR (200)  NOT NULL,
    [ModifiedUtcDate]              DATETIME2 (7)   CONSTRAINT [DF_RideServiceTypeTranslation_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]                   NVARCHAR (200)  NOT NULL,
    [IsDeleted]                    BIT             CONSTRAINT [DF_RideServiceTypeTranslation_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_RideServiceTypeTranslation] PRIMARY KEY NONCLUSTERED ([RideServiceTypeTranslationId] ASC),
    CONSTRAINT [FK_RideServiceTypeTranslation_LanguageType] FOREIGN KEY ([LanguageTypeId]) REFERENCES [dbo].[LanguageType] ([LanguageTypeId]),
    CONSTRAINT [FK_RideServiceTypeTranslation_RideServiceType] FOREIGN KEY ([RideServiceTypeId]) REFERENCES [dbo].[RideServiceType] ([RideServiceTypeId]) ON DELETE CASCADE,
    CONSTRAINT [AK_RideServiceTypeTranslation] UNIQUE CLUSTERED ([RideServiceTypeId] ASC, [LanguageTypeId] ASC)
);


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