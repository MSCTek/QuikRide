using System.Collections.Generic;
using System.Threading.Tasks;
using objModel = QuikRide.ModelsObj;

namespace QuikRide.Interfaces
{
    public interface IDataRetrievalService
    {
        Task<List<objModel.Location>> GetAllLocations();
    }
}