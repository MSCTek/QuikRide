CREATE TABLE [dbo].[Users_Location] (
    [UserId]          INT              NOT NULL,
    [LocationId]      UNIQUEIDENTIFIER NOT NULL,
    [DataVersion]     INT              CONSTRAINT [DF_Users_Location_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]  DATETIME2 (7)    CONSTRAINT [DF_Users_Location_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]       NVARCHAR (200)   NOT NULL,
    [ModifiedUtcDate] DATETIME2 (7)    CONSTRAINT [DF_Users_Location_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]      NVARCHAR (200)   NOT NULL,
    [IsDeleted]       BIT              CONSTRAINT [DF_Users_Location_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Users_Location] PRIMARY KEY CLUSTERED ([UserId] ASC, [LocationId] ASC),
    CONSTRAINT [FK_Users_Location_Location] FOREIGN KEY ([LocationId]) REFERENCES [dbo].[Location] ([LocationId]),
    CONSTRAINT [FK_Users_Location_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserId])
);




GO


      CREATE TRIGGER [dbo].[trg_Users_Location_Update] ON [dbo].[Users_Location]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Users_Location a
        INNER JOIN inserted b
          ON a.UserId = b.UserId AND a.LocationId = b.LocationId