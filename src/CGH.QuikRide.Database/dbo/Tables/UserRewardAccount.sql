CREATE TABLE [dbo].[UserRewardAccount] (
    [UserRewardAccountId] UNIQUEIDENTIFIER NOT NULL,
    [UserId]              INT              NOT NULL,
    [DataVersion]         INT              CONSTRAINT [DF_UserRewardAccount_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]      DATETIME2 (7)    CONSTRAINT [DF_UserRewardAccount_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]           NVARCHAR (200)   NOT NULL,
    [ModifiedUtcDate]     DATETIME2 (7)    CONSTRAINT [DF_UserRewardAccount_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]          NVARCHAR (200)   NOT NULL,
    [IsDeleted]           BIT              CONSTRAINT [DF_UserRewardAccount_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_UserRewardAccount] PRIMARY KEY CLUSTERED ([UserId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserRewardAccount]
    ON [dbo].[UserRewardAccount]([UserRewardAccountId] ASC);


GO




      CREATE TRIGGER [dbo].[trg_UserRewardAccount_Update] ON [dbo].[UserRewardAccount]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM UserRewardAccount a
        INNER JOIN inserted b
          ON a.UserRewardAccountId = b.UserRewardAccountId