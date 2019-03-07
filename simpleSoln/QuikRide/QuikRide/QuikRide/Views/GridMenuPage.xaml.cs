using QuikRide.Interfaces;
using Xamarin.Forms.Xaml;

namespace QuikRide.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class GridMenuPage : IContentPage
    {
        public GridMenuPage()
        {
            InitializeComponent();
        }

        public void PrepareForDispose()
        {
        }
    }
}