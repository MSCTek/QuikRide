CREATE TABLE [dbo].[BusRouteTranslation] (
    [BusRouteTranslationId] INT             IDENTITY (1, 1) NOT NULL,
    [BusRouteId]            INT             NOT NULL,
    [LanguageTypeId]        INT             NOT NULL,
    [Value]                 NVARCHAR (4000) NOT NULL,
    [DisplayPriority]       INT             CONSTRAINT [DF_BusRouteTranslation_DisplayPriority] DEFAULT ((100)) NOT NULL,
    [Description]           NVARCHAR (1024) NULL,
    [DataVersion]           INT             CONSTRAINT [DF_BusRouteTranslation_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]        DATETIME2 (7)   CONSTRAINT [DF_BusRouteTranslation_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]             NVARCHAR (200)  NOT NULL,
    [ModifiedUtcDate]       DATETIME2 (7)   CONSTRAINT [DF_BusRouteTranslation_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]            NVARCHAR (200)  NOT NULL,
    [IsDeleted]             BIT             CONSTRAINT [DF_BusRouteTranslation_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_BusRouteTranslation] PRIMARY KEY NONCLUSTERED ([BusRouteTranslationId] ASC),
    CONSTRAINT [FK_BusRouteTranslation_BusRoute] FOREIGN KEY ([BusRouteId]) REFERENCES [dbo].[BusRoute] ([BusRouteId]) ON DELETE CASCADE,
    CONSTRAINT [FK_BusRouteTranslation_LanguageType] FOREIGN KEY ([LanguageTypeId]) REFERENCES [dbo].[LanguageType] ([LanguageTypeId]),
    CONSTRAINT [AK_BusRouteTranslation] UNIQUE CLUSTERED ([BusRouteId] ASC, [LanguageTypeId] ASC)
);


GO





      CREATE TRIGGER [dbo].[trg_BusRouteTranslation_Update] ON [dbo].[BusRouteTranslation]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM BusRouteTranslation a
        INNER JOIN inserted b
          ON a.BusRouteTranslationId = b.BusRouteTranslationId