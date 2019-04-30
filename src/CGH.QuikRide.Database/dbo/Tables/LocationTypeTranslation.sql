CREATE TABLE [dbo].[LocationTypeTranslation] (
    [LocationTypeTranslationId] INT             IDENTITY (1, 1) NOT NULL,
    [LocationTypeId]            INT             NOT NULL,
    [LanguageTypeId]            INT             NOT NULL,
    [Value]                     NVARCHAR (4000) NOT NULL,
    [DisplayPriority]           INT             CONSTRAINT [DF_LocationTypeTranslation_DisplayPriority] DEFAULT ((100)) NOT NULL,
    [DataVersion]               INT             CONSTRAINT [DF_LocationTypeTranslation_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]            DATETIME2 (7)   CONSTRAINT [DF_LocationTypeTranslation_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]                 NVARCHAR (200)  NOT NULL,
    [ModifiedUtcDate]           DATETIME2 (7)   CONSTRAINT [DF_LocationTypeTranslation_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]                NVARCHAR (200)  NOT NULL,
    [IsDeleted]                 BIT             CONSTRAINT [DF_LocationTypeTranslation_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_LocationTypeTranslation] PRIMARY KEY NONCLUSTERED ([LocationTypeTranslationId] ASC),
    CONSTRAINT [FK_LocationTypeTranslation_LanguageType] FOREIGN KEY ([LanguageTypeId]) REFERENCES [dbo].[LanguageType] ([LanguageTypeId]),
    CONSTRAINT [FK_LocationTypeTranslation_LocationType] FOREIGN KEY ([LocationTypeId]) REFERENCES [dbo].[LocationType] ([LocationTypeId]) ON DELETE CASCADE,
    CONSTRAINT [AK_LocationTypeTranslation] UNIQUE CLUSTERED ([LocationTypeId] ASC, [LanguageTypeId] ASC)
);


GO





      CREATE TRIGGER [dbo].[trg_LocationTypeTranslation_Update] ON [dbo].[LocationTypeTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM LocationTypeTranslation a
        INNER JOIN inserted b
          ON a.LocationTypeTranslationId = b.LocationTypeTranslationId