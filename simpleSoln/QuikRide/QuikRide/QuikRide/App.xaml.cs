using Microsoft.AppCenter;
using Microsoft.AppCenter.Analytics;
using Microsoft.AppCenter.Crashes;
using Ninject;
using QuikRide.Views;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

[assembly: XamlCompilation(XamlCompilationOptions.Compile)]

namespace QuikRide
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

            MainPage = new MainPage();
        }

        public IKernel Kernel { get; set; }

        protected override void OnResume()
        {
            // Handle when your app resumes
        }

        protected override void OnSleep()
        {
            // Handle when your app sleeps
        }

        protected override void OnStart()
        {
            // Handle when your app starts
            AppCenter.Start("android=81c14267-540b-40f3-a128-e0d19e954a6b;" +
                  "uwp=45ef3c64-4ab7-4e48-a49c-9874069804ad;" +
                  "ios=91024294-d2fa-4ff2-aaf0-d2d046f91f33;",
                  typeof(Analytics), typeof(Crashes));
        }
    }
}