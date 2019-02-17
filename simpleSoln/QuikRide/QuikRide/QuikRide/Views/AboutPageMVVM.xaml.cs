using System;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace QuikRide.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class AboutPageMVVM : ContentPage
    {
        public AboutPageMVVM()
        {
            InitializeComponent();
        }

        private void Slack_Tapped(object sender, EventArgs e)
        {
            Application.Current.MainPage.DisplayAlert(
                        "Wait!",
                        "You must be a member to join our Slack Channel!",
                        "OK");
        }
    }
}