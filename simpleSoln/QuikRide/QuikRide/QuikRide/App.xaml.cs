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
            AppCenter.Start($"android={Config.AppCenterDroid};" +
                  $"uwp={Config.AppCenterUWP};" +
                  $"ios={Config.AppCenterIOS};",
                  typeof(Analytics), typeof(Crashes));
        }
    }
}