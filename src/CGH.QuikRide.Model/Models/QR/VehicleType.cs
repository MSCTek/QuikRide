// <auto-generated> - Template:ModelsBackedByDto, Version:1.1, Id:f1539c0d-024f-4b1f-b346-132cdd9dd31f
using CodeGenHero.Logging;
using CodeGenHero.DataService;
using System;
using System.Collections.Generic;
using System.Linq;
using CGH.QuikRide.API.Client.Interface;
using CGH.QuikRide.Model.QR.Interface;
using xDTO = CGH.QuikRide.DTO.QR;

namespace CGH.QuikRide.Model.QR
{

	public class LoadRequestVehicleType : EventArgs
	{
		public LoadRequestVehicleType(string propertyNameRequestingLoad)
		{
			PropertyNameRequestingLoad = propertyNameRequestingLoad;
		}

		public string PropertyNameRequestingLoad { get; set; }
	}


	public partial class VehicleType : BaseModel<IWebApiDataServiceQR>, IVehicleType
	{
		public event EventHandler<LoadRequestVehicleType> OnLazyLoadRequest = delegate { }; // Empty delegate. Thus we are sure that value is always != null because no one outside of the class can change it.
		private xDTO.VehicleType _dto = null;

		public VehicleType(ILoggingService log, IDataService<IWebApiDataServiceQR> dataService) : base(log, dataService)
		{
			_dto = new xDTO.VehicleType();
			OnLazyLoadRequest += HandleLazyLoadRequest;
		}

		public VehicleType(ILoggingService log, IDataService<IWebApiDataServiceQR> dataService, xDTO.VehicleType dto) : this(log, dataService)
		{
			_dto = dto;
		}


		public virtual int? Capacity { get { return _dto.Capacity; } }
		public virtual string Code { get { return _dto.Code; } }
		public virtual string CreatedBy { get { return _dto.CreatedBy; } }
		public virtual System.DateTime CreatedUtcDate { get { return _dto.CreatedUtcDate; } }
		public virtual int DataVersion { get { return _dto.DataVersion; } }
		public virtual string Description { get { return _dto.Description; } }
		public virtual int DisplayPriority { get { return _dto.DisplayPriority; } }
		public virtual string DisplayText { get { return _dto.DisplayText; } }
		public virtual double? FrontOverhangInFeet { get { return _dto.FrontOverhangInFeet; } }
		public virtual double? GroundClearanceInFeet { get { return _dto.GroundClearanceInFeet; } }
		public virtual double? HeightInFeet { get { return _dto.HeightInFeet; } }
		public virtual bool IsDeleted { get { return _dto.IsDeleted; } }
		public virtual double? LengthInFeetMax { get { return _dto.LengthInFeetMax; } }
		public virtual double? LengthInFeetMin { get { return _dto.LengthInFeetMin; } }
		public virtual double? LengthWithBumpers { get { return _dto.LengthWithBumpers; } }
		public virtual string ModifiedBy { get { return _dto.ModifiedBy; } }
		public virtual System.DateTime ModifiedUtcDate { get { return _dto.ModifiedUtcDate; } }
		public virtual double? RearOverhangInFeet { get { return _dto.RearOverhangInFeet; } }
		public virtual int VehicleTypeId { get { return _dto.VehicleTypeId; } }
		public virtual double? WheelbaseInFeet { get { return _dto.WheelbaseInFeet; } }
		public virtual double? WidthInFeet { get { return _dto.WidthInFeet; } }
		public virtual double? WidthWithMirrorsInFeet { get { return _dto.WidthWithMirrorsInFeet; } }

		private List<IVehicle> _vehicles = null; // Reverse Navigation
		private List<IVehicleTypeVehicleFeatureType> _vehicleTypeVehicleFeatureTypes = null; // Reverse Navigation


		public virtual List<IVehicle> Vehicles
		{
			get
			{
				if (_vehicles == null)
				{
					OnLazyLoadRequest(this, new LoadRequestVehicleType(nameof(Vehicles)));
				}

				return _vehicles;
			}
		}

		public virtual List<IVehicleTypeVehicleFeatureType> VehicleTypeVehicleFeatureTypes
		{
			get
			{
				if (_vehicleTypeVehicleFeatureTypes == null && _dto != null)
				{	// The core DTO object is loaded, but this property is not loaded.
					if (_dto.VehicleTypeVehicleFeatureTypes != null)
					{	// The core DTO object has data for this property, load it into the model.
						_vehicleTypeVehicleFeatureTypes = new List<IVehicleTypeVehicleFeatureType>();
						foreach (var dtoItem in _dto.VehicleTypeVehicleFeatureTypes)
						{
							_vehicleTypeVehicleFeatureTypes.Add(new VehicleTypeVehicleFeatureType(Log, DataService, dtoItem));
						}
					}
					else
					{	// Trigger the load data request - The core DTO object is loaded and does not have data for this property.
						OnLazyLoadRequest(this, new LoadRequestVehicleType(nameof(VehicleTypeVehicleFeatureTypes)));
					}
				}

				return _vehicleTypeVehicleFeatureTypes;
			}
		}



	}
}
