CREATE TABLE [dbo].[ReservationRequest] (
    [ReservationRequestId]                       UNIQUEIDENTIFIER NOT NULL,
    [UserId]                                     INT              NOT NULL,
    [PickupLocationId]                           UNIQUEIDENTIFIER NOT NULL,
    [DestinationLocationId]                      UNIQUEIDENTIFIER NOT NULL,
    [ReservationRequestStatusTypeId]             INT              NOT NULL,
    [ReservationRequestCancellationReasonTypeId] INT              NULL,
    [RequestedPickupStart]                       DATETIME2 (7)    NULL,
    [RequestedPickupEnd]                         DATETIME2 (7)    NULL,
    [RequestedArrivalStart]                      DATETIME2 (7)    NULL,
    [RequestedArrivalEnd]                        DATETIME2 (7)    NULL,
    [NumberOfAdults]                             INT              NOT NULL,
    [NumberOfChildren]                           INT              NOT NULL,
    [NumberOfBabies]                             INT              NOT NULL,
    [NumberOfWheelchairs]                        INT              CONSTRAINT [DF_ReservationRequest_NumberOfWheelchairs] DEFAULT ((0)) NULL,
    [NumberOfBikes]                              INT              CONSTRAINT [DF_ReservationRequest_NumberOfBikes] DEFAULT ((0)) NULL,
    [PersonalCareAttendantIncluded]              BIT              CONSTRAINT [DF_ReservationRequest_PersonalCareAttendantIncluded] DEFAULT ((0)) NOT NULL,
    [PassengerRequiresAssistance]                BIT              CONSTRAINT [DF_ReservationRequest_PassengerRequiresAssistance] DEFAULT ((0)) NOT NULL,
    [ReservationId]                              UNIQUEIDENTIFIER NULL,
    [ReplacesReservationId]                      UNIQUEIDENTIFIER NULL,
    [DataVersion]                                INT              CONSTRAINT [DF_ReservationRequest_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]                             DATETIME2 (7)    CONSTRAINT [DF_ReservationRequest_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]                                  NVARCHAR (200)   NOT NULL,
    [ModifiedUtcDate]                            DATETIME2 (7)    CONSTRAINT [DF_ReservationRequest_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]                                 NVARCHAR (200)   NOT NULL,
    [IsDeleted]                                  BIT              CONSTRAINT [DF_ReservationRequest_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_ReservationRequest] PRIMARY KEY CLUSTERED ([ReservationRequestId] ASC),
    CONSTRAINT [FK_ReservationRequest_DestinationLocation] FOREIGN KEY ([DestinationLocationId]) REFERENCES [dbo].[Location] ([LocationId]),
    CONSTRAINT [FK_ReservationRequest_PickupLocation] FOREIGN KEY ([PickupLocationId]) REFERENCES [dbo].[Location] ([LocationId]),
    CONSTRAINT [FK_ReservationRequest_Reservation] FOREIGN KEY ([ReplacesReservationId]) REFERENCES [dbo].[Reservation] ([ReservationId]),
    CONSTRAINT [FK_ReservationRequest_ReservationRequestCancellationReasonType] FOREIGN KEY ([ReservationRequestCancellationReasonTypeId]) REFERENCES [dbo].[ReservationRequestCancellationReasonType] ([ReservationRequestCancellationReasonTypeId]),
    CONSTRAINT [FK_ReservationRequest_ReservationRequestStatusType] FOREIGN KEY ([ReservationRequestStatusTypeId]) REFERENCES [dbo].[ReservationRequestStatusType] ([ReservationRequestStatusTypeId]),
    CONSTRAINT [FK_ReservationRequest_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserId])
);


GO

      CREATE TRIGGER [trgReservationRequestUpdate] ON ReservationRequest
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM ReservationRequest a
        INNER JOIN inserted b
          ON a.ReservationRequestId = b.ReservationRequestId