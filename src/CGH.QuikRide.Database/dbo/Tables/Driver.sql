CREATE TABLE [dbo].[Driver] (
    [DriverId]             INT            IDENTITY (1, 1) NOT NULL,
    [UserId]               INT            NOT NULL,
    [IsEligibleForDriving] BIT            CONSTRAINT [DF_Driver_IsEligibleForDriving] DEFAULT ((1)) NOT NULL,
    [CurrentVehicleId]     INT            NULL,
    [Latitude]             FLOAT (53)     NULL,
    [Longitude]            FLOAT (53)     NULL,
    [DataVersion]          INT            CONSTRAINT [DF_Driver_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]       DATETIME2 (7)  CONSTRAINT [DF_Driver_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]            NVARCHAR (200) NOT NULL,
    [ModifiedUtcDate]      DATETIME2 (7)  CONSTRAINT [DF_Driver_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]           NVARCHAR (200) NOT NULL,
    [IsDeleted]            BIT            CONSTRAINT [DF_Driver_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED ([DriverId] ASC),
    CONSTRAINT [FK_Driver_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserId]),
    CONSTRAINT [FK_Driver_Vehicle] FOREIGN KEY ([CurrentVehicleId]) REFERENCES [dbo].[Vehicle] ([VehicleId])
);




GO





      CREATE TRIGGER [dbo].[trg_Driver_Update] ON [dbo].[Driver]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Driver a
        INNER JOIN inserted b
          ON a.DriverId = b.DriverId