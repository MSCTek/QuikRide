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

	public class LoadRequestBusRouteStop : EventArgs
	{
		public LoadRequestBusRouteStop(string propertyNameRequestingLoad)
		{
			PropertyNameRequestingLoad = propertyNameRequestingLoad;
		}

		public string PropertyNameRequestingLoad { get; set; }
	}


	public partial class BusRouteStop : BaseModel<IWebApiDataServiceQR>, IBusRouteStop
	{
		public event EventHandler<LoadRequestBusRouteStop> OnLazyLoadRequest = delegate { }; // Empty delegate. Thus we are sure that value is always != null because no one outside of the class can change it.
		private xDTO.BusRouteStop _dto = null;

		public BusRouteStop(ILoggingService log, IDataService<IWebApiDataServiceQR> dataService) : base(log, dataService)
		{
			_dto = new xDTO.BusRouteStop();
			OnLazyLoadRequest += HandleLazyLoadRequest;
		}

		public BusRouteStop(ILoggingService log, IDataService<IWebApiDataServiceQR> dataService, xDTO.BusRouteStop dto) : this(log, dataService)
		{
			_dto = dto;
		}


		public virtual int BusRouteId { get { return _dto.BusRouteId; } }
		public virtual int BusRouteStopId { get { return _dto.BusRouteStopId; } }
		public virtual string CreatedBy { get { return _dto.CreatedBy; } }
		public virtual System.DateTime CreatedUtcDate { get { return _dto.CreatedUtcDate; } }
		public virtual int DataVersion { get { return _dto.DataVersion; } }
		public virtual bool IsDeleted { get { return _dto.IsDeleted; } }
		public virtual bool IsMajorStop { get { return _dto.IsMajorStop; } }
		public virtual bool IsPublishedStop { get { return _dto.IsPublishedStop; } }
		public virtual System.Guid LocationId { get { return _dto.LocationId; } }
		public virtual string ModifiedBy { get { return _dto.ModifiedBy; } }
		public virtual System.DateTime ModifiedUtcDate { get { return _dto.ModifiedUtcDate; } }

		private IBusRoute _busRoute = null; // Foreign Key
		private ILocation _location = null; // Foreign Key


		public virtual IBusRoute BusRoute
		{
			get
			{
				if (_busRoute == null)
				{
					OnLazyLoadRequest(this, new LoadRequestBusRouteStop(nameof(BusRoute)));
				}

				return _busRoute;
			}
		}

		public virtual ILocation Location
		{
			get
			{
				if (_location == null && _dto != null && _dto.Location != null)
				{
					_location = new Location(Log, DataService, _dto.Location);
				}

				return _location;
			}
		}



	}
}
