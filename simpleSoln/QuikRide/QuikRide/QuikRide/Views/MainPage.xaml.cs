using QuikRide.Interfaces;
using QuikRide.Models;
using QuikRide.ViewModels;
using System.Collections.Generic;
using System.Threading.Tasks;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace QuikRide.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class MainPage : MasterDetailPage
    {
        private Dictionary<int, NavigationPage> MenuPages = new Dictionary<int, NavigationPage>();

        private INavigationService navService = ((App)Application.Current).Kernel.GetService<INavigationService>();

        public MainPage()
        {
            InitializeComponent();

            MasterBehavior = MasterBehavior.Popover;

            MenuPages.Add((int)MenuItemType.Home, (NavigationPage)Detail);
        }

        public async Task NavigateFromMenu(int id)
        {
            if (!MenuPages.ContainsKey(id))
            {
                switch (id)
                {
                    case (int)MenuItemType.Home:
                        await navService.NavigateTo<HomeViewModel>();
                        MenuPages.Add(id, ((App)Application.Current).NavPage);

                        break;

                    case (int)MenuItemType.AboutXAML:
                        MenuPages.Add(id, new NavigationPage(new AboutPageXAML()));
                        break;

                    case (int)MenuItemType.AboutNoXAML:
                        MenuPages.Add(id, new NavigationPage(new AboutPageNoXAML()));
                        break;

                    case (int)MenuItemType.AboutMVVM:
                        MenuPages.Add(id, new NavigationPage(new AboutPageMVVM()));
                        break;

                    case (int)MenuItemType.AboutMVVMDI:
                        //var navPage1 = new NavigationPage();
                        // Register navigation module with ninject
                        //((App)Application.Current).Kernel.Load(new NavigationModule(navPage1));

                        // now we are navigating via view model, not by page!
                        await navService.NavigateTo<AboutViewModelMVVMDI>();
                        var navPage = navService.GetCurrentView() as NavigationPage;
                        MenuPages.Add(id, navPage);
                        break;

                    case (int)MenuItemType.MyReservationRequests:
                        //var navPage2 = new NavigationPage();
                        // Register navigation module with ninject
                        //((App)Application.Current).Kernel.Load(new NavigationModule(navPage2));
                        //var navService2 = ((App)Application.Current).Kernel.GetService<INavigationService>();

                        // now we are navigating via view model, not by page!
                        await navService.NavigateTo<MyReservationRequestsViewModel>();
                        MenuPages.Add(id, ((App)Application.Current).NavPage);
                        break;

                    case (int)MenuItemType.Map:
                        if (await Helpers.Helpers.CheckLocationPermissions())
                        {
                            //var navPage3 = new NavigationPage();
                            // Register navigation module with ninject
                            //((App)Application.Current).Kernel.Load(new NavigationModule(navPage3));
                            //var navService3 = ((App)Application.Current).Kernel.GetService<INavigationService>();

                            // now we are navigating via view model, not by page!
                            await navService.NavigateTo<MapViewModel>();
                            MenuPages.Add(id, ((App)Application.Current).NavPage);
                        }
                        else
                        {
                            //do nothing. their permissions are bad and they got a message.
                        }
                        break;

                    case (int)MenuItemType.MapWithPins:
                        if (await Helpers.Helpers.CheckLocationPermissions())
                        {
                            // var navPage4 = new NavigationPage();
                            // Register navigation module with ninject
                            //((App)Application.Current).Kernel.Load(new NavigationModule(navPage4));
                            //var navService4 = ((App)Application.Current).Kernel.GetService<INavigationService>();

                            // now we are navigating via view model, not by page!
                            await navService.NavigateTo<MapWithPinsViewModel>();
                            MenuPages.Add(id, ((App)Application.Current).NavPage);
                        }
                        else
                        {
                            //do nothing. their permissions are bad and they got a message.
                        }
                        break;

                    case (int)MenuItemType.UserLocation:
                        if (await Helpers.Helpers.CheckLocationPermissions())
                        {
                            //var navPage5 = new NavigationPage();
                            // Register navigation module with ninject
                            //((App)Application.Current).Kernel.Load(new NavigationModule(navPage5));
                            //var navService5 = ((App)Application.Current).Kernel.GetService<INavigationService>();

                            // now we are navigating via view model, not by page!
                            await navService.NavigateTo<UserLocationViewModel>();
                            MenuPages.Add(id, ((App)Application.Current).NavPage);
                        }
                        else
                        {
                            //do nothing. their permissions are bad and they got a message.
                        }
                        break;
                }
            }

            var newPage = MenuPages[id];

            if (newPage != null && Detail != newPage)
            {
                Detail = newPage;

                if (Device.RuntimePlatform == Device.Android)
                    await Task.Delay(100);

                IsPresented = false;
            }
        }

        /*private void BuildNav()
        {
            navPage = new NavigationPage();
            // Register navigation module with ninject
            ((App)Application.Current).Kernel = new StandardKernel(new NavigationModule(navPage));
            navService = ((App)Application.Current).Kernel.GetService<INavigationService>();
        }*/
    }
}