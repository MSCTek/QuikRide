CREATE TABLE [dbo].[NotificationTypeTranslation] (
    [NotificationTypeTranslationId] INT             IDENTITY (1, 1) NOT NULL,
    [NotificationTypeId]            INT             NOT NULL,
    [LanguageTypeId]                INT             NOT NULL,
    [Value]                         NVARCHAR (4000) NOT NULL,
    [DisplayPriority]               INT             CONSTRAINT [DF_NotificationTypeTranslation_DisplayPriority] DEFAULT ((100)) NOT NULL,
    [DataVersion]                   INT             CONSTRAINT [DF_NotificationTypeTranslation_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]                DATETIME2 (7)   CONSTRAINT [DF_NotificationTypeTranslation_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]                     NVARCHAR (200)  NOT NULL,
    [ModifiedUtcDate]               DATETIME2 (7)   CONSTRAINT [DF_NotificationTypeTranslation_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]                    NVARCHAR (200)  NOT NULL,
    [IsDeleted]                     BIT             CONSTRAINT [DF_NotificationTypeTranslation_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_NotificationTypeTranslation] PRIMARY KEY NONCLUSTERED ([NotificationTypeTranslationId] ASC),
    CONSTRAINT [FK_NotificationTypeTranslation_LanguageType] FOREIGN KEY ([LanguageTypeId]) REFERENCES [dbo].[LanguageType] ([LanguageTypeId]),
    CONSTRAINT [FK_NotificationTypeTranslation_NotificationType] FOREIGN KEY ([NotificationTypeId]) REFERENCES [dbo].[NotificationType] ([NotificationTypeId]) ON DELETE CASCADE,
    CONSTRAINT [AK_NotificationTypeTranslation] UNIQUE CLUSTERED ([NotificationTypeId] ASC, [LanguageTypeId] ASC)
);


GO





      CREATE TRIGGER [dbo].[trg_NotificationTypeTranslation_Update] ON [dbo].[NotificationTypeTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM NotificationTypeTranslation a
        INNER JOIN inserted b
          ON a.NotificationTypeTranslationId = b.NotificationTypeTranslationId