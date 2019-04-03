CREATE TABLE [dbo].[Users_NotificationType] (
    [UserId]             INT            NOT NULL,
    [NotificationTypeId] INT            NOT NULL,
    [DataVersion]        INT            CONSTRAINT [DF_Users_NotificationType_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]     DATETIME2 (7)  CONSTRAINT [DF_Users_NotificationType_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]          NVARCHAR (200) NOT NULL,
    [ModifiedUtcDate]    DATETIME2 (7)  CONSTRAINT [DF_Users_NotificationType_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]         NVARCHAR (200) NOT NULL,
    [IsDeleted]          BIT            CONSTRAINT [DF_Users_NotificationType_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Users_NotificationType] PRIMARY KEY CLUSTERED ([UserId] ASC, [NotificationTypeId] ASC),
    CONSTRAINT [FK_Users_NotificationType_NotificationType] FOREIGN KEY ([NotificationTypeId]) REFERENCES [dbo].[NotificationType] ([NotificationTypeId]),
    CONSTRAINT [FK_Users_NotificationType_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserId])
);


GO

      CREATE TRIGGER [trgUsers_NotificationTypeUpdate] ON Users_NotificationType
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Users_NotificationType a
        INNER JOIN inserted b
          ON a.UserId = b.UserId AND a.NotificationTypeId = b.NotificationTypeId