using GalaSoft.MvvmLight.Command;
using Microsoft.AppCenter.Crashes;
using QuikRide.Interfaces;
using System;
using System.Threading.Tasks;
using Xamarin.Essentials;

namespace QuikRide.ViewModels
{
    public class UserLocationViewModel : CustomViewModelBase
    {
        private string _lastLocation;

        private string _realTimeLocation;

        public UserLocationViewModel(INavigationService navService) : base(navService)
        {
        }

        public string LastLocation
        {
            get { return _lastLocation; }
            set { Set(nameof(LastLocation), ref _lastLocation, value); }
        }

        public string RealTimeLocation
        {
            get { return _realTimeLocation; }
            set { Set(nameof(RealTimeLocation), ref _realTimeLocation, value); }
        }

        public RelayCommand RefreshCommand
        {
            get
            {
                return new RelayCommand(async () =>
                {
                    await Refresh();
                });
            }
        }

        public override async Task Init()
        {
            var locationLast = await Geolocation.GetLastKnownLocationAsync();

            if (locationLast != null)
            {
                LastLocation = $"Latitude: {locationLast.Latitude}, Longitude: {locationLast.Longitude}, Altitude: {locationLast.Altitude}";
            }

            Refresh();
        }

        private async Task Refresh()
        {
            try
            {
                //Option #1
                //This is faster then doing a full query, but can be less accurate.
                var locationLast = await Geolocation.GetLastKnownLocationAsync();

                if (locationLast != null)
                {
                    LastLocation = $"Latitude: {locationLast.Latitude}, Longitude: {locationLast.Longitude}, Altitude: {locationLast.Altitude}";
                }

                //Option #2
                //This takes a little longer, but queries the real-time location of the user.
                var request = new GeolocationRequest(GeolocationAccuracy.Medium);
                var locationRealtime = await Geolocation.GetLocationAsync(request);

                if (locationRealtime != null)
                {
                    RealTimeLocation = $"Latitude: {locationRealtime.Latitude}, Longitude: {locationRealtime.Longitude}, Altitude: {locationRealtime.Altitude}";
                }
            }
            catch (FeatureNotSupportedException fnsEx)
            {
                // Handle not supported on device exception
                Crashes.TrackError(fnsEx);
            }
            catch (FeatureNotEnabledException fneEx)
            {
                // Handle not enabled on device exception
                Crashes.TrackError(fneEx);
            }
            catch (PermissionException pEx)
            {
                // Handle permission exception
                Crashes.TrackError(pEx);
            }
            catch (Exception ex)
            {
                // Unable to get location
                Crashes.TrackError(ex);
            }
        }
    }
}