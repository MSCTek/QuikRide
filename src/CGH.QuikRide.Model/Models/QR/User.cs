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

	public class LoadRequestUser : EventArgs
	{
		public LoadRequestUser(string propertyNameRequestingLoad)
		{
			PropertyNameRequestingLoad = propertyNameRequestingLoad;
		}

		public string PropertyNameRequestingLoad { get; set; }
	}


	public partial class User : BaseModel<IWebApiDataServiceQR>, IUser
	{
		public event EventHandler<LoadRequestUser> OnLazyLoadRequest = delegate { }; // Empty delegate. Thus we are sure that value is always != null because no one outside of the class can change it.
		private xDTO.User _dto = null;

		public User(ILoggingService log, IDataService<IWebApiDataServiceQR> dataService) : base(log, dataService)
		{
			_dto = new xDTO.User();
			OnLazyLoadRequest += HandleLazyLoadRequest;
		}

		public User(ILoggingService log, IDataService<IWebApiDataServiceQR> dataService, xDTO.User dto) : this(log, dataService)
		{
			_dto = dto;
		}


		public virtual System.DateTime? BirthDate { get { return _dto.BirthDate; } }
		public virtual string CreatedBy { get { return _dto.CreatedBy; } }
		public virtual System.DateTime CreatedUtcDate { get { return _dto.CreatedUtcDate; } }
		public virtual int DataVersion { get { return _dto.DataVersion; } }
		public virtual string Email { get { return _dto.Email; } }
		public virtual string FirstName { get { return _dto.FirstName; } }
		public virtual int GenderTypeId { get { return _dto.GenderTypeId; } }
		public virtual bool IsDeleted { get { return _dto.IsDeleted; } }
		public virtual System.DateTime LastLogin { get { return _dto.LastLogin; } }
		public virtual string LastName { get { return _dto.LastName; } }
		public virtual string ModifiedBy { get { return _dto.ModifiedBy; } }
		public virtual System.DateTime ModifiedUtcDate { get { return _dto.ModifiedUtcDate; } }
		public virtual string Password { get { return _dto.Password; } }
		public virtual int PreferredLanguageId { get { return _dto.PreferredLanguageId; } }
		public virtual string Salt { get { return _dto.Salt; } }
		public virtual int UserId { get { return _dto.UserId; } }
		public virtual string UserName { get { return _dto.UserName; } }

		private IGenderType _genderType = null; // Foreign Key
		private ILanguageType _languageType = null; // Foreign Key
		private List<IDriver> _drivers = null; // Reverse Navigation
		private List<IReservation> _reservations = null; // Reverse Navigation
		private List<IReservationRequest> _reservationRequests = null; // Reverse Navigation
		private List<IRide> _rides = null; // Reverse Navigation
		private List<IUsersLocation> _usersLocations = null; // Reverse Navigation
		private List<IUsersNotificationType> _usersNotificationTypes = null; // Reverse Navigation


		public virtual IGenderType GenderType
		{
			get
			{
				if (_genderType == null && _dto != null && _dto.GenderType != null)
				{
					_genderType = new GenderType(Log, DataService, _dto.GenderType);
				}

				return _genderType;
			}
		}

		public virtual ILanguageType LanguageType
		{
			get
			{
				if (_languageType == null && _dto != null && _dto.LanguageType != null)
				{
					_languageType = new LanguageType(Log, DataService, _dto.LanguageType);
				}

				return _languageType;
			}
		}

		public virtual List<IDriver> Drivers
		{
			get
			{
				if (_drivers == null)
				{
					OnLazyLoadRequest(this, new LoadRequestUser(nameof(Drivers)));
				}

				return _drivers;
			}
		}

		public virtual List<IReservation> Reservations
		{
			get
			{
				if (_reservations == null && _dto != null)
				{	// The core DTO object is loaded, but this property is not loaded.
					if (_dto.Reservations != null)
					{	// The core DTO object has data for this property, load it into the model.
						_reservations = new List<IReservation>();
						foreach (var dtoItem in _dto.Reservations)
						{
							_reservations.Add(new Reservation(Log, DataService, dtoItem));
						}
					}
					else
					{	// Trigger the load data request - The core DTO object is loaded and does not have data for this property.
						OnLazyLoadRequest(this, new LoadRequestUser(nameof(Reservations)));
					}
				}

				return _reservations;
			}
		}

		public virtual List<IReservationRequest> ReservationRequests
		{
			get
			{
				if (_reservationRequests == null && _dto != null)
				{	// The core DTO object is loaded, but this property is not loaded.
					if (_dto.ReservationRequests != null)
					{	// The core DTO object has data for this property, load it into the model.
						_reservationRequests = new List<IReservationRequest>();
						foreach (var dtoItem in _dto.ReservationRequests)
						{
							_reservationRequests.Add(new ReservationRequest(Log, DataService, dtoItem));
						}
					}
					else
					{	// Trigger the load data request - The core DTO object is loaded and does not have data for this property.
						OnLazyLoadRequest(this, new LoadRequestUser(nameof(ReservationRequests)));
					}
				}

				return _reservationRequests;
			}
		}

		public virtual List<IRide> Rides
		{
			get
			{
				if (_rides == null && _dto != null)
				{	// The core DTO object is loaded, but this property is not loaded.
					if (_dto.Rides != null)
					{	// The core DTO object has data for this property, load it into the model.
						_rides = new List<IRide>();
						foreach (var dtoItem in _dto.Rides)
						{
							_rides.Add(new Ride(Log, DataService, dtoItem));
						}
					}
					else
					{	// Trigger the load data request - The core DTO object is loaded and does not have data for this property.
						OnLazyLoadRequest(this, new LoadRequestUser(nameof(Rides)));
					}
				}

				return _rides;
			}
		}

		public virtual List<IUsersLocation> UsersLocations
		{
			get
			{
				if (_usersLocations == null && _dto != null)
				{	// The core DTO object is loaded, but this property is not loaded.
					if (_dto.UsersLocations != null)
					{	// The core DTO object has data for this property, load it into the model.
						_usersLocations = new List<IUsersLocation>();
						foreach (var dtoItem in _dto.UsersLocations)
						{
							_usersLocations.Add(new UsersLocation(Log, DataService, dtoItem));
						}
					}
					else
					{	// Trigger the load data request - The core DTO object is loaded and does not have data for this property.
						OnLazyLoadRequest(this, new LoadRequestUser(nameof(UsersLocations)));
					}
				}

				return _usersLocations;
			}
		}

		public virtual List<IUsersNotificationType> UsersNotificationTypes
		{
			get
			{
				if (_usersNotificationTypes == null && _dto != null)
				{	// The core DTO object is loaded, but this property is not loaded.
					if (_dto.UsersNotificationTypes != null)
					{	// The core DTO object has data for this property, load it into the model.
						_usersNotificationTypes = new List<IUsersNotificationType>();
						foreach (var dtoItem in _dto.UsersNotificationTypes)
						{
							_usersNotificationTypes.Add(new UsersNotificationType(Log, DataService, dtoItem));
						}
					}
					else
					{	// Trigger the load data request - The core DTO object is loaded and does not have data for this property.
						OnLazyLoadRequest(this, new LoadRequestUser(nameof(UsersNotificationTypes)));
					}
				}

				return _usersNotificationTypes;
			}
		}



	}
}
