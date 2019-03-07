namespace QuikRide.Models
{
    public enum MenuItemType
    {
        Home,
        AboutXAML,
        AboutNoXAML,
        AboutMVVM,
        AboutMVVMDI,
        MyReservationRequests,
        Map,
        MapWithPins,
        UserLocation
    }

    public class HomeMenuItem
    {
        public MenuItemType Id { get; set; }

        public string Title { get; set; }
    }
}