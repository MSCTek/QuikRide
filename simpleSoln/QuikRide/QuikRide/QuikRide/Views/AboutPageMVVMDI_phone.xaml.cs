using System;
using Xamarin.Forms;

namespace QuikRide.Views
{
    public partial class AboutPageMVVMDI_phone : ContentPage
    {
        public AboutPageMVVMDI_phone()
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