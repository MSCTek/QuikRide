CREATE TABLE [dbo].[VehicleFeatureType] (
    [VehicleFeatureTypeId] INT            NOT NULL,
    [Code]                 VARCHAR (50)   NOT NULL,
    [DataVersion]          INT            CONSTRAINT [DF_VehicleFeatureType_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]       DATETIME2 (7)  CONSTRAINT [DF_VehicleFeatureType_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]            NVARCHAR (200) NOT NULL,
    [ModifiedUtcDate]      DATETIME2 (7)  CONSTRAINT [DF_VehicleFeatureType_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]           NVARCHAR (200) NOT NULL,
    [IsDeleted]            BIT            CONSTRAINT [DF_VehicleFeatureType_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_VehicleFeatureType] PRIMARY KEY CLUSTERED ([VehicleFeatureTypeId] ASC)
);




GO


      CREATE TRIGGER [dbo].[trg_VehicleFeatureType_Update] ON [dbo].[VehicleFeatureType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM VehicleFeatureType a
        INNER JOIN inserted b
          ON a.VehicleFeatureTypeId = b.VehicleFeatureTypeId