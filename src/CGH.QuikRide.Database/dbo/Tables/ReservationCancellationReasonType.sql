CREATE TABLE [dbo].[ReservationCancellationReasonType] (
    [ReservationCancellationReasonTypeId] INT            NOT NULL,
    [Code]                                VARCHAR (50)   NOT NULL,
    [DataVersion]                         INT            CONSTRAINT [DF_ReservationCancellationReasonType_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]                      DATETIME2 (7)  CONSTRAINT [DF_ReservationCancellationReasonType_CreatedUTCDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]                           NVARCHAR (200) NOT NULL,
    [ModifiedUtcDate]                     DATETIME2 (7)  CONSTRAINT [DF_ReservationCancellationReasonType_ModifiedUTCDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]                          NVARCHAR (200) NOT NULL,
    [IsDeleted]                           BIT            CONSTRAINT [DF_ReservationCancellationReasonType_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_ReservationCancellationReasonType] PRIMARY KEY CLUSTERED ([ReservationCancellationReasonTypeId] ASC)
);




GO





      CREATE TRIGGER [dbo].[trg_ReservationCancellationReasonType_Update] ON [dbo].[ReservationCancellationReasonType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM ReservationCancellationReasonType a
        INNER JOIN inserted b
          ON a.ReservationCancellationReasonTypeId = b.ReservationCancellationReasonTypeId