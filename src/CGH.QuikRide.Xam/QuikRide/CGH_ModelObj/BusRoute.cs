// <auto-generated> - Template:MvvmLightModelObject, Version:1.1, Id:c644a31c-7ebc-4383-bc7f-0ea7c5bf6ed4
using GalaSoft.MvvmLight;

namespace CGH.QuikRide.Xam.ModelObj.QR
{
	public partial class BusRoute : ObservableObject
	{
		public BusRoute()
		{
			BusRouteStops = new System.Collections.Generic.List<BusRouteStop>(); // Reverse Navigation
			BusRouteTranslations = new System.Collections.Generic.List<BusRouteTranslation>(); // Reverse Navigation
			VehicleBusRoutes = new System.Collections.Generic.List<VehicleBusRoute>(); // Reverse Navigation

			InitializePartial();
		}

		private int _busRouteId;
		private int _busRouteNumber;
		private string _createdBy;
		private System.DateTime _createdUtcDate;
		private int _dataVersion;
		private System.DateTime? _inServiceSince;
		private bool _isDeleted;
		private string _modifiedBy;
		private System.DateTime _modifiedUtcDate;


		public int BusRouteId
		{
			get { return _busRouteId; }
			set
			{
				Set<int>(() => BusRouteId, ref _busRouteId, value);
				RunCustomLogicSetBusRouteId(value);
			}
		}

		public int BusRouteNumber
		{
			get { return _busRouteNumber; }
			set
			{
				Set<int>(() => BusRouteNumber, ref _busRouteNumber, value);
				RunCustomLogicSetBusRouteNumber(value);
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

		public System.DateTime? InServiceSince
		{
			get { return _inServiceSince; }
			set
			{
				Set<System.DateTime?>(() => InServiceSince, ref _inServiceSince, value);
				RunCustomLogicSetInServiceSince(value);
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

		public virtual System.Collections.Generic.IList<BusRouteStop> BusRouteStops { get; set; } // Many to many mapping
		public virtual System.Collections.Generic.IList<BusRouteTranslation> BusRouteTranslations { get; set; } // Many to many mapping
		public virtual System.Collections.Generic.IList<VehicleBusRoute> VehicleBusRoutes { get; set; } // Many to many mapping


		partial void InitializePartial();

		#region RunCustomLogicSet

		partial void RunCustomLogicSetBusRouteId(int value);
		partial void RunCustomLogicSetBusRouteNumber(int value);
		partial void RunCustomLogicSetCreatedBy(string value);
		partial void RunCustomLogicSetCreatedUtcDate(System.DateTime value);
		partial void RunCustomLogicSetDataVersion(int value);
		partial void RunCustomLogicSetInServiceSince(System.DateTime? value);
		partial void RunCustomLogicSetIsDeleted(bool value);
		partial void RunCustomLogicSetModifiedBy(string value);
		partial void RunCustomLogicSetModifiedUtcDate(System.DateTime value);

		#endregion RunCustomLogicSet

	}
}
