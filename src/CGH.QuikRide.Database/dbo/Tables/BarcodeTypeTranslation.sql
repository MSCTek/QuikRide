CREATE TABLE [dbo].[BarcodeTypeTranslation] (
    [BarcodeTypeTranslationId] INT             IDENTITY (1, 1) NOT NULL,
    [BarcodeTypeId]            INT             NOT NULL,
    [LanguageTypeId]           INT             NOT NULL,
    [Value]                    NVARCHAR (4000) NOT NULL,
    [DisplayPriority]          INT             CONSTRAINT [DF_BarcodeTypeTranslation_DisplayPriority] DEFAULT ((100)) NOT NULL,
    [DataVersion]              INT             CONSTRAINT [DF_BarcodeTypeTranslation_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]           DATETIME2 (7)   CONSTRAINT [DF_BarcodeTypeTranslation_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]                NVARCHAR (200)  NOT NULL,
    [ModifiedUtcDate]          DATETIME2 (7)   CONSTRAINT [DF_BarcodeTypeTranslation_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]               NVARCHAR (200)  NOT NULL,
    [IsDeleted]                BIT             CONSTRAINT [DF_BarcodeTypeTranslation_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_BarcodeTypeTranslation] PRIMARY KEY NONCLUSTERED ([BarcodeTypeTranslationId] ASC),
    CONSTRAINT [FK_BarcodeTypeTranslation_BarcodeType] FOREIGN KEY ([BarcodeTypeId]) REFERENCES [dbo].[BarcodeType] ([BarcodeTypeId]) ON DELETE CASCADE,
    CONSTRAINT [FK_BarcodeTypeTranslation_LanguageType] FOREIGN KEY ([LanguageTypeId]) REFERENCES [dbo].[LanguageType] ([LanguageTypeId]),
    CONSTRAINT [AK_BarcodeTypeTranslation] UNIQUE CLUSTERED ([BarcodeTypeId] ASC, [LanguageTypeId] ASC)
);


GO





      CREATE TRIGGER [dbo].[trg_BarcodeTypeTranslation_Update] ON [dbo].[BarcodeTypeTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM BarcodeTypeTranslation a
        INNER JOIN inserted b
          ON a.BarcodeTypeTranslationId = b.BarcodeTypeTranslationId