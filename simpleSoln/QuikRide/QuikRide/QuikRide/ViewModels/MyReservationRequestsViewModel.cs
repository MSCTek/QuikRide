using QuikRide.Interfaces;
using System.Threading.Tasks;

namespace QuikRide.ViewModels
{
    public class MyReservationRequestsViewModel : CustomViewModelBase
    {
        public MyReservationRequestsViewModel(INavigationService navService) : base(navService)
        {
        }

        public override async Task Init()
        {
            //load sample data
        }
    }
}