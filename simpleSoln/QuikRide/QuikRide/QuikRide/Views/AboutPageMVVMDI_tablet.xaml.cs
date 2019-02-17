using System;
using Xamarin.Forms;

namespace QuikRide.Views
{
    public partial class AboutPageMVVMDI_tablet : ContentPage
    {
        public AboutPageMVVMDI_tablet()
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