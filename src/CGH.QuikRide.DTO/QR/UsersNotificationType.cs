// <auto-generated> - Template:DTO, Version:1.1, Id:58fa7ee2-89f7-41e6-85ed-8d4482653990
namespace CGH.QuikRide.DTO.QR
{
	public partial class UsersNotificationType
	{
		public UsersNotificationType()
		{
			InitializePartial();
		}

		public int UserId { get; set; } // Primary key
		public int NotificationTypeId { get; set; } // Primary key
		public int DataVersion { get; set; }
		public System.DateTime CreatedUtcDate { get; set; }
		public string CreatedBy { get; set; }
		public System.DateTime ModifiedUtcDate { get; set; }
		public string ModifiedBy { get; set; }
		public bool IsDeleted { get; set; }
		// public virtual NotificationType NotificationType { get; set; }  -- Excluded navigation property per configuration.
		// public virtual User User { get; set; }  -- Excluded navigation property per configuration.


		partial void InitializePartial();

	}
}
