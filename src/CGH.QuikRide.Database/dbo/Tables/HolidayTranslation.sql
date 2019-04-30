CREATE TABLE [dbo].[HolidayTranslation] (
    [HolidayTranslationId] INT             IDENTITY (1, 1) NOT NULL,
    [HolidayId]            INT             NOT NULL,
    [LanguageTypeId]       INT             NOT NULL,
    [Value]                NVARCHAR (4000) NOT NULL,
    [DisplayPriority]      INT             CONSTRAINT [DF_HolidayTranslation_DisplayPriority] DEFAULT ((100)) NOT NULL,
    [DataVersion]          INT             CONSTRAINT [DF_HolidayTranslation_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]       DATETIME2 (7)   CONSTRAINT [DF_HolidayTranslation_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]            NVARCHAR (200)  NOT NULL,
    [ModifiedUtcDate]      DATETIME2 (7)   CONSTRAINT [DF_HolidayTranslation_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]           NVARCHAR (200)  NOT NULL,
    [IsDeleted]            BIT             CONSTRAINT [DF_HolidayTranslation_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_HolidayTranslation] PRIMARY KEY NONCLUSTERED ([HolidayTranslationId] ASC),
    CONSTRAINT [FK_HolidayTranslation_Holiday] FOREIGN KEY ([HolidayId]) REFERENCES [dbo].[Holiday] ([HolidayId]) ON DELETE CASCADE,
    CONSTRAINT [FK_HolidayTranslation_LanguageType] FOREIGN KEY ([LanguageTypeId]) REFERENCES [dbo].[LanguageType] ([LanguageTypeId]),
    CONSTRAINT [AK_HolidayTranslation] UNIQUE CLUSTERED ([HolidayId] ASC, [LanguageTypeId] ASC)
);


GO





      CREATE TRIGGER [dbo].[trg_HolidayTranslation_Update] ON [dbo].[HolidayTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM HolidayTranslation a
        INNER JOIN inserted b
          ON a.HolidayTranslationId = b.HolidayTranslationId