CREATE TABLE [dbo].[FeedbackInitiatorTypeTranslation] (
    [FeedbackInitiatorTypeTranslationId] INT             IDENTITY (1, 1) NOT NULL,
    [FeedbackInitiatorTypeId]            INT             NOT NULL,
    [LanguageTypeId]                     INT             NOT NULL,
    [Value]                              NVARCHAR (4000) NOT NULL,
    [DisplayPriority]                    INT             CONSTRAINT [DF_FeedbackInitiatorTypeTranslation_DisplayPriority] DEFAULT ((100)) NOT NULL,
    [DataVersion]                        INT             CONSTRAINT [DF_FeedbackInitiatorTypeTranslation_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]                     DATETIME2 (7)   CONSTRAINT [DF_FeedbackInitiatorTypeTranslation_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]                          NVARCHAR (200)  NOT NULL,
    [ModifiedUtcDate]                    DATETIME2 (7)   CONSTRAINT [DF_FeedbackInitiatorTypeTranslation_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]                         NVARCHAR (200)  NOT NULL,
    [IsDeleted]                          BIT             CONSTRAINT [DF_FeedbackInitiatorTypeTranslation_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_FeedbackInitiatorTypeTranslation] PRIMARY KEY NONCLUSTERED ([FeedbackInitiatorTypeTranslationId] ASC),
    CONSTRAINT [FK_FeedbackInitiatorTypeTranslation_FeedbackInitiatorType] FOREIGN KEY ([FeedbackInitiatorTypeId]) REFERENCES [dbo].[FeedbackInitiatorType] ([FeedbackInitiatorTypeId]) ON DELETE CASCADE,
    CONSTRAINT [FK_FeedbackInitiatorTypeTranslation_LanguageType] FOREIGN KEY ([LanguageTypeId]) REFERENCES [dbo].[LanguageType] ([LanguageTypeId]),
    CONSTRAINT [AK_FeedbackInitiatorTypeTranslation] UNIQUE CLUSTERED ([FeedbackInitiatorTypeId] ASC, [LanguageTypeId] ASC)
);


GO





      CREATE TRIGGER [dbo].[trg_FeedbackInitiatorTypeTranslation_Update] ON [dbo].[FeedbackInitiatorTypeTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM FeedbackInitiatorTypeTranslation a
        INNER JOIN inserted b
          ON a.FeedbackInitiatorTypeTranslationId = b.FeedbackInitiatorTypeTranslationId