using QuikRide.Interfaces;
using System.Threading.Tasks;

namespace QuikRide.ViewModels
{
    public class MapViewModel : CustomViewModelBase
    {
        public MapViewModel(INavigationService navService, IDataLoadService dataLoadService) : base(navService, dataLoadService)
        {
        }

        public override async Task Init()
        {
        }
    }
}