// <auto-generated> - Template:ModelsBackedByDtoInterface, Version:1.1, Id:4d03f2c7-de27-4aae-a267-cad747c9606a
using System;
using System.Collections.Generic;

namespace CGH.QuikRide.Model.QR.Interface
{
	public partial interface ILanguageType
	{
		string Code { get; }
		string CreatedBy { get; }
		System.DateTime CreatedUtcDate { get; }
		int DataVersion { get; }
		int DisplayPriority { get; }
		string DisplayText { get; }
		bool IsDeleted { get; }
		int? LanguageCultureIdentifier { get; }
		int LanguageTypeId { get; }
		string ModifiedBy { get; }
		System.DateTime ModifiedUtcDate { get; }
		string NativeName { get; }
		string ThreeLetterIsoLanguageName { get; }
		string TwoLetterIsoLanguageName { get; }

		List<IBarcodeTypeTranslation> BarcodeTypeTranslations { get; }
		List<IBusRouteTranslation> BusRouteTranslations { get; }
		List<IFeedbackInitiatorTypeTranslation> FeedbackInitiatorTypeTranslations { get; }
		List<IFeedbackTypeTranslation> FeedbackTypeTranslations { get; }
		List<IGenderTypeTranslation> GenderTypeTranslations { get; }
		List<IHolidayTranslation> HolidayTranslations { get; }
		List<ILocationTypeTranslation> LocationTypeTranslations { get; }
		List<INotificationTypeTranslation> NotificationTypeTranslations { get; }
		List<IReservationCancellationReasonTypeTranslation> ReservationCancellationReasonTypeTranslations { get; }
		List<IReservationRequestCancellationReasonTypeTranslation> ReservationRequestCancellationReasonTypeTranslations { get; }
		List<IReservationRequestStatusTypeTranslation> ReservationRequestStatusTypeTranslations { get; }
		List<IReservationStatusTypeTranslation> ReservationStatusTypeTranslations { get; }
		List<IRideServiceTypeTranslation> RideServiceTypeTranslations { get; }
		List<IUser> Users { get; }
		List<IUserRewardAccountTransactionTypeTranslation> UserRewardAccountTransactionTypeTranslations { get; }
		List<IVehicleFeatureTypeTranslation> VehicleFeatureTypeTranslations { get; }
		List<IVehicleStatusTypeTranslation> VehicleStatusTypeTranslations { get; }


	}
}
