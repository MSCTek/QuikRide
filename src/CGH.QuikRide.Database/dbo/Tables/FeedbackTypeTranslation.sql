CREATE TABLE [dbo].[FeedbackTypeTranslation] (
    [FeedbackTypeTranslationId] INT             IDENTITY (1, 1) NOT NULL,
    [FeedbackTypeId]            INT             NOT NULL,
    [LanguageTypeId]            INT             NOT NULL,
    [Value]                     NVARCHAR (4000) NOT NULL,
    [DisplayPriority]           INT             CONSTRAINT [DF_FeedbackTypeTranslation_DisplayPriority] DEFAULT ((100)) NOT NULL,
    [DataVersion]               INT             CONSTRAINT [DF_FeedbackTypeTranslation_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]            DATETIME2 (7)   CONSTRAINT [DF_FeedbackTypeTranslation_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]                 NVARCHAR (200)  NOT NULL,
    [ModifiedUtcDate]           DATETIME2 (7)   CONSTRAINT [DF_FeedbackTypeTranslation_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]                NVARCHAR (200)  NOT NULL,
    [IsDeleted]                 BIT             CONSTRAINT [DF_FeedbackTypeTranslation_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_FeedbackTypeTranslation] PRIMARY KEY NONCLUSTERED ([FeedbackTypeTranslationId] ASC),
    CONSTRAINT [FK_FeedbackTypeTranslation_FeedbackType] FOREIGN KEY ([FeedbackTypeId]) REFERENCES [dbo].[FeedbackType] ([FeedbackTypeId]) ON DELETE CASCADE,
    CONSTRAINT [FK_FeedbackTypeTranslation_LanguageType] FOREIGN KEY ([LanguageTypeId]) REFERENCES [dbo].[LanguageType] ([LanguageTypeId]),
    CONSTRAINT [AK_FeedbackTypeTranslation] UNIQUE CLUSTERED ([FeedbackTypeId] ASC, [LanguageTypeId] ASC)
);


GO





      CREATE TRIGGER [dbo].[trg_FeedbackTypeTranslation_Update] ON [dbo].[FeedbackTypeTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM FeedbackTypeTranslation a
        INNER JOIN inserted b
          ON a.FeedbackTypeTranslationId = b.FeedbackTypeTranslationId