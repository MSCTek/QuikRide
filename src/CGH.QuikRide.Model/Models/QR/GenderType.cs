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

	public class LoadRequestGenderType : EventArgs
	{
		public LoadRequestGenderType(string propertyNameRequestingLoad)
		{
			PropertyNameRequestingLoad = propertyNameRequestingLoad;
		}

		public string PropertyNameRequestingLoad { get; set; }
	}


	public partial class GenderType : BaseModel<IWebApiDataServiceQR>, IGenderType
	{
		public event EventHandler<LoadRequestGenderType> OnLazyLoadRequest = delegate { }; // Empty delegate. Thus we are sure that value is always != null because no one outside of the class can change it.
		private xDTO.GenderType _dto = null;

		public GenderType(ILoggingService log, IDataService<IWebApiDataServiceQR> dataService) : base(log, dataService)
		{
			_dto = new xDTO.GenderType();
			OnLazyLoadRequest += HandleLazyLoadRequest;
		}

		public GenderType(ILoggingService log, IDataService<IWebApiDataServiceQR> dataService, xDTO.GenderType dto) : this(log, dataService)
		{
			_dto = dto;
		}


		public virtual string Code { get { return _dto.Code; } }
		public virtual string CreatedBy { get { return _dto.CreatedBy; } }
		public virtual System.DateTime CreatedUtcDate { get { return _dto.CreatedUtcDate; } }
		public virtual int DataVersion { get { return _dto.DataVersion; } }
		public virtual int GenderTypeId { get { return _dto.GenderTypeId; } }
		public virtual bool IsDeleted { get { return _dto.IsDeleted; } }
		public virtual string ModifiedBy { get { return _dto.ModifiedBy; } }
		public virtual System.DateTime ModifiedUtcDate { get { return _dto.ModifiedUtcDate; } }

		private List<IGenderTypeTranslation> _genderTypeTranslations = null; // Reverse Navigation
		private List<IUser> _users = null; // Reverse Navigation


		public virtual List<IGenderTypeTranslation> GenderTypeTranslations
		{
			get
			{
				if (_genderTypeTranslations == null && _dto != null)
				{	// The core DTO object is loaded, but this property is not loaded.
					if (_dto.GenderTypeTranslations != null)
					{	// The core DTO object has data for this property, load it into the model.
						_genderTypeTranslations = new List<IGenderTypeTranslation>();
						foreach (var dtoItem in _dto.GenderTypeTranslations)
						{
							_genderTypeTranslations.Add(new GenderTypeTranslation(Log, DataService, dtoItem));
						}
					}
					else
					{	// Trigger the load data request - The core DTO object is loaded and does not have data for this property.
						OnLazyLoadRequest(this, new LoadRequestGenderType(nameof(GenderTypeTranslations)));
					}
				}

				return _genderTypeTranslations;
			}
		}

		public virtual List<IUser> Users
		{
			get
			{
				if (_users == null)
				{
					OnLazyLoadRequest(this, new LoadRequestGenderType(nameof(Users)));
				}

				return _users;
			}
		}



	}
}
