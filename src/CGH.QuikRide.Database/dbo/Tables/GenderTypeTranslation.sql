CREATE TABLE [dbo].[GenderTypeTranslation] (
    [GenderTypeTranslationId] INT             IDENTITY (1, 1) NOT NULL,
    [GenderTypeId]            INT             NOT NULL,
    [LanguageTypeId]          INT             NOT NULL,
    [Value]                   NVARCHAR (4000) NOT NULL,
    [DisplayPriority]         INT             CONSTRAINT [DF_GenderTypeTranslation_DisplayPriority] DEFAULT ((100)) NOT NULL,
    [Description]             NVARCHAR (1024) NULL,
    [DataVersion]             INT             CONSTRAINT [DF_GenderTypeTranslation_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]          DATETIME2 (7)   CONSTRAINT [DF_GenderTypeTranslation_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]               NVARCHAR (200)  NOT NULL,
    [ModifiedUtcDate]         DATETIME2 (7)   CONSTRAINT [DF_GenderTypeTranslation_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]              NVARCHAR (200)  NOT NULL,
    [IsDeleted]               BIT             CONSTRAINT [DF_GenderTypeTranslation_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_GenderTypeTranslation] PRIMARY KEY NONCLUSTERED ([GenderTypeTranslationId] ASC),
    CONSTRAINT [FK_GenderTypeTranslation_GenderType] FOREIGN KEY ([GenderTypeId]) REFERENCES [dbo].[GenderType] ([GenderTypeId]) ON DELETE CASCADE,
    CONSTRAINT [FK_GenderTypeTranslation_LanguageType] FOREIGN KEY ([LanguageTypeId]) REFERENCES [dbo].[LanguageType] ([LanguageTypeId]),
    CONSTRAINT [AK_GenderTypeTranslation] UNIQUE CLUSTERED ([GenderTypeId] ASC, [LanguageTypeId] ASC)
);


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