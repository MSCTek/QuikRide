CREATE TABLE [dbo].[Reservation] (
    [ReservationId]                   UNIQUEIDENTIFIER NOT NULL,
    [UserId]                          INT              NOT NULL,
    [PickUpLocationId]                UNIQUEIDENTIFIER NOT NULL,
    [DestinationLocationId]           UNIQUEIDENTIFIER NOT NULL,
    [ReservationRequestOptionId]      INT              NOT NULL,
    [ReservationStatusTypeId]         INT              NOT NULL,
    [ReservationCancellationReasonId] INT              NULL,
    [NumberOfAdults]                  INT              NOT NULL,
    [NumberOfChildren]                INT              NOT NULL,
    [NumberOfBabies]                  INT              NOT NULL,
    [NumberOfWheelchairs]             INT              CONSTRAINT [DF_Reservation_NumberOfWheelchairs] DEFAULT ((0)) NOT NULL,
    [NumberOfBikes]                   INT              CONSTRAINT [DF_Reservation_NumberOfBikes] DEFAULT ((0)) NOT NULL,
    [PersonalCareAttendantIncluded]   BIT              CONSTRAINT [DF_Reservation_PersonalCareAttendantIncluded] DEFAULT ((0)) NOT NULL,
    [DataVersion]                     INT              CONSTRAINT [DF_Reservation_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]                  DATETIME2 (7)    CONSTRAINT [DF_Reservation_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]                       NVARCHAR (200)   NOT NULL,
    [ModifiedUtcDate]                 DATETIME2 (7)    CONSTRAINT [DF_Reservation_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]                      NVARCHAR (200)   NOT NULL,
    [IsDeleted]                       BIT              CONSTRAINT [DF_Reservation_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED ([ReservationId] ASC),
    CONSTRAINT [FK_Reservation_Location] FOREIGN KEY ([PickUpLocationId]) REFERENCES [dbo].[Location] ([LocationId]),
    CONSTRAINT [FK_Reservation_ReservationCancellationReasonType] FOREIGN KEY ([ReservationCancellationReasonId]) REFERENCES [dbo].[ReservationCancellationReasonType] ([ReservationCancellationReasonTypeId]),
    CONSTRAINT [FK_Reservation_ReservationRequestOption] FOREIGN KEY ([ReservationRequestOptionId]) REFERENCES [dbo].[ReservationRequestOption] ([ReservationRequestOptionId]),
    CONSTRAINT [FK_Reservation_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserId])
);


GO

      CREATE TRIGGER [trgReservationUpdate] ON Reservation
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Reservation a
        INNER JOIN inserted b
          ON a.ReservationId = b.ReservationId