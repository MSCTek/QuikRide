CREATE TABLE [dbo].[NotificationType] (
    [NotificationTypeId] INT             NOT NULL,
    [LanguageTypeId]     INT             NOT NULL,
    [Code]               VARCHAR (50)    NOT NULL,
    [DisplayText]        NVARCHAR (128)  NOT NULL,
    [DisplayPriority]    INT             CONSTRAINT [DF_NotificationType_DisplayPriority] DEFAULT ((100)) NOT NULL,
    [Description]        NVARCHAR (1024) NULL,
    [DataVersion]        INT             CONSTRAINT [DF_NotificationType_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]     DATETIME2 (7)   CONSTRAINT [DF_NotificationType_CreatedUTCDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]          NVARCHAR (200)  NOT NULL,
    [ModifiedUtcDate]    DATETIME2 (7)   CONSTRAINT [DF_NotificationType_ModifiedUTCDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]         NVARCHAR (200)  NOT NULL,
    [IsDeleted]          BIT             CONSTRAINT [DF_NotificationType_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_NotificationType] PRIMARY KEY CLUSTERED ([NotificationTypeId] ASC),
    CONSTRAINT [FK_NotificationType_LanguageType] FOREIGN KEY ([LanguageTypeId]) REFERENCES [dbo].[LanguageType] ([LanguageTypeId]),
    CONSTRAINT [UC_NotificationType_LanguageTypeId_Code] UNIQUE NONCLUSTERED ([LanguageTypeId] ASC, [Code] ASC)
);


GO

      CREATE TRIGGER [trgNotificationTypeUpdate] ON NotificationType
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM NotificationType a
        INNER JOIN inserted b
          ON a.NotificationTypeId = b.NotificationTypeId