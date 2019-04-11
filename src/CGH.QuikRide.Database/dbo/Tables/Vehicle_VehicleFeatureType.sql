CREATE TABLE [dbo].[Vehicle_VehicleFeatureType] (
    [VehicleId]            INT            NOT NULL,
    [VehicleFeatureTypeId] INT            NOT NULL,
    [DataVersion]          INT            CONSTRAINT [DF_Vehicle_VehicleFeatureType_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]       DATETIME2 (7)  CONSTRAINT [DF_Vehicle_VehicleFeatureType_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]            NVARCHAR (200) NOT NULL,
    [ModifiedUtcDate]      DATETIME2 (7)  CONSTRAINT [DF_Vehicle_VehicleFeatureType_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]           NVARCHAR (200) NOT NULL,
    [IsDeleted]            BIT            CONSTRAINT [DF_Vehicle_VehicleFeatureType_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Vehicle_VehicleFeatureType] PRIMARY KEY CLUSTERED ([VehicleId] ASC, [VehicleFeatureTypeId] ASC),
    CONSTRAINT [FK_Vehicle_VehicleFeatureType_Vehicle] FOREIGN KEY ([VehicleId]) REFERENCES [dbo].[Vehicle] ([VehicleId]),
    CONSTRAINT [FK_Vehicle_VehicleFeatureType_VehicleFeatureType] FOREIGN KEY ([VehicleFeatureTypeId]) REFERENCES [dbo].[VehicleFeatureType] ([VehicleFeatureTypeId])
);


GO

      CREATE TRIGGER [trgVehicle_VehicleFeatureTypeUpdate] ON Vehicle_VehicleFeatureType
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Vehicle_VehicleFeatureType a
        INNER JOIN inserted b
          ON a.VehicleId = b.VehicleId AND a.VehicleFeatureTypeId = b.VehicleFeatureTypeId