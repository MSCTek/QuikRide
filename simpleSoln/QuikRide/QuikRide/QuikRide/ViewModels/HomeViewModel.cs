using QuikRide.Interfaces;
using System.Threading.Tasks;

namespace QuikRide.ViewModels
{
    public class HomeViewModel : CustomViewModelBase
    {
        public HomeViewModel(INavigationService navService, IDataLoadService dataLoadService) : base(navService, dataLoadService)
        {
        }

        public async override Task Init()
        {
        }
    }
}