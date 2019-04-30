CREATE TABLE [dbo].[BusRouteStop] (
    [BusRouteStopId]  INT              IDENTITY (1, 1) NOT NULL,
    [BusRouteId]      INT              NOT NULL,
    [LocationId]      UNIQUEIDENTIFIER NOT NULL,
    [IsMajorStop]     BIT              NOT NULL,
    [IsPublishedStop] BIT              NOT NULL,
    [DataVersion]     INT              CONSTRAINT [DF_BusRouteStop_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]  DATETIME2 (7)    CONSTRAINT [DF_BusRouteStop_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]       NVARCHAR (200)   NOT NULL,
    [ModifiedUtcDate] DATETIME2 (7)    CONSTRAINT [DF_BusRouteStop_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]      NVARCHAR (200)   NOT NULL,
    [IsDeleted]       BIT              CONSTRAINT [DF_BusRouteStop_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_BusRouteStop] PRIMARY KEY CLUSTERED ([BusRouteStopId] ASC),
    CONSTRAINT [FK_BusRouteStop_BusRoute] FOREIGN KEY ([BusRouteId]) REFERENCES [dbo].[BusRoute] ([BusRouteId]),
    CONSTRAINT [FK_BusRouteStop_Location] FOREIGN KEY ([LocationId]) REFERENCES [dbo].[Location] ([LocationId])
);


GO





      CREATE TRIGGER [dbo].[trg_BusRouteStop_Update] ON [dbo].[BusRouteStop]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM BusRouteStop a
        INNER JOIN inserted b
          ON a.BusRouteStopId = b.BusRouteStopId