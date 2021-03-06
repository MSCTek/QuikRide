// <auto-generated> - Template:SqliteModelData, Version:1.1, Id:c5caad15-b3be-4443-87d8-7cabde59f7b0
using SQLite;

namespace CGH.QuikRide.Xam.ModelData.QR
{
	[Table("BarcodeScanLog")]
	public partial class BarcodeScanLog
	{
		public System.Guid BarcodeId { get; set; }

		[PrimaryKey]
		public System.Guid BarcodeScanLogId { get; set; }

		public string CreatedBy { get; set; }
		public System.DateTime CreatedUtcDate { get; set; }
		public string DataJson { get; set; }
		public int DataVersion { get; set; }
		public string DeviceOperatingSystem { get; set; }
		public string DeviceOperatingSystemVersion { get; set; }
		public bool IsDeleted { get; set; }
		public double? Latitude { get; set; }
		public double? Longitude { get; set; }
		public string ModifiedBy { get; set; }
		public System.DateTime ModifiedUtcDate { get; set; }
		public int UserId { get; set; }
	}
}
