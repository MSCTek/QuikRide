using GalaSoft.MvvmLight.Command;
using QuikRide.Interfaces;
using System.Threading.Tasks;

namespace QuikRide.ViewModels
{
    public class HomeViewModel : CustomViewModelBase
    {
        public HomeViewModel(INavigationService navService, IDataLoadService dataLoadService, IDataRetrievalService dataRetrievalService)
            : base(navService, dataLoadService, dataRetrievalService)
        {
        }

        public RelayCommand AboutCommand
        {
            get
            {
                return new RelayCommand(async () =>
                {
                    await NavService.NavigateTo<AboutViewModelMVVMDI>();
                });
            }
        }

        public RelayCommand FeedbackCommand
        {
            get
            {
                return new RelayCommand(async () =>
                {
                    //we don't want to require permissions...just check them
                    await Helpers.Helpers.CheckLocationPermissions();

                    await NavService.NavigateTo<FeedbackViewModel>();
                });
            }
        }

        public RelayCommand MapCommand
        {
            get
            {
                return new RelayCommand(async () =>
                {
                    if (await Helpers.Helpers.CheckLocationPermissions())
                    {
                        await NavService.NavigateTo<MapViewModel>();
                    }
                });
            }
        }

        public RelayCommand MapWithPinsCommand
        {
            get
            {
                return new RelayCommand(async () =>
                {
                    if (await Helpers.Helpers.CheckLocationPermissions())
                    {
                        await NavService.NavigateTo<MapWithPinsViewModel>();
                    }
                });
            }
        }

        public RelayCommand MyReservationRequestsCommand
        {
            get
            {
                return new RelayCommand(async () =>
                {
                    await NavService.NavigateTo<MyReservationRequestsViewModel>();
                });
            }
        }

        public RelayCommand UserLocationCommand
        {
            get
            {
                return new RelayCommand(async () =>
                {
                    if (await Helpers.Helpers.CheckLocationPermissions())
                    {
                        await NavService.NavigateTo<UserLocationViewModel>();
                    }
                });
            }
        }

        public async override Task Init()
        {
            await base.CheckAppCenter();
            await base.CheckBadQueuedRecords();
        }
    }
}