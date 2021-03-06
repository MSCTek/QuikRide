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

	public class LoadRequestVehicleStatusType : EventArgs
	{
		public LoadRequestVehicleStatusType(string propertyNameRequestingLoad)
		{
			PropertyNameRequestingLoad = propertyNameRequestingLoad;
		}

		public string PropertyNameRequestingLoad { get; set; }
	}


	public partial class VehicleStatusType : BaseModel<IWebApiDataServiceQR>, IVehicleStatusType
	{
		public event EventHandler<LoadRequestVehicleStatusType> OnLazyLoadRequest = delegate { }; // Empty delegate. Thus we are sure that value is always != null because no one outside of the class can change it.
		private xDTO.VehicleStatusType _dto = null;

		public VehicleStatusType(ILoggingService log, IDataService<IWebApiDataServiceQR> dataService) : base(log, dataService)
		{
			_dto = new xDTO.VehicleStatusType();
			OnLazyLoadRequest += HandleLazyLoadRequest;
		}

		public VehicleStatusType(ILoggingService log, IDataService<IWebApiDataServiceQR> dataService, xDTO.VehicleStatusType dto) : this(log, dataService)
		{
			_dto = dto;
		}


		public virtual string Code { get { return _dto.Code; } }
		public virtual string CreatedBy { get { return _dto.CreatedBy; } }
		public virtual System.DateTime CreatedUtcDate { get { return _dto.CreatedUtcDate; } }
		public virtual int DataVersion { get { return _dto.DataVersion; } }
		public virtual bool IsDeleted { get { return _dto.IsDeleted; } }
		public virtual string ModifiedBy { get { return _dto.ModifiedBy; } }
		public virtual System.DateTime ModifiedUtcDate { get { return _dto.ModifiedUtcDate; } }
		public virtual int VehicleStatusTypeId { get { return _dto.VehicleStatusTypeId; } }

		private List<IVehicle> _vehicles = null; // Reverse Navigation
		private List<IVehicleStatusTypeTranslation> _vehicleStatusTypeTranslations = null; // Reverse Navigation


		public virtual List<IVehicle> Vehicles
		{
			get
			{
				if (_vehicles == null)
				{
					OnLazyLoadRequest(this, new LoadRequestVehicleStatusType(nameof(Vehicles)));
				}

				return _vehicles;
			}
		}

		public virtual List<IVehicleStatusTypeTranslation> VehicleStatusTypeTranslations
		{
			get
			{
				if (_vehicleStatusTypeTranslations == null && _dto != null)
				{	// The core DTO object is loaded, but this property is not loaded.
					if (_dto.VehicleStatusTypeTranslations != null)
					{	// The core DTO object has data for this property, load it into the model.
						_vehicleStatusTypeTranslations = new List<IVehicleStatusTypeTranslation>();
						foreach (var dtoItem in _dto.VehicleStatusTypeTranslations)
						{
							_vehicleStatusTypeTranslations.Add(new VehicleStatusTypeTranslation(Log, DataService, dtoItem));
						}
					}
					else
					{	// Trigger the load data request - The core DTO object is loaded and does not have data for this property.
						OnLazyLoadRequest(this, new LoadRequestVehicleStatusType(nameof(VehicleStatusTypeTranslations)));
					}
				}

				return _vehicleStatusTypeTranslations;
			}
		}



	}
}
