using System.Threading.Tasks;

namespace QuikRide.Interfaces
{
    public interface IDataLoadService
    {
        Task<int> LoadLocations();

        Task<int> LoadReservationRequests();
    }
}