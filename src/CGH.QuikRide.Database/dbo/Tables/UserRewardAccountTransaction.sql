CREATE TABLE [dbo].[UserRewardAccountTransaction] (
    [UserRewardAccountTransactionId]     UNIQUEIDENTIFIER NOT NULL,
    [UserRewardAccountId]                UNIQUEIDENTIFIER NOT NULL,
    [UserRewardAccountTransactionTypeId] INT              NOT NULL,
    [Value]                              INT              NULL,
    [Memo]                               NVARCHAR (1000)  NULL,
    [DataVersion]                        INT              CONSTRAINT [DF_UserRewardAccountTransaction_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]                     DATETIME2 (7)    CONSTRAINT [DF_UserRewardAccountTransaction_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]                          NVARCHAR (200)   NOT NULL,
    [ModifiedUtcDate]                    DATETIME2 (7)    CONSTRAINT [DF_UserRewardAccountTransaction_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]                         NVARCHAR (200)   NOT NULL,
    [IsDeleted]                          BIT              CONSTRAINT [DF_UserRewardAccountTransaction_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_UserRewardAccountTransaction] PRIMARY KEY CLUSTERED ([UserRewardAccountTransactionId] ASC),
    CONSTRAINT [FK_UserRewardAccountTransaction_UserRewardAccount] FOREIGN KEY ([UserRewardAccountId]) REFERENCES [dbo].[UserRewardAccount] ([UserRewardAccountId]),
    CONSTRAINT [FK_UserRewardAccountTransaction_UserRewardAccountTransactionType] FOREIGN KEY ([UserRewardAccountTransactionTypeId]) REFERENCES [dbo].[UserRewardAccountTransactionType] ([UserRewardAccountTransactionTypeId])
);


GO




      CREATE TRIGGER [dbo].[trg_UserRewardAccountTransaction_Update] ON [dbo].[UserRewardAccountTransaction]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM UserRewardAccountTransaction a
        INNER JOIN inserted b
          ON a.UserRewardAccountTransactionId = b.UserRewardAccountTransactionId