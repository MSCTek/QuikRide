using QuikRide.Models;
using System.Collections.Generic;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace QuikRide.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class MenuPage : ContentPage
    {
        private List<HomeMenuItem> menuItems;

        public MenuPage()
        {
            InitializeComponent();

            menuItems = new List<HomeMenuItem>
            {
                new HomeMenuItem {Id = MenuItemType.Home, Title="Home" },
                new HomeMenuItem {Id = MenuItemType.AboutNoXAML, Title="About (No XAML)" },
                new HomeMenuItem {Id = MenuItemType.AboutXAML, Title="About (XAML)" },
                new HomeMenuItem {Id = MenuItemType.AboutMVVM, Title="About (MVVM)" },
                new HomeMenuItem {Id = MenuItemType.AboutMVVMDI, Title="About (MVVM DI)"},
                new HomeMenuItem {Id = MenuItemType.MyReservationRequests, Title="My Reservation Requests"},
                new HomeMenuItem {Id = MenuItemType.Map, Title="Map"},
                new HomeMenuItem {Id = MenuItemType.MapWithPins, Title="Map with Pins"},
                new HomeMenuItem {Id = MenuItemType.UserLocation, Title="User's Current Location"},
            };

            ListViewMenu.ItemsSource = menuItems;

            ListViewMenu.SelectedItem = menuItems[0];
            ListViewMenu.ItemSelected += async (sender, e) =>
            {
                if (e.SelectedItem == null)
                    return;

                var id = (int)((HomeMenuItem)e.SelectedItem).Id;
                await RootPage.NavigateFromMenu(id);
            };
        }

        private MainPage RootPage { get => Application.Current.MainPage as MainPage; }
    }
}