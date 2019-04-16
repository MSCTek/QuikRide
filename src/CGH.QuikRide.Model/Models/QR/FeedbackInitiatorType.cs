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

	public class LoadRequestFeedbackInitiatorType : EventArgs
	{
		public LoadRequestFeedbackInitiatorType(string propertyNameRequestingLoad)
		{
			PropertyNameRequestingLoad = propertyNameRequestingLoad;
		}

		public string PropertyNameRequestingLoad { get; set; }
	}


	public partial class FeedbackInitiatorType : BaseModel<IWebApiDataServiceQR>, IFeedbackInitiatorType
	{
		public event EventHandler<LoadRequestFeedbackInitiatorType> OnLazyLoadRequest = delegate { }; // Empty delegate. Thus we are sure that value is always != null because no one outside of the class can change it.
		private xDTO.FeedbackInitiatorType _dto = null;

		public FeedbackInitiatorType(ILoggingService log, IDataService<IWebApiDataServiceQR> dataService) : base(log, dataService)
		{
			_dto = new xDTO.FeedbackInitiatorType();
			OnLazyLoadRequest += HandleLazyLoadRequest;
		}

		public FeedbackInitiatorType(ILoggingService log, IDataService<IWebApiDataServiceQR> dataService, xDTO.FeedbackInitiatorType dto) : this(log, dataService)
		{
			_dto = dto;
		}


		public virtual string Code { get { return _dto.Code; } }
		public virtual string CreatedBy { get { return _dto.CreatedBy; } }
		public virtual System.DateTime CreatedUtcDate { get { return _dto.CreatedUtcDate; } }
		public virtual int DataVersion { get { return _dto.DataVersion; } }
		public virtual int FeedbackInitiatorTypeId { get { return _dto.FeedbackInitiatorTypeId; } }
		public virtual bool IsDeleted { get { return _dto.IsDeleted; } }
		public virtual string ModifiedBy { get { return _dto.ModifiedBy; } }
		public virtual System.DateTime ModifiedUtcDate { get { return _dto.ModifiedUtcDate; } }

		private List<IFeedback> _feedbacks = null; // Reverse Navigation
		private List<IFeedbackInitiatorTypeTranslation> _feedbackInitiatorTypeTranslations = null; // Reverse Navigation


		public virtual List<IFeedback> Feedbacks
		{
			get
			{
				if (_feedbacks == null)
				{
					OnLazyLoadRequest(this, new LoadRequestFeedbackInitiatorType(nameof(Feedbacks)));
				}

				return _feedbacks;
			}
		}

		public virtual List<IFeedbackInitiatorTypeTranslation> FeedbackInitiatorTypeTranslations
		{
			get
			{
				if (_feedbackInitiatorTypeTranslations == null && _dto != null)
				{	// The core DTO object is loaded, but this property is not loaded.
					if (_dto.FeedbackInitiatorTypeTranslations != null)
					{	// The core DTO object has data for this property, load it into the model.
						_feedbackInitiatorTypeTranslations = new List<IFeedbackInitiatorTypeTranslation>();
						foreach (var dtoItem in _dto.FeedbackInitiatorTypeTranslations)
						{
							_feedbackInitiatorTypeTranslations.Add(new FeedbackInitiatorTypeTranslation(Log, DataService, dtoItem));
						}
					}
					else
					{	// Trigger the load data request - The core DTO object is loaded and does not have data for this property.
						OnLazyLoadRequest(this, new LoadRequestFeedbackInitiatorType(nameof(FeedbackInitiatorTypeTranslations)));
					}
				}

				return _feedbackInitiatorTypeTranslations;
			}
		}



	}
}