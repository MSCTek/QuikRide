using CGH.QuikRide.Xam;
using QuikRide.Interfaces;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using dataModel = CGH.QuikRide.Xam.ModelData.QR;
using objModel = CGH.QuikRide.Xam.ModelObj.QR;

namespace QuikRide.Services
{
    public class DataRetrievalService : IDataRetrievalService
    {
        private IDatabase _db;

        public DataRetrievalService(IDatabase database)
        {
            _db = database;
        }

        public async Task<IList<objModel.FeedbackType>> GetAllFeedbackTypes()
        {
            var returnMe = new List<objModel.FeedbackType>();
            var dataResults = await _db.GetAsyncConnection()
                .Table<dataModel.FeedbackType>()
                .OrderBy(x => x.DisplayText).ToListAsync();

            if (dataResults.Any())
            {
                foreach (var d in dataResults)
                {
                    returnMe.Add(d.ToModelObj());
                }
            }
            return returnMe;
        }

        public async Task<List<objModel.Location>> GetAllLocations()
        {
            var returnMe = new List<objModel.Location>();
            var dataResults = await _db.GetAsyncConnection()
                .Table<dataModel.Location>()
                .OrderBy(x => x.Name).ToListAsync();

            if (dataResults.Any())
            {
                foreach (var d in dataResults)
                {
                    returnMe.Add(d.ToModelObj());
                }
            }
            return returnMe;
        }

        public async Task<IList<objModel.Vehicle>> GetAllVehicles()
        {
            var returnMe = new List<objModel.Vehicle>();
            var dataResults = await _db.GetAsyncConnection()
                .Table<dataModel.Vehicle>()
                .OrderBy(x => x.LicensePlateNumber).ToListAsync();

            if (dataResults.Any())
            {
                foreach (var d in dataResults)
                {
                    returnMe.Add(d.ToModelObj());
                }
            }
            return returnMe;
        }

        public async Task<int> WriteFeedbackRecord(dataModel.Feedback feedback)
        {
            return await _db.GetAsyncConnection().InsertAsync(feedback);
        }
    }
}