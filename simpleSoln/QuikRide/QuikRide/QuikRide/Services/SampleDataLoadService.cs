using QuikRide.Interfaces;
using System.Threading.Tasks;

namespace QuikRide.Services
{
    public class SampleDataLoadService : IDataLoadService
    {
        public async Task<int> LoadLocations()
        {
            return 0;
        }

        public async Task<int> LoadReservationRequests()
        {
            return 0;
        }
    }
}