using System.Collections.Generic;
using System.Threading.Tasks;
using dataModel = CGH.QuikRide.Xam.ModelData.QR;
using objModel = CGH.QuikRide.Xam.ModelObj.QR;

namespace QuikRide.Interfaces
{
    public interface IDataRetrievalService
    {
        Task<IList<objModel.FeedbackType>> GetAllFeedbackTypes();

        Task<List<objModel.Location>> GetAllLocations();

        Task<IList<objModel.Vehicle>> GetAllVehicles();

        Task<int> WriteFeedbackRecord(dataModel.Feedback feedback);
    }
}