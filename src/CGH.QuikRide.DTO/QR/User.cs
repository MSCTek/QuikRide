// <auto-generated> - Template:DTO, Version:1.1, Id:58fa7ee2-89f7-41e6-85ed-8d4482653990
namespace CGH.QuikRide.DTO.QR
{
	public partial class User
	{
		public User()
		{
			InitializePartial();
		}

		public int UserId { get; set; } // Primary key
		public string UserName { get; set; }
		public string Email { get; set; }
		public System.DateTime? BirthDate { get; set; }
		public string FirstName { get; set; }
		public string LastName { get; set; }
		public int GenderTypeId { get; set; }
		public string Password { get; set; }
		public string Salt { get; set; }
		public System.DateTime LastLogin { get; set; }
		public int DataVersion { get; set; }
		public System.DateTime CreatedUtcDate { get; set; }
		public string CreatedBy { get; set; }
		public System.DateTime ModifiedUtcDate { get; set; }
		public string ModifiedBy { get; set; }
		public bool IsDeleted { get; set; }
		public virtual System.Collections.Generic.ICollection<Driver> Drivers { get; set; } // Many to many mapping
		public virtual System.Collections.Generic.ICollection<Reservation> Reservations { get; set; } // Many to many mapping
		public virtual System.Collections.Generic.ICollection<ReservationRequest> ReservationRequests { get; set; } // Many to many mapping
		public virtual System.Collections.Generic.ICollection<Ride> Rides { get; set; } // Many to many mapping
		public virtual System.Collections.Generic.ICollection<UsersLocation> UsersLocations { get; set; } // Many to many mapping
		public virtual System.Collections.Generic.ICollection<UsersNotificationType> UsersNotificationTypes { get; set; } // Many to many mapping
		public virtual GenderType GenderType { get; set; } 


		partial void InitializePartial();

	}
}