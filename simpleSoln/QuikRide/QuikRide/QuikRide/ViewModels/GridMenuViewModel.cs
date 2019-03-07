using QuikRide.Interfaces;
using System.Threading.Tasks;

namespace QuikRide.ViewModels
{
    public class GridMenuViewModel : CustomViewModelBase
    {
        public GridMenuViewModel(INavigationService navService, IDataLoadService dataLoadService) : base(navService, dataLoadService)
        {
        }

        public override async Task Init()
        {
        }
    }
}