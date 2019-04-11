CREATE TABLE [dbo].[FeedbackType] (
    [FeedbackTypeId]  INT             NOT NULL,
    [LanguageTypeId]  INT             NOT NULL,
    [Code]            VARCHAR (50)    NOT NULL,
    [DisplayText]     NVARCHAR (128)  NOT NULL,
    [DisplayPriority] INT             CONSTRAINT [DF_FeedbackType_DisplayPriority] DEFAULT ((100)) NOT NULL,
    [Description]     NVARCHAR (1024) NULL,
    [DataVersion]     INT             CONSTRAINT [DF_FeedbackType_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]  DATETIME2 (7)   CONSTRAINT [DF_FeedbackType_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]       NVARCHAR (200)  NOT NULL,
    [ModifiedUtcDate] DATETIME2 (7)   CONSTRAINT [DF_FeedbackType_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]      NVARCHAR (200)  NOT NULL,
    [IsDeleted]       BIT             CONSTRAINT [DF_FeedbackType_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_FeedbackType] PRIMARY KEY CLUSTERED ([FeedbackTypeId] ASC),
    CONSTRAINT [FK_FeedbackType_LanguageType] FOREIGN KEY ([LanguageTypeId]) REFERENCES [dbo].[LanguageType] ([LanguageTypeId]),
    CONSTRAINT [UC_FeedbackType_LanguageTypeId_Code] UNIQUE NONCLUSTERED ([LanguageTypeId] ASC, [Code] ASC)
);


GO

      CREATE TRIGGER [trgFeedbackTypeUpdate] ON FeedbackType
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM FeedbackType a
        INNER JOIN inserted b
          ON a.FeedbackTypeId = b.FeedbackTypeId