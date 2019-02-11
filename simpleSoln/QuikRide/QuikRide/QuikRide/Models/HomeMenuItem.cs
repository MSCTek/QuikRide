namespace QuikRide.Models
{
    public enum MenuItemType
    {
        Browse,
        AboutXAML,
        AboutNoXAML
    }

    public class HomeMenuItem
    {
        public MenuItemType Id { get; set; }

        public string Title { get; set; }
    }
}