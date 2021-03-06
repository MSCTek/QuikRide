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

	public class LoadRequestRidePosition : EventArgs
	{
		public LoadRequestRidePosition(string propertyNameRequestingLoad)
		{
			PropertyNameRequestingLoad = propertyNameRequestingLoad;
		}

		public string PropertyNameRequestingLoad { get; set; }
	}


	public partial class RidePosition : BaseModel<IWebApiDataServiceQR>, IRidePosition
	{
		public event EventHandler<LoadRequestRidePosition> OnLazyLoadRequest = delegate { }; // Empty delegate. Thus we are sure that value is always != null because no one outside of the class can change it.
		private xDTO.RidePosition _dto = null;

		public RidePosition(ILoggingService log, IDataService<IWebApiDataServiceQR> dataService) : base(log, dataService)
		{
			_dto = new xDTO.RidePosition();
			OnLazyLoadRequest += HandleLazyLoadRequest;
		}

		public RidePosition(ILoggingService log, IDataService<IWebApiDataServiceQR> dataService, xDTO.RidePosition dto) : this(log, dataService)
		{
			_dto = dto;
		}


		public virtual string CreatedBy { get { return _dto.CreatedBy; } }
		public virtual System.DateTime CreatedUtcDate { get { return _dto.CreatedUtcDate; } }
		public virtual int DataVersion { get { return _dto.DataVersion; } }
		public virtual bool IsDeleted { get { return _dto.IsDeleted; } }
		public virtual decimal Latitude { get { return _dto.Latitude; } }
		public virtual decimal Longitude { get { return _dto.Longitude; } }
		public virtual string ModifiedBy { get { return _dto.ModifiedBy; } }
		public virtual System.DateTime ModifiedUtcDate { get { return _dto.ModifiedUtcDate; } }
		public virtual System.Guid RideId { get { return _dto.RideId; } }
		public virtual System.Guid RidePositionId { get { return _dto.RidePositionId; } }
		public virtual System.DateTime Ts { get { return _dto.Ts; } }

		private IRide _ride = null; // Foreign Key


		public virtual IRide Ride
		{
			get
			{
				if (_ride == null)
				{
					OnLazyLoadRequest(this, new LoadRequestRidePosition(nameof(Ride)));
				}

				return _ride;
			}
		}



	}
}
