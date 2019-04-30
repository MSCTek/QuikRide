CREATE TABLE [dbo].[BusRoute] (
    [BusRouteId]      INT            IDENTITY (1, 1) NOT NULL,
    [BusRouteNumber]  INT            NOT NULL,
    [InServiceSince]  DATE           NULL,
    [DataVersion]     INT            CONSTRAINT [DF_BusRoute_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]  DATETIME2 (7)  CONSTRAINT [DF_BusRoute_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]       NVARCHAR (200) NOT NULL,
    [ModifiedUtcDate] DATETIME2 (7)  CONSTRAINT [DF_BusRoute_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]      NVARCHAR (200) NOT NULL,
    [IsDeleted]       BIT            CONSTRAINT [DF_BusRoute_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_BusRoute] PRIMARY KEY CLUSTERED ([BusRouteId] ASC)
);


GO





      CREATE TRIGGER [dbo].[trg_BusRoute_Update] ON [dbo].[BusRoute]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM BusRoute a
        INNER JOIN inserted b
          ON a.BusRouteId = b.BusRouteId