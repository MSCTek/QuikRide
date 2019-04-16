// <auto-generated> - Template:ModelsBackedByDtoInterface, Version:1.1, Id:4d03f2c7-de27-4aae-a267-cad747c9606a
using System;
using System.Collections.Generic;

namespace CGH.QuikRide.Model.QR.Interface
{
	public partial interface IUser
	{
		System.DateTime? BirthDate { get; }
		string CreatedBy { get; }
		System.DateTime CreatedUtcDate { get; }
		int DataVersion { get; }
		string Email { get; }
		string FirstName { get; }
		int GenderTypeId { get; }
		bool IsDeleted { get; }
		System.DateTime LastLogin { get; }
		string LastName { get; }
		string ModifiedBy { get; }
		System.DateTime ModifiedUtcDate { get; }
		string Password { get; }
		int PreferredLanguageId { get; }
		string Salt { get; }
		int UserId { get; }
		string UserName { get; }

		IGenderType GenderType { get; }
		ILanguageType LanguageType { get; }
		List<IDriver> Drivers { get; }
		List<IReservation> Reservations { get; }
		List<IReservationRequest> ReservationRequests { get; }
		List<IRide> Rides { get; }
		List<IUsersLocation> UsersLocations { get; }
		List<IUsersNotificationType> UsersNotificationTypes { get; }


	}
}
