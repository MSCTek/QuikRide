using Ninject.Modules;
using QuikRide.Interfaces;
using QuikRide.Services;
using QuikRide.ViewModels;
using QuikRide.Views;
using Xamarin.Forms;

namespace QuikRide.Modules
{
    internal class NavigationModule : NinjectModule
    {
        private readonly INavigation _xfNav;
        private NavigationPage _navigationPage;

        public NavigationModule(NavigationPage navPage)
        {
            _navigationPage = navPage;
            _xfNav = navPage.Navigation;
        }

        public override void Load()
        {
            var navService = new NavigationService();

            RefreshNavModule(navService);

            if (Device.Idiom == TargetIdiom.Phone)
            {
                //for the phone
                //navService.RegisterViewMapping(typeof(myViewModel), typeof(myPage));
                navService.RegisterViewMapping(typeof(AboutViewModelMVVMDI), typeof(AboutPageMVVMDI_phone));
            }
            else
            {
                //for the tablet & desktop
                //navService.RegisterViewMapping(typeof(myViewModel), typeof(myPage));
                navService.RegisterViewMapping(typeof(AboutViewModelMVVMDI), typeof(AboutPageMVVMDI_tablet));
            }

            //Mappings for Views and ViewModels that do not change for tablets or phones
            navService.RegisterViewMapping(typeof(HomeViewModel), typeof(HomePage));
            navService.RegisterViewMapping(typeof(GridMenuViewModel), typeof(GridMenuPage));
            navService.RegisterViewMapping(typeof(MyReservationRequestsViewModel), typeof(MyReservationRequestsPage));
            navService.RegisterViewMapping(typeof(MapViewModel), typeof(MapPage));
            navService.RegisterViewMapping(typeof(MapWithPinsViewModel), typeof(MapWithPinsPage));
            navService.RegisterViewMapping(typeof(UserLocationViewModel), typeof(UserLocationPage));

            Bind<INavigationService>().ToMethod(x => navService).InSingletonScope();
        }

        public void RefreshNavModule(NavigationService navService)
        {
            navService.NavigationPage = _navigationPage;
            navService.XamarinFormsNav = _navigationPage.Navigation;
        }
    }
}