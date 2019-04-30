CREATE TABLE [dbo].[ReservationRequestStatusTypeTranslation] (
    [ReservationRequestStatusTypeTranslationId] INT             IDENTITY (1, 1) NOT NULL,
    [ReservationRequestStatusTypeId]            INT             NOT NULL,
    [LanguageTypeId]                            INT             NOT NULL,
    [Value]                                     NVARCHAR (4000) NOT NULL,
    [DisplayPriority]                           INT             CONSTRAINT [DF_ReservationRequestStatusTypeTranslation_DisplayPriority] DEFAULT ((100)) NOT NULL,
    [DataVersion]                               INT             CONSTRAINT [DF_ReservationRequestStatusTypeTranslation_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]                            DATETIME2 (7)   CONSTRAINT [DF_ReservationRequestStatusTypeTranslation_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]                                 NVARCHAR (200)  NOT NULL,
    [ModifiedUtcDate]                           DATETIME2 (7)   CONSTRAINT [DF_ReservationRequestStatusTypeTranslation_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]                                NVARCHAR (200)  NOT NULL,
    [IsDeleted]                                 BIT             CONSTRAINT [DF_ReservationRequestStatusTypeTranslation_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_ReservationRequestStatusTypeTranslation] PRIMARY KEY NONCLUSTERED ([ReservationRequestStatusTypeTranslationId] ASC),
    CONSTRAINT [FK_ReservationRequestStatusTypeTranslation_LanguageType] FOREIGN KEY ([LanguageTypeId]) REFERENCES [dbo].[LanguageType] ([LanguageTypeId]),
    CONSTRAINT [FK_ReservationRequestStatusTypeTranslation_ReservationRequestStatusType] FOREIGN KEY ([ReservationRequestStatusTypeId]) REFERENCES [dbo].[ReservationRequestStatusType] ([ReservationRequestStatusTypeId]) ON DELETE CASCADE,
    CONSTRAINT [AK_ReservationRequestStatusTypeTranslation] UNIQUE CLUSTERED ([ReservationRequestStatusTypeId] ASC, [LanguageTypeId] ASC)
);


GO





      CREATE TRIGGER [dbo].[trg_ReservationRequestStatusTypeTranslation_Update] ON [dbo].[ReservationRequestStatusTypeTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM ReservationRequestStatusTypeTranslation a
        INNER JOIN inserted b
          ON a.ReservationRequestStatusTypeTranslationId = b.ReservationRequestStatusTypeTranslationId