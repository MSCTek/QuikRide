CREATE TABLE [dbo].[VehicleType] (
    [VehicleTypeId]          INT             NOT NULL,
    [LanguageTypeId]         INT             NOT NULL,
    [Code]                   VARCHAR (50)    NOT NULL,
    [DisplayText]            NVARCHAR (128)  NOT NULL,
    [DisplayPriority]        INT             CONSTRAINT [DF_VehicleType_DisplayPriority] DEFAULT ((100)) NOT NULL,
    [Description]            NVARCHAR (1024) NULL,
    [Capacity]               INT             NULL,
    [LengthInFeetMin]        FLOAT (53)      NULL,
    [LengthInFeetMax]        FLOAT (53)      NULL,
    [LengthWithBumpers]      FLOAT (53)      NULL,
    [WidthInFeet]            FLOAT (53)      NULL,
    [WidthWithMirrorsInFeet] FLOAT (53)      NULL,
    [HeightInFeet]           FLOAT (53)      NULL,
    [WheelbaseInFeet]        FLOAT (53)      NULL,
    [FrontOverhangInFeet]    FLOAT (53)      NULL,
    [RearOverhangInFeet]     FLOAT (53)      NULL,
    [GroundClearanceInFeet]  FLOAT (53)      NULL,
    [DataVersion]            INT             CONSTRAINT [DF_VehicleType_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]         DATETIME2 (7)   CONSTRAINT [DF_VehicleType_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]              NVARCHAR (200)  NOT NULL,
    [ModifiedUtcDate]        DATETIME2 (7)   CONSTRAINT [DF_VehicleType_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]             NVARCHAR (200)  NOT NULL,
    [IsDeleted]              BIT             CONSTRAINT [DF_VehicleType_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_VehicleType] PRIMARY KEY CLUSTERED ([VehicleTypeId] ASC),
    CONSTRAINT [FK_VehicleType_LanguageType] FOREIGN KEY ([LanguageTypeId]) REFERENCES [dbo].[LanguageType] ([LanguageTypeId]),
    CONSTRAINT [UC_VehicleType_LanguageTypeId_Code] UNIQUE NONCLUSTERED ([LanguageTypeId] ASC, [Code] ASC)
);


GO

      CREATE TRIGGER [trgVehicleTypeUpdate] ON VehicleType
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM VehicleType a
        INNER JOIN inserted b
          ON a.VehicleTypeId = b.VehicleTypeId