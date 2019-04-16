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

	public class LoadRequestUserRewardAccount : EventArgs
	{
		public LoadRequestUserRewardAccount(string propertyNameRequestingLoad)
		{
			PropertyNameRequestingLoad = propertyNameRequestingLoad;
		}

		public string PropertyNameRequestingLoad { get; set; }
	}


	public partial class UserRewardAccount : BaseModel<IWebApiDataServiceQR>, IUserRewardAccount
	{
		public event EventHandler<LoadRequestUserRewardAccount> OnLazyLoadRequest = delegate { }; // Empty delegate. Thus we are sure that value is always != null because no one outside of the class can change it.
		private xDTO.UserRewardAccount _dto = null;

		public UserRewardAccount(ILoggingService log, IDataService<IWebApiDataServiceQR> dataService) : base(log, dataService)
		{
			_dto = new xDTO.UserRewardAccount();
			OnLazyLoadRequest += HandleLazyLoadRequest;
		}

		public UserRewardAccount(ILoggingService log, IDataService<IWebApiDataServiceQR> dataService, xDTO.UserRewardAccount dto) : this(log, dataService)
		{
			_dto = dto;
		}


		public virtual string CreatedBy { get { return _dto.CreatedBy; } }
		public virtual System.DateTime CreatedUtcDate { get { return _dto.CreatedUtcDate; } }
		public virtual int DataVersion { get { return _dto.DataVersion; } }
		public virtual bool IsDeleted { get { return _dto.IsDeleted; } }
		public virtual string ModifiedBy { get { return _dto.ModifiedBy; } }
		public virtual System.DateTime ModifiedUtcDate { get { return _dto.ModifiedUtcDate; } }
		public virtual int UserId { get { return _dto.UserId; } }
		public virtual System.Guid UserRewardAccountId { get { return _dto.UserRewardAccountId; } }





	}
}