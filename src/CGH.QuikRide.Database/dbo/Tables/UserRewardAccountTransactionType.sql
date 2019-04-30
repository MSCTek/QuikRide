CREATE TABLE [dbo].[UserRewardAccountTransactionType] (
    [UserRewardAccountTransactionTypeId] INT            NOT NULL,
    [Code]                               VARCHAR (50)   NOT NULL,
    [DebitOrCredit]                      CHAR (1)       NOT NULL,
    [DataVersion]                        INT            CONSTRAINT [DF_UserRewardAccountTransactionType_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]                     DATETIME2 (7)  CONSTRAINT [DF_UserRewardAccountTransactionType_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]                          NVARCHAR (200) NOT NULL,
    [ModifiedUtcDate]                    DATETIME2 (7)  CONSTRAINT [DF_UserRewardAccountTransactionType_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]                         NVARCHAR (200) NOT NULL,
    [IsDeleted]                          BIT            CONSTRAINT [DF_UserRewardAccountTransactionType_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_UserRewardAccountTransactionType] PRIMARY KEY CLUSTERED ([UserRewardAccountTransactionTypeId] ASC)
);


GO




      CREATE TRIGGER [dbo].[trg_UserRewardAccountTransactionType_Update] ON [dbo].[UserRewardAccountTransactionType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM UserRewardAccountTransactionType a
        INNER JOIN inserted b
          ON a.UserRewardAccountTransactionTypeId = b.UserRewardAccountTransactionTypeId