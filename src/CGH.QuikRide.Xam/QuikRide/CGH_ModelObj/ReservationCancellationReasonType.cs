// <auto-generated> - Template:MvvmLightModelObject, Version:1.1, Id:c644a31c-7ebc-4383-bc7f-0ea7c5bf6ed4
using GalaSoft.MvvmLight;

namespace CGH.QuikRide.Xam.ModelObj.QR
{
	public partial class ReservationCancellationReasonType : ObservableObject
	{
		public ReservationCancellationReasonType()
		{
			Reservations = new System.Collections.Generic.List<Reservation>(); // Reverse Navigation
			ReservationCancellationReasonTypeTranslations = new System.Collections.Generic.List<ReservationCancellationReasonTypeTranslation>(); // Reverse Navigation

			InitializePartial();
		}

		private string _code;
		private string _createdBy;
		private System.DateTime _createdUtcDate;
		private int _dataVersion;
		private bool _isDeleted;
		private string _modifiedBy;
		private System.DateTime _modifiedUtcDate;
		private int _reservationCancellationReasonTypeId;


		public string Code
		{
			get { return _code; }
			set
			{
				Set<string>(() => Code, ref _code, value);
				RunCustomLogicSetCode(value);
			}
		}

		public string CreatedBy
		{
			get { return _createdBy; }
			set
			{
				Set<string>(() => CreatedBy, ref _createdBy, value);
				RunCustomLogicSetCreatedBy(value);
			}
		}

		public System.DateTime CreatedUtcDate
		{
			get { return _createdUtcDate; }
			set
			{
				Set<System.DateTime>(() => CreatedUtcDate, ref _createdUtcDate, value);
				RunCustomLogicSetCreatedUtcDate(value);
			}
		}

		public int DataVersion
		{
			get { return _dataVersion; }
			set
			{
				Set<int>(() => DataVersion, ref _dataVersion, value);
				RunCustomLogicSetDataVersion(value);
			}
		}

		public bool IsDeleted
		{
			get { return _isDeleted; }
			set
			{
				Set<bool>(() => IsDeleted, ref _isDeleted, value);
				RunCustomLogicSetIsDeleted(value);
			}
		}

		public string ModifiedBy
		{
			get { return _modifiedBy; }
			set
			{
				Set<string>(() => ModifiedBy, ref _modifiedBy, value);
				RunCustomLogicSetModifiedBy(value);
			}
		}

		public System.DateTime ModifiedUtcDate
		{
			get { return _modifiedUtcDate; }
			set
			{
				Set<System.DateTime>(() => ModifiedUtcDate, ref _modifiedUtcDate, value);
				RunCustomLogicSetModifiedUtcDate(value);
			}
		}

		public int ReservationCancellationReasonTypeId
		{
			get { return _reservationCancellationReasonTypeId; }
			set
			{
				Set<int>(() => ReservationCancellationReasonTypeId, ref _reservationCancellationReasonTypeId, value);
				RunCustomLogicSetReservationCancellationReasonTypeId(value);
			}
		}

		public virtual System.Collections.Generic.IList<Reservation> Reservations { get; set; } // Many to many mapping
		public virtual System.Collections.Generic.IList<ReservationCancellationReasonTypeTranslation> ReservationCancellationReasonTypeTranslations { get; set; } // Many to many mapping


		partial void InitializePartial();

		#region RunCustomLogicSet

		partial void RunCustomLogicSetCode(string value);
		partial void RunCustomLogicSetCreatedBy(string value);
		partial void RunCustomLogicSetCreatedUtcDate(System.DateTime value);
		partial void RunCustomLogicSetDataVersion(int value);
		partial void RunCustomLogicSetIsDeleted(bool value);
		partial void RunCustomLogicSetModifiedBy(string value);
		partial void RunCustomLogicSetModifiedUtcDate(System.DateTime value);
		partial void RunCustomLogicSetReservationCancellationReasonTypeId(int value);

		#endregion RunCustomLogicSet

	}
}
