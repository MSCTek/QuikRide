// <auto-generated> - Template:RepositoryInterfaceCrud, Version:1.1, Id:387dfdc5-b9f2-4ab4-accb-00a22cdd916c
using CodeGenHero.Repository;
using CGH.QuikRide.Repository.Entities.QR;
using System.Linq;

namespace CGH.QuikRide.Repository.Interface
{
	public interface IQRRepositoryCrud : 
		ICRUDOperation<Driver>,
		ICRUDOperation<Feedback>,
		ICRUDOperation<FeedbackType>,
		ICRUDOperation<GenderType>,
		ICRUDOperation<Holiday>,
		ICRUDOperation<LanguageType>,
		ICRUDOperation<Location>,
		ICRUDOperation<NotificationType>,
		ICRUDOperation<Reservation>,
		ICRUDOperation<ReservationCancellationReasonType>,
		ICRUDOperation<ReservationRequest>,
		ICRUDOperation<ReservationRequestCancellationReasonType>,
		ICRUDOperation<ReservationRequestOption>,
		ICRUDOperation<ReservationRequestStatusType>,
		ICRUDOperation<ReservationStatusType>,
		ICRUDOperation<Ride>,
		ICRUDOperation<RidePosition>,
		ICRUDOperation<RideServiceType>,
		ICRUDOperation<User>,
		ICRUDOperation<UsersLocation>,
		ICRUDOperation<UsersNotificationType>,
		ICRUDOperation<Vehicle>,
		ICRUDOperation<VehicleFeatureType>,
		ICRUDOperation<VehicleStatusType>,
		ICRUDOperation<VehicleType>,
		ICRUDOperation<VehicleTypeVehicleFeatureType>,
		ICRUDOperation<VehicleVehicleFeatureType>
	{

		#region GetQueryable

		IQueryable<Driver> GetQueryable_Driver();
		IQueryable<Feedback> GetQueryable_Feedback();
		IQueryable<FeedbackType> GetQueryable_FeedbackType();
		IQueryable<GenderType> GetQueryable_GenderType();
		IQueryable<Holiday> GetQueryable_Holiday();
		IQueryable<LanguageType> GetQueryable_LanguageType();
		IQueryable<Location> GetQueryable_Location();
		IQueryable<NotificationType> GetQueryable_NotificationType();
		IQueryable<Reservation> GetQueryable_Reservation();
		IQueryable<ReservationCancellationReasonType> GetQueryable_ReservationCancellationReasonType();
		IQueryable<ReservationRequest> GetQueryable_ReservationRequest();
		IQueryable<ReservationRequestCancellationReasonType> GetQueryable_ReservationRequestCancellationReasonType();
		IQueryable<ReservationRequestOption> GetQueryable_ReservationRequestOption();
		IQueryable<ReservationRequestStatusType> GetQueryable_ReservationRequestStatusType();
		IQueryable<ReservationStatusType> GetQueryable_ReservationStatusType();
		IQueryable<Ride> GetQueryable_Ride();
		IQueryable<RidePosition> GetQueryable_RidePosition();
		IQueryable<RideServiceType> GetQueryable_RideServiceType();
		IQueryable<User> GetQueryable_User();
		IQueryable<UsersLocation> GetQueryable_UsersLocation();
		IQueryable<UsersNotificationType> GetQueryable_UsersNotificationType();
		IQueryable<Vehicle> GetQueryable_Vehicle();
		IQueryable<VehicleFeatureType> GetQueryable_VehicleFeatureType();
		IQueryable<VehicleStatusType> GetQueryable_VehicleStatusType();
		IQueryable<VehicleType> GetQueryable_VehicleType();
		IQueryable<VehicleTypeVehicleFeatureType> GetQueryable_VehicleTypeVehicleFeatureType();
		IQueryable<VehicleVehicleFeatureType> GetQueryable_VehicleVehicleFeatureType();

		#endregion

	}
}