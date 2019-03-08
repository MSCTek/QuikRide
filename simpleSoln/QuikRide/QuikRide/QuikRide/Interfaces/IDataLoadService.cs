using System.Threading.Tasks;

namespace QuikRide.Interfaces
{
    public interface IDataLoadService
    {
        Task<bool> HeartbeatCheck();

        Task<int> LoadLocations();

        Task<int> LoadReservationRequests();
    }
}