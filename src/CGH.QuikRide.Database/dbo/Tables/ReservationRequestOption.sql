CREATE TABLE [dbo].[ReservationRequestOption] (
    [ReservationRequestOptionId] INT              NOT NULL,
    [ReservationRequestId]       UNIQUEIDENTIFIER NOT NULL,
    [SuggestedPickupStart]       DATETIME2 (7)    NOT NULL,
    [SuggestedPickupEnd]         DATETIME2 (7)    NOT NULL,
    [EstimatedArrivalStart]      DATETIME2 (7)    NOT NULL,
    [EstimatedArrivalEnd]        DATETIME2 (7)    NOT NULL,
    [Score]                      INT              NOT NULL,
    [DataVersion]                INT              NOT NULL,
    [CreatedUtcDate]             DATETIME2 (7)    NOT NULL,
    [CreatedBy]                  NVARCHAR (200)   NOT NULL,
    [ModifiedUtcDate]            DATETIME2 (7)    NOT NULL,
    [ModifiedBy]                 NVARCHAR (200)   NOT NULL,
    [IsDeleted]                  BIT              CONSTRAINT [DF_ReservationRequestOption_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_ReservationRequestOption] PRIMARY KEY CLUSTERED ([ReservationRequestOptionId] ASC)
);


GO

      CREATE TRIGGER [trgReservationRequestOptionUpdate] ON ReservationRequestOption
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM ReservationRequestOption a
        INNER JOIN inserted b
          ON a.ReservationRequestOptionId = b.ReservationRequestOptionId