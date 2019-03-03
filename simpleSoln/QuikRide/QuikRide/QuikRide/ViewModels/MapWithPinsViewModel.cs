using QuikRide.Interfaces;
using QuikRide.ModelsObj;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace QuikRide.ViewModels
{
    public class MapWithPinsViewModel : CustomViewModelBase
    {
        public MapWithPinsViewModel(INavigationService navService) : base(navService)
        {
        }

        public override async Task Init()
        {
        }

        internal List<Location> GetLocations()
        {
            return new List<Location>() {
                SampleData.SampleLocation.SampleCosleyZoo,
                SampleData.SampleLocation.SampleHome,
                SampleData.SampleLocation.SampleRockinJump,
                SampleData.SampleLocation.SampleSafariLand
            };
        }
    }
}