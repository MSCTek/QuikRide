CREATE TABLE [dbo].[ReservationRequestCancellationReasonTypeTranslation] (
    [ReservationRequestCancellationReasonTypeTranslationId] INT             IDENTITY (1, 1) NOT NULL,
    [ReservationRequestCancellationReasonTypeId]            INT             NOT NULL,
    [LanguageTypeId]                                        INT             NOT NULL,
    [Value]                                                 NVARCHAR (4000) NOT NULL,
    [DisplayPriority]                                       INT             CONSTRAINT [DF_ReservationRequestCancellationReasonTypeTranslation_DisplayPriority] DEFAULT ((100)) NOT NULL,
    [DataVersion]                                           INT             CONSTRAINT [DF_ReservationRequestCancellationReasonTypeTranslation_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]                                        DATETIME2 (7)   CONSTRAINT [DF_ReservationRequestCancellationReasonTypeTranslation_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]                                             NVARCHAR (200)  NOT NULL,
    [ModifiedUtcDate]                                       DATETIME2 (7)   CONSTRAINT [DF_ReservationRequestCancellationReasonTypeTranslation_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]                                            NVARCHAR (200)  NOT NULL,
    [IsDeleted]                                             BIT             CONSTRAINT [DF_ReservationRequestCancellationReasonTypeTranslation_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_ReservationRequestCancellationReasonTypeTranslation] PRIMARY KEY NONCLUSTERED ([ReservationRequestCancellationReasonTypeTranslationId] ASC),
    CONSTRAINT [FK_ReservationRequestCancellationReasonTypeTranslation_LanguageType] FOREIGN KEY ([LanguageTypeId]) REFERENCES [dbo].[LanguageType] ([LanguageTypeId]),
    CONSTRAINT [FK_ReservationRequestCancellationReasonTypeTranslation_ReservationRequestCancellationReasonType] FOREIGN KEY ([ReservationRequestCancellationReasonTypeId]) REFERENCES [dbo].[ReservationRequestCancellationReasonType] ([ReservationRequestCancellationReasonTypeId]) ON DELETE CASCADE,
    CONSTRAINT [AK_ReservationRequestCancellationReasonTypeTranslation] UNIQUE CLUSTERED ([ReservationRequestCancellationReasonTypeId] ASC, [LanguageTypeId] ASC)
);


GO





      CREATE TRIGGER [dbo].[trg_ReservationRequestCancellationReasonTypeTranslation_Update] ON [dbo].[ReservationRequestCancellationReasonTypeTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM ReservationRequestCancellationReasonTypeTranslation a
        INNER JOIN inserted b
          ON a.ReservationRequestCancellationReasonTypeTranslationId = b.ReservationRequestCancellationReasonTypeTranslationId