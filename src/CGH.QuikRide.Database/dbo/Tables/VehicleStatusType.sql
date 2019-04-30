CREATE TABLE [dbo].[VehicleStatusType] (
    [VehicleStatusTypeId] INT            NOT NULL,
    [Code]                VARCHAR (50)   NOT NULL,
    [DataVersion]         INT            CONSTRAINT [DF_VehicleStatusType_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]      DATETIME2 (7)  CONSTRAINT [DF_VehicleStatusType_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]           NVARCHAR (200) NOT NULL,
    [ModifiedUtcDate]     DATETIME2 (7)  CONSTRAINT [DF_VehicleStatusType_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]          NVARCHAR (200) NOT NULL,
    [IsDeleted]           BIT            CONSTRAINT [DF_VehicleStatusType_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_VehicleStatusType] PRIMARY KEY CLUSTERED ([VehicleStatusTypeId] ASC)
);




GO


      CREATE TRIGGER [dbo].[trg_VehicleStatusType_Update] ON [dbo].[VehicleStatusType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM VehicleStatusType a
        INNER JOIN inserted b
          ON a.VehicleStatusTypeId = b.VehicleStatusTypeId