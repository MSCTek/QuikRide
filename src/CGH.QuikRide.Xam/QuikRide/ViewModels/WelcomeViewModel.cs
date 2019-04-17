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
        protected INavigationService _navService;

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
                    DisplayMessage = $"Loading Locations...";
                    //Preferences.Set(Config.Preference_LastLocationUpdate, DateTime.UtcNow.ToString());
                    await Task.Delay(500);

                    var numReservationRequests = await _dataLoadService.LoadReservationRequests();
                    DisplayMessage = $"Loading Reservation Requests...";
                    //Preferences.Set(Config.Preference_LastReservationRequestUpdate, DateTime.UtcNow.ToString());
                    await Task.Delay(500);

                    var numVehicles = await _dataLoadService.LoadVehicles();
                    DisplayMessage = $"Loading Vehicles...";
                    await Task.Delay(500);

                    var numVehicleStatusTypes = await _dataLoadService.LoadVehicleStatusTypes();
                    DisplayMessage = $"Loading Vehicles...";
                    await Task.Delay(500);

                    var numVehicleFeatureTypes = await _dataLoadService.LoadVehicleFeatureTypes();
                    DisplayMessage = $"Loading Vehicle Feature Types...";
                    await Task.Delay(500);

                    var numVehicleTypes = await _dataLoadService.LoadVehicleTypes();
                    DisplayMessage = $"Loading Vehicle Data.";
                    await Task.Delay(500);

                    var numVehicleTypeVehicleFeatureTypes = await _dataLoadService.LoadVehicleTypeVehicleFeatureTypes();
                    DisplayMessage = $"Loading Vehicle Data..";
                    await Task.Delay(500);

                    var numVehicleVehicleFeatureTypes = await _dataLoadService.LoadVehicleVehicleFeatureTypes();
                    DisplayMessage = $"Loading Vehicle Data...";
                    await Task.Delay(500);

                    var numFeedbackTypes = await _dataLoadService.LoadFeedbackTypes();
                    var numFeedbackTypeTranslations = await _dataLoadService.LoadFeedbackTypeTranslations();
                    var numLanguageTypes = await _dataLoadService.LoadLanguageTypes();
                    DisplayMessage = $"Loading Type Data...";
                    await Task.Delay(500);

                    //we would probably not do this in real life...
                    var numUsers = await _dataLoadService.LoadUsers();
                    DisplayMessage = $"Loading User Data...";
                    await Task.Delay(500);

                    DisplayMessage = $"All Done - Data Loaded";
                    IsBusy = false;
                    await Task.Delay(500);
                    await _navService.StartNavStack(typeof(HomeViewModel));
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
            _navService = ker.Get<INavigationService>();
            _dataLoadService = ker.Get<IDataLoadService>();
            return true;
        }
    }
}