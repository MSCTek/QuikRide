CREATE TABLE [dbo].[VehicleType_VehicleFeatureType] (
    [VehicleTypeId]        INT            NOT NULL,
    [VehicleFeatureTypeId] INT            NOT NULL,
    [DataVersion]          INT            CONSTRAINT [DF_VehicleType_VehicleFeatureType_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]       DATETIME2 (7)  CONSTRAINT [DF_VehicleType_VehicleFeatureType_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]            NVARCHAR (200) NOT NULL,
    [ModifiedUtcDate]      DATETIME2 (7)  CONSTRAINT [DF_VehicleType_VehicleFeatureType_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]           NVARCHAR (200) NOT NULL,
    [IsDeleted]            BIT            CONSTRAINT [DF_VehicleType_VehicleFeatureType_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_VehicleType_VehicleFeatureType] PRIMARY KEY CLUSTERED ([VehicleTypeId] ASC, [VehicleFeatureTypeId] ASC),
    CONSTRAINT [FK_VehicleType_VehicleFeatureType_VehicleFeatureType] FOREIGN KEY ([VehicleFeatureTypeId]) REFERENCES [dbo].[VehicleFeatureType] ([VehicleFeatureTypeId]),
    CONSTRAINT [FK_VehicleType_VehicleFeatureType_VehicleType] FOREIGN KEY ([VehicleTypeId]) REFERENCES [dbo].[VehicleType] ([VehicleTypeId])
);


GO

      CREATE TRIGGER [trgVehicleType_VehicleFeatureTypeUpdate] ON VehicleType_VehicleFeatureType
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM VehicleType_VehicleFeatureType a
        INNER JOIN inserted b
          ON a.VehicleTypeId = b.VehicleTypeId AND a.VehicleFeatureTypeId = b.VehicleFeatureTypeId