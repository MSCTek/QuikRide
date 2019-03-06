using Microsoft.AppCenter;
using Microsoft.AppCenter.Analytics;
using Microsoft.AppCenter.Crashes;
using Ninject;
using Ninject.Modules;
using QuikRide.Modules;
using QuikRide.Services;
using QuikRide.Views;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

[assembly: XamlCompilation(XamlCompilationOptions.Compile)]

namespace QuikRide
{
    public partial class App : Application
    {
        public App(params INinjectModule[] platformModules)
        {
            InitializeComponent();
            NavPage = new NavigationPage();

            // Register navigation module with ninject - we can register our navigation service here too, if we want to.
            Kernel = new StandardKernel(new CoreModule(), new NavigationModule(NavPage));

            Kernel.Load(platformModules);

            MainPage = new MainPage();
        }

        public NavigationPage NavPage { get; }
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