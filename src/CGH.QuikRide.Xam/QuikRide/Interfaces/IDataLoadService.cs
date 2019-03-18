using System.Threading.Tasks;

namespace QuikRide.Interfaces
{
    public interface IDataLoadService
    {
        Task<bool> HeartbeatCheck();

        Task<int> LoadLocations();

        Task<int> LoadReservationRequests();

        Task<int> LoadVehicleFeatureTypes();

        Task<int> LoadVehicles();

        Task<int> LoadVehicleStatusTypes();

        Task<int> LoadVehicleTypes();

        Task<int> LoadVehicleTypeVehicleFeatureTypes();

        Task<int> LoadVehicleVehicleFeatureTypes();
    }
}