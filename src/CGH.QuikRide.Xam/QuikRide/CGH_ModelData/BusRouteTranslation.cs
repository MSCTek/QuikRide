// <auto-generated> - Template:SqliteModelData, Version:1.1, Id:c5caad15-b3be-4443-87d8-7cabde59f7b0
using SQLite;

namespace CGH.QuikRide.Xam.ModelData.QR
{
	[Table("BusRouteTranslation")]
	public partial class BusRouteTranslation
	{
		public int BusRouteId { get; set; }

		[PrimaryKey]
		public int BusRouteTranslationId { get; set; }

		public string CreatedBy { get; set; }
		public System.DateTime CreatedUtcDate { get; set; }
		public int DataVersion { get; set; }
		public string Description { get; set; }
		public int DisplayPriority { get; set; }
		public bool IsDeleted { get; set; }
		public int LanguageTypeId { get; set; }
		public string ModifiedBy { get; set; }
		public System.DateTime ModifiedUtcDate { get; set; }
		public string Value { get; set; }
	}
}
