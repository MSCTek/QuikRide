CREATE TABLE [dbo].[UserRewardAccountTransactionTypeTranslation] (
    [UserRewardAccountTransactionTypeTranslationId] INT             IDENTITY (1, 1) NOT NULL,
    [UserRewardAccountTransactionTypeId]            INT             NOT NULL,
    [LanguageTypeId]                                INT             NOT NULL,
    [Value]                                         NVARCHAR (4000) NOT NULL,
    [DisplayPriority]                               INT             CONSTRAINT [DF_UserRewardAccountTransactionTypeTranslation_DisplayPriority] DEFAULT ((100)) NOT NULL,
    [Description]                                   NVARCHAR (1024) NULL,
    [DataVersion]                                   INT             CONSTRAINT [DF_UserRewardAccountTransactionTypeTranslation_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]                                DATETIME2 (7)   CONSTRAINT [DF_UserRewardAccountTransactionTypeTranslation_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]                                     NVARCHAR (200)  NOT NULL,
    [ModifiedUtcDate]                               DATETIME2 (7)   CONSTRAINT [DF_UserRewardAccountTransactionTypeTranslation_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]                                    NVARCHAR (200)  NOT NULL,
    [IsDeleted]                                     BIT             CONSTRAINT [DF_UserRewardAccountTransactionTypeTranslation_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_UserRewardAccountTransactionTypeTranslation] PRIMARY KEY NONCLUSTERED ([UserRewardAccountTransactionTypeTranslationId] ASC),
    CONSTRAINT [FK_UserRewardAccountTransactionTypeTranslation_LanguageType] FOREIGN KEY ([LanguageTypeId]) REFERENCES [dbo].[LanguageType] ([LanguageTypeId]),
    CONSTRAINT [FK_UserRewardAccountTransactionTypeTranslation_UserRewardAccountTransactionType] FOREIGN KEY ([UserRewardAccountTransactionTypeId]) REFERENCES [dbo].[UserRewardAccountTransactionType] ([UserRewardAccountTransactionTypeId]) ON DELETE CASCADE,
    CONSTRAINT [AK_UserRewardAccountTransactionTypeTranslation] UNIQUE CLUSTERED ([UserRewardAccountTransactionTypeId] ASC, [LanguageTypeId] ASC)
);


GO




      CREATE TRIGGER [dbo].[trg_UserRewardAccountTransactionTypeTranslation_Update] ON [dbo].[UserRewardAccountTransactionTypeTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM UserRewardAccountTransactionTypeTranslation a
        INNER JOIN inserted b
          ON a.UserRewardAccountTransactionTypeTranslationId = b.UserRewardAccountTransactionTypeTranslationId