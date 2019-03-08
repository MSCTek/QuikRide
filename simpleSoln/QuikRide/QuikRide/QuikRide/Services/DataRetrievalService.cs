using QuikRide.Interfaces;
using QuikRide.Mappers;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using dataModel = QuikRide.ModelsData;
using objModel = QuikRide.ModelsObj;

namespace QuikRide.Services
{
    public class DataRetrievalService : IDataRetrievalService
    {
        private IDatabase _db;

        public DataRetrievalService(IDatabase database)
        {
            _db = database;
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
    }
}