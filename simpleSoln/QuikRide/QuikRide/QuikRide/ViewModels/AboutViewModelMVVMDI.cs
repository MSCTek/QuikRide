using QuikRide.Interfaces;
using System.Threading.Tasks;

namespace QuikRide.ViewModels
{
    public class AboutViewModelMVVMDI : CustomViewModelBase
    {
        public AboutViewModelMVVMDI(INavigationService navService) : base(navService)
        {
        }

        public override async Task Init()
        {
            //do something async here
        }
    }
}