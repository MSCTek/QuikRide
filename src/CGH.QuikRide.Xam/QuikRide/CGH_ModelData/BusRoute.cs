// <auto-generated> - Template:SqliteModelData, Version:1.1, Id:c5caad15-b3be-4443-87d8-7cabde59f7b0
using SQLite;

namespace CGH.QuikRide.Xam.ModelData.QR
{
	[Table("BusRoute")]
	public partial class BusRoute
	{

		[PrimaryKey]
		public int BusRouteId { get; set; }

		public int BusRouteNumber { get; set; }
		public string CreatedBy { get; set; }
		public System.DateTime CreatedUtcDate { get; set; }
		public int DataVersion { get; set; }
		public System.DateTime? InServiceSince { get; set; }
		public bool IsDeleted { get; set; }
		public string ModifiedBy { get; set; }
		public System.DateTime ModifiedUtcDate { get; set; }
	}
}