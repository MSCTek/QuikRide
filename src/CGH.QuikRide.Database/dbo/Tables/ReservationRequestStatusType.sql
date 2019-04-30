CREATE TABLE [dbo].[ReservationRequestStatusType] (
    [ReservationRequestStatusTypeId] INT            NOT NULL,
    [Code]                           VARCHAR (50)   NOT NULL,
    [DataVersion]                    INT            CONSTRAINT [DF_ReservationRequestStatusType_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]                 DATETIME2 (7)  CONSTRAINT [DF_ReservationRequestStatusType_CreatedUTCDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]                      NVARCHAR (200) NOT NULL,
    [ModifiedUtcDate]                DATETIME2 (7)  CONSTRAINT [DF_ReservationRequestStatusType_ModifiedUTCDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]                     NVARCHAR (200) NOT NULL,
    [IsDeleted]                      BIT            CONSTRAINT [DF_ReservationRequestStatusType_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_ReservationRequestStatusType] PRIMARY KEY CLUSTERED ([ReservationRequestStatusTypeId] ASC)
);




GO





      CREATE TRIGGER [dbo].[trg_ReservationRequestStatusType_Update] ON [dbo].[ReservationRequestStatusType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM ReservationRequestStatusType a
        INNER JOIN inserted b
          ON a.ReservationRequestStatusTypeId = b.ReservationRequestStatusTypeId