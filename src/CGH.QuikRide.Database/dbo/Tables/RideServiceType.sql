CREATE TABLE [dbo].[RideServiceType] (
    [RideServiceTypeId] INT            NOT NULL,
    [Code]              VARCHAR (50)   NOT NULL,
    [DataVersion]       INT            CONSTRAINT [DF_RideServiceType_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]    DATETIME2 (7)  CONSTRAINT [DF_RideServiceType_CreatedUTCDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]         NVARCHAR (200) NOT NULL,
    [ModifiedUtcDate]   DATETIME2 (7)  CONSTRAINT [DF_RideServiceType_ModifiedUTCDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]        NVARCHAR (200) NOT NULL,
    [IsDeleted]         BIT            CONSTRAINT [DF_RideServiceType_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_RideServiceType] PRIMARY KEY CLUSTERED ([RideServiceTypeId] ASC)
);




GO




      CREATE TRIGGER [dbo].[trg_RideServiceType_Update] ON [dbo].[RideServiceType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM RideServiceType a
        INNER JOIN inserted b
          ON a.RideServiceTypeId = b.RideServiceTypeId