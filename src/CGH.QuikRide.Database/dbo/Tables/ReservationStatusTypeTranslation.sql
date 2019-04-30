CREATE TABLE [dbo].[ReservationStatusTypeTranslation] (
    [ReservationStatusTypeTranslationId] INT             IDENTITY (1, 1) NOT NULL,
    [ReservationStatusTypeId]            INT             NOT NULL,
    [LanguageTypeId]                     INT             NOT NULL,
    [Value]                              NVARCHAR (4000) NOT NULL,
    [DisplayPriority]                    INT             CONSTRAINT [DF_ReservationStatusTypeTranslation_DisplayPriority] DEFAULT ((100)) NOT NULL,
    [DataVersion]                        INT             CONSTRAINT [DF_ReservationStatusTypeTranslation_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]                     DATETIME2 (7)   CONSTRAINT [DF_ReservationStatusTypeTranslation_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]                          NVARCHAR (200)  NOT NULL,
    [ModifiedUtcDate]                    DATETIME2 (7)   CONSTRAINT [DF_ReservationStatusTypeTranslation_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]                         NVARCHAR (200)  NOT NULL,
    [IsDeleted]                          BIT             CONSTRAINT [DF_ReservationStatusTypeTranslation_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_ReservationStatusTypeTranslation] PRIMARY KEY NONCLUSTERED ([ReservationStatusTypeTranslationId] ASC),
    CONSTRAINT [FK_ReservationStatusTypeTranslation_LanguageType] FOREIGN KEY ([LanguageTypeId]) REFERENCES [dbo].[LanguageType] ([LanguageTypeId]),
    CONSTRAINT [FK_ReservationStatusTypeTranslation_ReservationStatusType] FOREIGN KEY ([ReservationStatusTypeId]) REFERENCES [dbo].[ReservationStatusType] ([ReservationStatusTypeId]) ON DELETE CASCADE,
    CONSTRAINT [AK_ReservationStatusTypeTranslation] UNIQUE CLUSTERED ([ReservationStatusTypeId] ASC, [LanguageTypeId] ASC)
);


GO





      CREATE TRIGGER [dbo].[trg_ReservationStatusTypeTranslation_Update] ON [dbo].[ReservationStatusTypeTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM ReservationStatusTypeTranslation a
        INNER JOIN inserted b
          ON a.ReservationStatusTypeTranslationId = b.ReservationStatusTypeTranslationId