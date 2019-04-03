CREATE TABLE [dbo].[Ride] (
    [RideId]            UNIQUEIDENTIFIER NOT NULL,
    [Start]             DATETIME2 (7)    NULL,
    [StartLatitude]     FLOAT (53)       NULL,
    [StartLongitude]    FLOAT (53)       NULL,
    [End]               DATETIME2 (7)    NULL,
    [EndLatitude]       FLOAT (53)       NULL,
    [EndLongitude]      FLOAT (53)       NULL,
    [VehicleId]         INT              NOT NULL,
    [DriverId]          INT              NOT NULL,
    [UserId]            INT              NOT NULL,
    [DurationInSeconds] INT              NULL,
    [GeoDistance]       INT              NULL,
    [DataVersion]       INT              CONSTRAINT [DF_Ride_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]    DATETIME2 (7)    CONSTRAINT [DF_Ride_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]         NVARCHAR (200)   NOT NULL,
    [ModifiedUtcDate]   DATETIME2 (7)    CONSTRAINT [DF_Ride_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]        NVARCHAR (200)   NOT NULL,
    [IsDeleted]         BIT              CONSTRAINT [DF_Ride_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Ride] PRIMARY KEY CLUSTERED ([RideId] ASC),
    CONSTRAINT [FK_Ride_Driver] FOREIGN KEY ([DriverId]) REFERENCES [dbo].[Driver] ([DriverId]),
    CONSTRAINT [FK_Ride_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserId]),
    CONSTRAINT [FK_Ride_Vehicle] FOREIGN KEY ([VehicleId]) REFERENCES [dbo].[Vehicle] ([VehicleId])
);


GO

      CREATE TRIGGER [trgRideUpdate] ON Ride
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Ride a
        INNER JOIN inserted b
          ON a.RideId = b.RideId