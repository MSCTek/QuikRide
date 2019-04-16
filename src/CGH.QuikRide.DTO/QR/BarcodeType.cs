// <auto-generated> - Template:DTO, Version:1.1, Id:58fa7ee2-89f7-41e6-85ed-8d4482653990
namespace CGH.QuikRide.DTO.QR
{
	public partial class BarcodeType
	{
		public BarcodeType()
		{
			InitializePartial();
		}

		public int BarcodeTypeId { get; set; } // Primary key
		public string Code { get; set; }
		public int DataVersion { get; set; }
		public System.DateTime CreatedUtcDate { get; set; }
		public string CreatedBy { get; set; }
		public System.DateTime ModifiedUtcDate { get; set; }
		public string ModifiedBy { get; set; }
		public bool IsDeleted { get; set; }
		// public virtual System.Collections.Generic.ICollection<Barcode> Barcodes { get; set; } // Many to many mapping -- Excluded navigation property per configuration.
		public virtual System.Collections.Generic.ICollection<BarcodeTypeTranslation> BarcodeTypeTranslations { get; set; } // Many to many mapping


		partial void InitializePartial();

	}
}