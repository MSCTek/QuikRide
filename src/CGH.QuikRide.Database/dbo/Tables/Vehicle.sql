CREATE TABLE [dbo].[Vehicle] (
    [VehicleId]           INT            IDENTITY (1, 1) NOT NULL,
    [VehicleTypeId]       INT            NOT NULL,
    [VehicleStatusTypeId] INT            NOT NULL,
    [Latitude]            FLOAT (53)     NULL,
    [Longitude]           FLOAT (53)     NULL,
    [VIN]                 CHAR (17)      NOT NULL,
    [LicensePlateNumber]  VARCHAR (10)   NULL,
    [StartDateInService]  DATE           NOT NULL,
    [EndDateInService]    DATE           NULL,
    [DataVersion]         INT            CONSTRAINT [DF_Vehicle_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]      DATETIME2 (7)  CONSTRAINT [DF_Vehicle_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]           NVARCHAR (200) NOT NULL,
    [ModifiedUtcDate]     DATETIME2 (7)  CONSTRAINT [DF_Vehicle_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]          NVARCHAR (200) NOT NULL,
    [IsDeleted]           BIT            CONSTRAINT [DF_Vehicle_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED ([VehicleId] ASC),
    CONSTRAINT [FK_Vehicle_VehicleStatusType] FOREIGN KEY ([VehicleStatusTypeId]) REFERENCES [dbo].[VehicleStatusType] ([VehicleStatusTypeId]),
    CONSTRAINT [FK_Vehicle_VehicleType] FOREIGN KEY ([VehicleTypeId]) REFERENCES [dbo].[VehicleType] ([VehicleTypeId])
);


GO

      CREATE TRIGGER [trgVehicleUpdate] ON Vehicle
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Vehicle a
        INNER JOIN inserted b
          ON a.VehicleId = b.VehicleId