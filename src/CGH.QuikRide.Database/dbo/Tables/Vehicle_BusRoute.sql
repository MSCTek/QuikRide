CREATE TABLE [dbo].[Vehicle_BusRoute] (
    [VehicleId]       INT            NOT NULL,
    [BusRouteId]      INT            NOT NULL,
    [DataVersion]     INT            CONSTRAINT [DF_Vehicle_BusRoute_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]  DATETIME2 (7)  CONSTRAINT [DF_Vehicle_BusRoute_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]       NVARCHAR (200) NOT NULL,
    [ModifiedUtcDate] DATETIME2 (7)  CONSTRAINT [DF_Vehicle_BusRoute_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]      NVARCHAR (200) NOT NULL,
    [IsDeleted]       BIT            CONSTRAINT [DF_Vehicle_BusRoute_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Vehicle_BusRoute] PRIMARY KEY CLUSTERED ([VehicleId] ASC, [BusRouteId] ASC),
    CONSTRAINT [FK_Vehicle_BusRoute_BusRoute] FOREIGN KEY ([BusRouteId]) REFERENCES [dbo].[BusRoute] ([BusRouteId]),
    CONSTRAINT [FK_Vehicle_BusRoute_Vehicle] FOREIGN KEY ([VehicleId]) REFERENCES [dbo].[Vehicle] ([VehicleId])
);


GO


      CREATE TRIGGER [dbo].[trg_Vehicle_BusRoute_Update] ON [dbo].[Vehicle_BusRoute]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Vehicle_BusRoute a
        INNER JOIN inserted b
          ON a.VehicleId = b.VehicleId AND a.BusRouteId = b.BusRouteId