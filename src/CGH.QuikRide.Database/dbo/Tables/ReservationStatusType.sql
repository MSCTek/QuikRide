CREATE TABLE [dbo].[ReservationStatusType] (
    [ReservationStatusTypeId] INT             NOT NULL,
    [LanguageTypeId]          INT             NOT NULL,
    [Code]                    VARCHAR (50)    NOT NULL,
    [DisplayText]             NVARCHAR (128)  NOT NULL,
    [DisplayPriority]         INT             CONSTRAINT [DF_ReservationStatusType_DisplayPriority] DEFAULT ((100)) NOT NULL,
    [Description]             NVARCHAR (1024) NULL,
    [DataVersion]             INT             CONSTRAINT [DF_ReservationStatusType_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]          DATETIME2 (7)   CONSTRAINT [DF_ReservationStatusType_CreatedUTCDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]               NVARCHAR (200)  NOT NULL,
    [ModifiedUtcDate]         DATETIME2 (7)   CONSTRAINT [DF_ReservationStatusType_ModifiedUTCDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]              NVARCHAR (200)  NOT NULL,
    [IsDeleted]               BIT             CONSTRAINT [DF_ReservationStatusType_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_ReservationStatusType] PRIMARY KEY CLUSTERED ([ReservationStatusTypeId] ASC),
    CONSTRAINT [FK_ReservationStatusType_LanguageType] FOREIGN KEY ([LanguageTypeId]) REFERENCES [dbo].[LanguageType] ([LanguageTypeId]),
    CONSTRAINT [UC_ReservationStatusType_LanguageTypeId_Code] UNIQUE NONCLUSTERED ([LanguageTypeId] ASC, [Code] ASC)
);


GO

      CREATE TRIGGER [trgReservationStatusTypeUpdate] ON ReservationStatusType
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM ReservationStatusType a
        INNER JOIN inserted b
          ON a.ReservationStatusTypeId = b.ReservationStatusTypeId