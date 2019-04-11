CREATE TABLE [dbo].[FeedbackInitiatorType] (
    [FeedbackInitiatorTypeId] INT             NOT NULL,
    [LanguageTypeId]          INT             NOT NULL,
    [Code]                    VARCHAR (50)    NOT NULL,
    [DisplayText]             NVARCHAR (128)  NOT NULL,
    [DisplayPriority]         INT             CONSTRAINT [DF_FeedbackInitiatorType_DisplayPriority] DEFAULT ((100)) NOT NULL,
    [Description]             NVARCHAR (1024) NULL,
    [DataVersion]             INT             CONSTRAINT [DF_FeedbackInitiatorType_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]          DATETIME2 (7)   CONSTRAINT [DF_FeedbackInitiatorType_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]               NVARCHAR (200)  NOT NULL,
    [ModifiedUtcDate]         DATETIME2 (7)   CONSTRAINT [DF_FeedbackInitiatorType_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]              NVARCHAR (200)  NOT NULL,
    [IsDeleted]               BIT             CONSTRAINT [DF_FeedbackInitiatorType_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_FeedbackInitiatorType] PRIMARY KEY CLUSTERED ([FeedbackInitiatorTypeId] ASC),
    CONSTRAINT [FK_FeedbackInitiatorType_LanguageType] FOREIGN KEY ([LanguageTypeId]) REFERENCES [dbo].[LanguageType] ([LanguageTypeId]),
    CONSTRAINT [UC_FeedbackInitiatorType_LanguageTypeId_Code] UNIQUE NONCLUSTERED ([LanguageTypeId] ASC, [Code] ASC)
);

