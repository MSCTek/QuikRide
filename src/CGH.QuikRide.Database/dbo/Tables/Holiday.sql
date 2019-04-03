CREATE TABLE [dbo].[Holiday] (
    [HolidayId]       INT            IDENTITY (1, 1) NOT NULL,
    [Date]            DATE           NOT NULL,
    [LanguageTypeId]  INT            NOT NULL,
    [Code]            VARCHAR (50)   NOT NULL,
    [DisplayText]     NVARCHAR (128) NOT NULL,
    [DataVersion]     INT            CONSTRAINT [DF_Holiday_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]  DATETIME2 (7)  CONSTRAINT [DF_Holiday_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]       NVARCHAR (200) NOT NULL,
    [ModifiedUtcDate] DATETIME2 (7)  CONSTRAINT [DF_Holiday_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]      NVARCHAR (200) NOT NULL,
    [IsDeleted]       BIT            CONSTRAINT [DF_Holiday_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Holiday] PRIMARY KEY CLUSTERED ([HolidayId] ASC),
    CONSTRAINT [UC_Holiday_LanguageTypeId_Code] UNIQUE NONCLUSTERED ([LanguageTypeId] ASC, [Code] ASC)
);


GO

      CREATE TRIGGER [trgHolidayUpdate] ON Holiday
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Holiday a
        INNER JOIN inserted b
          ON a.HolidayId = b.HolidayId