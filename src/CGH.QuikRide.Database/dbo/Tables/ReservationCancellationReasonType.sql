CREATE TABLE [dbo].[ReservationCancellationReasonType] (
    [ReservationCancellationReasonTypeId] INT             NOT NULL,
    [LanguageTypeId]                      INT             NOT NULL,
    [Code]                                VARCHAR (50)    NOT NULL,
    [DisplayText]                         NVARCHAR (128)  NOT NULL,
    [DisplayPriority]                     INT             CONSTRAINT [DF_ReservationCancellationReasonType_DisplayPriority] DEFAULT ((100)) NOT NULL,
    [Description]                         NVARCHAR (1024) NULL,
    [DataVersion]                         INT             CONSTRAINT [DF_ReservationCancellationReasonType_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]                      DATETIME2 (7)   CONSTRAINT [DF_ReservationCancellationReasonType_CreatedUTCDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]                           NVARCHAR (200)  NOT NULL,
    [ModifiedUtcDate]                     DATETIME2 (7)   CONSTRAINT [DF_ReservationCancellationReasonType_ModifiedUTCDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]                          NVARCHAR (200)  NOT NULL,
    [IsDeleted]                           BIT             CONSTRAINT [DF_ReservationCancellationReasonType_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_ReservationCancellationReasonType] PRIMARY KEY CLUSTERED ([ReservationCancellationReasonTypeId] ASC),
    CONSTRAINT [FK_ReservationCancellationReasonType_LanguageType] FOREIGN KEY ([LanguageTypeId]) REFERENCES [dbo].[LanguageType] ([LanguageTypeId]),
    CONSTRAINT [UC_ReservationCancellationReasonType_LanguageTypeId_Code] UNIQUE NONCLUSTERED ([LanguageTypeId] ASC, [Code] ASC)
);


GO

      CREATE TRIGGER [trgReservationCancellationReasonTypeUpdate] ON ReservationCancellationReasonType
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM ReservationCancellationReasonType a
        INNER JOIN inserted b
          ON a.ReservationCancellationReasonTypeId = b.ReservationCancellationReasonTypeId