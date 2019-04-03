CREATE TABLE [dbo].[RidePosition] (
    [RidePositionId]  UNIQUEIDENTIFIER NOT NULL,
    [RideId]          UNIQUEIDENTIFIER NOT NULL,
    [Latitude]        NUMERIC (18, 10) NOT NULL,
    [Longitude]       NUMERIC (18, 10) NOT NULL,
    [TS]              DATETIME2 (7)    NOT NULL,
    [DataVersion]     INT              CONSTRAINT [DF_RidePosition_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]  DATETIME2 (7)    CONSTRAINT [DF_RidePosition_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]       NVARCHAR (200)   NOT NULL,
    [ModifiedUtcDate] DATETIME2 (7)    CONSTRAINT [DF_RidePosition_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]      NVARCHAR (200)   NOT NULL,
    [IsDeleted]       BIT              CONSTRAINT [DF_RidePosition_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_RidePosition] PRIMARY KEY CLUSTERED ([RidePositionId] ASC),
    CONSTRAINT [FK_RidePosition_Ride] FOREIGN KEY ([RideId]) REFERENCES [dbo].[Ride] ([RideId])
);


GO
CREATE NONCLUSTERED INDEX [IX_RidePosition_RideId]
    ON [dbo].[RidePosition]([RideId] ASC);


GO

      CREATE TRIGGER [trgRidePositionUpdate] ON RidePosition
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM RidePosition a
        INNER JOIN inserted b
          ON a.RidePositionId = b.RidePositionId