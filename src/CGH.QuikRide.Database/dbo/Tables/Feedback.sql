CREATE TABLE [dbo].[Feedback] (
    [FeedbackId]      UNIQUEIDENTIFIER NOT NULL,
    [Title]           NVARCHAR (1024)  NULL,
    [Description]     NVARCHAR (2048)  NULL,
    [FeedbackTypeId]  INT              NOT NULL,
    [Latitude]        FLOAT (53)       NOT NULL,
    [Longitude]       FLOAT (53)       NOT NULL,
    [Dispositioned]   BIT              NOT NULL,
    [UserId]          INT              NOT NULL,
    [DriverId]        INT              NULL,
    [VehicleId]       INT              NULL,
    [DataVersion]     INT              CONSTRAINT [DF_Feedback_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]  DATETIME2 (7)    CONSTRAINT [DF_Feedback_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]       NVARCHAR (200)   NOT NULL,
    [ModifiedUtcDate] DATETIME2 (7)    CONSTRAINT [DF_Feedback_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]      NVARCHAR (200)   NOT NULL,
    [IsDeleted]       BIT              CONSTRAINT [DF_Feedback_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED ([FeedbackId] ASC),
    CONSTRAINT [FK_Feedback_FeedbackType] FOREIGN KEY ([FeedbackTypeId]) REFERENCES [dbo].[FeedbackType] ([FeedbackTypeId])
);


GO

      CREATE TRIGGER [trgFeedbackUpdate] ON Feedback
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Feedback a
        INNER JOIN inserted b
          ON a.FeedbackId = b.FeedbackId