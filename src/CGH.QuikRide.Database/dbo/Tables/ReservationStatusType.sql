CREATE TABLE [dbo].[ReservationStatusType] (
    [ReservationStatusTypeId] INT            NOT NULL,
    [Code]                    VARCHAR (50)   NOT NULL,
    [DataVersion]             INT            CONSTRAINT [DF_ReservationStatusType_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]          DATETIME2 (7)  CONSTRAINT [DF_ReservationStatusType_CreatedUTCDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]               NVARCHAR (200) NOT NULL,
    [ModifiedUtcDate]         DATETIME2 (7)  CONSTRAINT [DF_ReservationStatusType_ModifiedUTCDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]              NVARCHAR (200) NOT NULL,
    [IsDeleted]               BIT            CONSTRAINT [DF_ReservationStatusType_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_ReservationStatusType] PRIMARY KEY CLUSTERED ([ReservationStatusTypeId] ASC)
);




GO





      CREATE TRIGGER [dbo].[trg_ReservationStatusType_Update] ON [dbo].[ReservationStatusType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM ReservationStatusType a
        INNER JOIN inserted b
          ON a.ReservationStatusTypeId = b.ReservationStatusTypeId