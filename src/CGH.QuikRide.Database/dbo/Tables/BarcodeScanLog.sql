CREATE TABLE [dbo].[BarcodeScanLog] (
    [BarcodeScanLogId]             UNIQUEIDENTIFIER NOT NULL,
    [BarcodeId]                    UNIQUEIDENTIFIER NOT NULL,
    [UserId]                       INT              NOT NULL,
    [DeviceOperatingSystem]        VARCHAR (255)    NULL,
    [DeviceOperatingSystemVersion] VARCHAR (255)    NULL,
    [Latitude]                     FLOAT (53)       NULL,
    [Longitude]                    FLOAT (53)       NULL,
    [DataJson]                     NVARCHAR (4000)  NULL,
    [DataVersion]                  INT              CONSTRAINT [DF_BarcodeScanLog_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]               DATETIME2 (7)    CONSTRAINT [DF_BarcodeScanLog_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]                    NVARCHAR (200)   NOT NULL,
    [ModifiedUtcDate]              DATETIME2 (7)    CONSTRAINT [DF_BarcodeScanLog_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]                   NVARCHAR (200)   NOT NULL,
    [IsDeleted]                    BIT              CONSTRAINT [DF_BarcodeScanLog_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_BarcodeScanLog] PRIMARY KEY CLUSTERED ([BarcodeScanLogId] ASC),
    CONSTRAINT [FK_BarcodeScanLog_Barcode] FOREIGN KEY ([BarcodeId]) REFERENCES [dbo].[Barcode] ([BarcodeId])
);


GO
CREATE NONCLUSTERED INDEX [IX_BarcodeScanLog_UserId]
    ON [dbo].[BarcodeScanLog]([UserId] ASC);


GO





      CREATE TRIGGER [dbo].[trg_BarcodeScanLog_Update] ON [dbo].[BarcodeScanLog]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM BarcodeScanLog a
        INNER JOIN inserted b
          ON a.BarcodeScanLogId = b.BarcodeScanLogId