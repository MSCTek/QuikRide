CREATE TABLE [dbo].[LocationType] (
    [LocationTypeId]  INT            NOT NULL,
    [Code]            VARCHAR (50)   NOT NULL,
    [DataVersion]     INT            CONSTRAINT [DF_LocationType_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]  DATETIME2 (7)  CONSTRAINT [DF_LocationType_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]       NVARCHAR (200) NOT NULL,
    [ModifiedUtcDate] DATETIME2 (7)  CONSTRAINT [DF_LocationType_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]      NVARCHAR (200) NOT NULL,
    [IsDeleted]       BIT            CONSTRAINT [DF_LocationType_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_LocationType] PRIMARY KEY CLUSTERED ([LocationTypeId] ASC)
);


GO





      CREATE TRIGGER [dbo].[trg_LocationType_Update] ON [dbo].[LocationType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM LocationType a
        INNER JOIN inserted b
          ON a.LocationTypeId = b.LocationTypeId