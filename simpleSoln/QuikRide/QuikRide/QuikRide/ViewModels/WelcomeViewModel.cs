using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Command;
using Ninject;
using QuikRide.Interfaces;
using System.Threading.Tasks;

namespace QuikRide.ViewModels
{
    public class WelcomeViewModel : ObservableObject
    {
        protected IDataLoadService _dataLoadService;

        //protected IDataRetrievalService _dataService;
        private string _displayMessage;

        private bool _isBusy = false;
        private bool _showTryAgainButton;

        public WelcomeViewModel()
        {
            DisplayMessage = string.Empty;
            ShowTryAgainButton = false;
            IsBusy = false;
        }

        public string DisplayMessage
        {
            get { return _displayMessage; }
            set { Set(nameof(DisplayMessage), ref _displayMessage, value); }
        }

        public bool IsBusy
        {
            get { return _isBusy; }
            set { Set(ref _isBusy, value); }
        }

        public bool ShowTryAgainButton
        {
            get { return _showTryAgainButton; }
            set { Set(nameof(ShowTryAgainButton), ref _showTryAgainButton, value); }
        }

        public RelayCommand TryAgainCommand
        {
            get
            {
                return new RelayCommand(async () =>
                {
                    await Init();
                });
            }
        }

        public async Task Init()
        {
            DisplayMessage = string.Empty;
            ShowTryAgainButton = false;
            IsBusy = true;

            if (SetUp())
            {
                //if (Connectivity.NetworkAccess == NetworkAccess.Internet)
                //{
                if (await _dataLoadService.HeartbeatCheck())
                {
                    DisplayMessage = $"Loading.";

                    var numLocations = await _dataLoadService.LoadLocations();
                    DisplayMessage = $"Loading..";
                    //Preferences.Set(Config.Preference_LastLocationUpdate, DateTime.UtcNow.ToString());
                    await Task.Delay(500);

                    var numReservationRequests = await _dataLoadService.LoadReservationRequests();
                    DisplayMessage = $"Loading...";
                    //Preferences.Set(Config.Preference_LastReservationRequestUpdate, DateTime.UtcNow.ToString());
                    await Task.Delay(500);

                    DisplayMessage = $"All Done - Data Loaded";
                    IsBusy = false;
                    await Task.Delay(500);
                    Xamarin.Forms.Application.Current.MainPage = new Views.MainPage();
                }
                else
                {
                    //No API
                    DisplayMessage = $"Our services are down. Please try again later.";
                    IsBusy = false;
                    ShowTryAgainButton = true;
                }
                //}
                //else
                //{
                //no connectivity
                //   DisplayMessage = $"Limited or no internet connectivity. Please try again!";
                //   IsBusy = false;
                //   ShowTryAgainButton = true;
                //}
            }
        }

        private bool SetUp()
        {
            //TODO: move this to the constructors...but hey, so convienient just like this...maybe leave it as is...
            var ker = ((QuikRide.App)Xamarin.Forms.Application.Current).Kernel;
            //_dataService = ker.Get<IDataRetrievalService>();
            _dataLoadService = ker.Get<IDataLoadService>();
            return true;
        }
    }
}