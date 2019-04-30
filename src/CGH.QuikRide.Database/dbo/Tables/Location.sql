CREATE TABLE [dbo].[Location] (
    [LocationId]      UNIQUEIDENTIFIER NOT NULL,
    [LocationTypeId]  INT              NOT NULL,
    [Name]            VARCHAR (100)    NOT NULL,
    [Latitude]        FLOAT (53)       NULL,
    [Longitude]       FLOAT (53)       NULL,
    [AddressLine1]    VARCHAR (100)    NULL,
    [AddressLine2]    VARCHAR (100)    NULL,
    [City]            VARCHAR (100)    NOT NULL,
    [State]           VARCHAR (100)    NOT NULL,
    [PostalCode]      VARCHAR (100)    NOT NULL,
    [DataVersion]     INT              CONSTRAINT [DF_Location_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]  DATETIME2 (7)    CONSTRAINT [DF_Location_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]       NVARCHAR (200)   NOT NULL,
    [ModifiedUtcDate] DATETIME2 (7)    CONSTRAINT [DF_Location_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]      NVARCHAR (200)   NOT NULL,
    [IsDeleted]       BIT              CONSTRAINT [DF_Location_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED ([LocationId] ASC),
    CONSTRAINT [FK_Location_LocationType] FOREIGN KEY ([LocationTypeId]) REFERENCES [dbo].[LocationType] ([LocationTypeId])
);




GO





      CREATE TRIGGER [dbo].[trg_Location_Update] ON [dbo].[Location]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Location a
        INNER JOIN inserted b
          ON a.LocationId = b.LocationId