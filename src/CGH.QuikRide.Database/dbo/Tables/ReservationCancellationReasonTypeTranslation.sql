CREATE TABLE [dbo].[ReservationCancellationReasonTypeTranslation] (
    [ReservationCancellationReasonTypeTranslationId] INT             IDENTITY (1, 1) NOT NULL,
    [ReservationCancellationReasonTypeId]            INT             NOT NULL,
    [LanguageTypeId]                                 INT             NOT NULL,
    [Value]                                          NVARCHAR (4000) NOT NULL,
    [DisplayPriority]                                INT             CONSTRAINT [DF_ReservationCancellationReasonTypeTranslation_DisplayPriority] DEFAULT ((100)) NOT NULL,
    [DataVersion]                                    INT             CONSTRAINT [DF_ReservationCancellationReasonTypeTranslation_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]                                 DATETIME2 (7)   CONSTRAINT [DF_ReservationCancellationReasonTypeTranslation_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]                                      NVARCHAR (200)  NOT NULL,
    [ModifiedUtcDate]                                DATETIME2 (7)   CONSTRAINT [DF_ReservationCancellationReasonTypeTranslation_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]                                     NVARCHAR (200)  NOT NULL,
    [IsDeleted]                                      BIT             CONSTRAINT [DF_ReservationCancellationReasonTypeTranslation_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_ReservationCancellationReasonTypeTranslation] PRIMARY KEY NONCLUSTERED ([ReservationCancellationReasonTypeTranslationId] ASC),
    CONSTRAINT [FK_ReservationCancellationReasonTypeTranslation_LanguageType] FOREIGN KEY ([LanguageTypeId]) REFERENCES [dbo].[LanguageType] ([LanguageTypeId]),
    CONSTRAINT [FK_ReservationCancellationReasonTypeTranslation_ReservationCancellationReasonType] FOREIGN KEY ([ReservationCancellationReasonTypeId]) REFERENCES [dbo].[ReservationCancellationReasonType] ([ReservationCancellationReasonTypeId]) ON DELETE CASCADE,
    CONSTRAINT [AK_ReservationCancellationReasonTypeTranslation] UNIQUE CLUSTERED ([ReservationCancellationReasonTypeId] ASC, [LanguageTypeId] ASC)
);


GO





      CREATE TRIGGER [dbo].[trg_ReservationCancellationReasonTypeTranslation_Update] ON [dbo].[ReservationCancellationReasonTypeTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM ReservationCancellationReasonTypeTranslation a
        INNER JOIN inserted b
          ON a.ReservationCancellationReasonTypeTranslationId = b.ReservationCancellationReasonTypeTranslationId