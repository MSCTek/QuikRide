CREATE TABLE [dbo].[ReservationRequestCancellationReasonType] (
    [ReservationRequestCancellationReasonTypeId] INT            NOT NULL,
    [Code]                                       VARCHAR (50)   NOT NULL,
    [DataVersion]                                INT            CONSTRAINT [DF_ReservationRequestCancellationReasonType_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]                             DATETIME2 (7)  CONSTRAINT [DF_ReservationRequestCancellationReasonType_CreatedUTCDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]                                  NVARCHAR (200) NOT NULL,
    [ModifiedUtcDate]                            DATETIME2 (7)  CONSTRAINT [DF_ReservationRequestCancellationReasonType_ModifiedUTCDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]                                 NVARCHAR (200) NOT NULL,
    [IsDeleted]                                  BIT            CONSTRAINT [DF_ReservationRequestCancellationReasonType_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_ReservationRequestCancellationReasonType] PRIMARY KEY CLUSTERED ([ReservationRequestCancellationReasonTypeId] ASC)
);




GO





      CREATE TRIGGER [dbo].[trg_ReservationRequestCancellationReasonType_Update] ON [dbo].[ReservationRequestCancellationReasonType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM ReservationRequestCancellationReasonType a
        INNER JOIN inserted b
          ON a.ReservationRequestCancellationReasonTypeId = b.ReservationRequestCancellationReasonTypeId