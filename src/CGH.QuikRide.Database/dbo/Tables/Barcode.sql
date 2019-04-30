CREATE TABLE [dbo].[Barcode] (
    [BarcodeId]       UNIQUEIDENTIFIER NOT NULL,
    [BarcodeTypeId]   INT              NOT NULL,
    [DataJson]        NVARCHAR (4000)  NOT NULL,
    [DataVersion]     INT              CONSTRAINT [DF_Barcode_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]  DATETIME2 (7)    CONSTRAINT [DF_Barcode_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]       NVARCHAR (200)   NOT NULL,
    [ModifiedUtcDate] DATETIME2 (7)    CONSTRAINT [DF_Barcode_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]      NVARCHAR (200)   NOT NULL,
    [IsDeleted]       BIT              CONSTRAINT [DF_Barcode_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Barcode] PRIMARY KEY CLUSTERED ([BarcodeId] ASC),
    CONSTRAINT [FK_Barcode_BarcodeType] FOREIGN KEY ([BarcodeTypeId]) REFERENCES [dbo].[BarcodeType] ([BarcodeTypeId])
);


GO





      CREATE TRIGGER [dbo].[trg_Barcode_Update] ON [dbo].[Barcode]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM Barcode a
        INNER JOIN inserted b
          ON a.BarcodeId = b.BarcodeId