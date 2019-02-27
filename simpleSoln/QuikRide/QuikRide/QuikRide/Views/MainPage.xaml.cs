using Ninject;
using QuikRide.Interfaces;
using QuikRide.Models;
using QuikRide.Modules;
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

        //private NavigationPage navPage;

        //private INavigationService navService;

        public MainPage()
        {
            InitializeComponent();

            MasterBehavior = MasterBehavior.Popover;

            MenuPages.Add((int)MenuItemType.Welcome, (NavigationPage)Detail);
        }

        public async Task NavigateFromMenu(int id)
        {
            if (!MenuPages.ContainsKey(id))
            {
                switch (id)
                {
                    case (int)MenuItemType.Welcome:
                        MenuPages.Add(id, new NavigationPage(new WelcomePage()));
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
                        var navPage1 = new NavigationPage();
                        // Register navigation module with ninject
                        ((App)Application.Current).Kernel = new StandardKernel(new NavigationModule(navPage1));
                        var navService1 = ((App)Application.Current).Kernel.GetService<INavigationService>();

                        // now we are navigating via view model, not by page!
                        await navService1.NavigateTo<AboutViewModelMVVMDI>();
                        MenuPages.Add(id, navPage1);
                        break;

                    case (int)MenuItemType.MyReservationRequests:
                        var navPage2 = new NavigationPage();
                        // Register navigation module with ninject
                        ((App)Application.Current).Kernel = new StandardKernel(new NavigationModule(navPage2));
                        var navService2 = ((App)Application.Current).Kernel.GetService<INavigationService>();

                        // now we are navigating via view model, not by page!
                        await navService2.NavigateTo<MyReservationRequestsViewModel>();
                        MenuPages.Add(id, navPage2);
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