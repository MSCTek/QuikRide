CREATE TABLE [dbo].[BarcodeType] (
    [BarcodeTypeId]   INT            NOT NULL,
    [Code]            VARCHAR (50)   NOT NULL,
    [DataVersion]     INT            CONSTRAINT [DF_BarcodeType_DataVersion] DEFAULT ((1)) NOT NULL,
    [CreatedUtcDate]  DATETIME2 (7)  CONSTRAINT [DF_BarcodeType_CreatedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [CreatedBy]       NVARCHAR (200) NOT NULL,
    [ModifiedUtcDate] DATETIME2 (7)  CONSTRAINT [DF_BarcodeType_ModifiedUtcDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedBy]      NVARCHAR (200) NOT NULL,
    [IsDeleted]       BIT            CONSTRAINT [DF_BarcodeType_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_BarcodeType] PRIMARY KEY CLUSTERED ([BarcodeTypeId] ASC)
);


GO





      CREATE TRIGGER [dbo].[trg_BarcodeType_Update] ON [dbo].[BarcodeType]
      FOR UPDATE
      AS 

      SET NOCOUNT ON

      UPDATE a SET 
        a.DataVersion = b.DataVersion + 1
      FROM BarcodeType a
        INNER JOIN inserted b
          ON a.BarcodeTypeId = b.BarcodeTypeId