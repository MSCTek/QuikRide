// <auto-generated> - Template:DTO, Version:1.1, Id:58fa7ee2-89f7-41e6-85ed-8d4482653990
namespace CGH.QuikRide.DTO.QR
{
	public partial class HolidayTranslation
	{
		public HolidayTranslation()
		{
			InitializePartial();
		}

		public int HolidayTranslationId { get; set; } // Primary key
		public int HolidayId { get; set; }
		public int LanguageTypeId { get; set; }
		public string Value { get; set; }
		public int DisplayPriority { get; set; }
		public int DataVersion { get; set; }
		public System.DateTime CreatedUtcDate { get; set; }
		public string CreatedBy { get; set; }
		public System.DateTime ModifiedUtcDate { get; set; }
		public string ModifiedBy { get; set; }
		public bool IsDeleted { get; set; }
		// public virtual Holiday Holiday { get; set; }  -- Excluded navigation property per configuration.
		public virtual LanguageType LanguageType { get; set; } 


		partial void InitializePartial();

	}
}
