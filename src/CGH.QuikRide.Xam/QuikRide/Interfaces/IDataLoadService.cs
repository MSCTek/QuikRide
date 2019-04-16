using System.Threading.Tasks;

namespace QuikRide.Interfaces
{
    public interface IDataLoadService
    {
        Task<bool> HeartbeatCheck();

        Task<int> LoadFeedbackTypes();

        Task<int> LoadLanguageTypes();

        Task<int> LoadLocations();

        Task<int> LoadReservationRequests();

        Task<int> LoadUser(int userId);

        Task<int> LoadUsers();

        Task<int> LoadVehicleFeatureTypes();

        Task<int> LoadVehicles();

        Task<int> LoadVehicleStatusTypes();

        Task<int> LoadVehicleTypes();

        Task<int> LoadVehicleTypeVehicleFeatureTypes();

        Task<int> LoadVehicleVehicleFeatureTypes();
    }
}