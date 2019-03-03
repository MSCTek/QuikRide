using QuikRide.Interfaces;
using System.Threading.Tasks;

namespace QuikRide.ViewModels
{
    public class MapViewModel : CustomViewModelBase
    {
        public MapViewModel(INavigationService navService) : base(navService)
        {
        }

        public override async Task Init()
        {
        }
    }
}