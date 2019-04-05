using GalaSoft.MvvmLight.Command;
using QuikRide.Helpers.Geofencing;
using QuikRide.Interfaces;
using QuikRide.ModelData;
using System.Collections.Generic;
using System.Threading.Tasks;
using Xamarin.Essentials;

namespace QuikRide.ViewModels
{
    public class GeofencingViewModel : CustomViewModelBase
    {
        private List<GeofenceRegion> _myMonitoredRegions;

        private bool isRunning;

        public GeofencingViewModel(INavigationService navService, IDataLoadService dataLoadService, IDataRetrievalService dataRetrievalService) : base(navService, dataLoadService, dataRetrievalService)
        {
            MyMonitoredRegions = new List<GeofenceRegion>();
        }

        public RelayCommand AddCurrentLocationGeofenceCommand
        {
            get
            {
                return new RelayCommand(() =>
                {
                    if (location != null && location.Latitude != 0D && location.Longitude != 0D)
                    {
                        MyMonitoredRegions.Add(new GeofenceRegion(
                            "CurrentLocation", // identifier - must be unique per registered geofence
                            new Position(location.Latitude, location.Longitude), // center point
                            Distance.FromMeters(50) // radius of fence
                        ));
                    }
                });
            }
        }

        public RelayCommand AddFoxBuildGeofenceCommand
        {
            get
            {
                return new RelayCommand(() =>
                {
                    MyMonitoredRegions.Add(new GeofenceRegion(
                        "Fox.Build", // identifier - must be unique per registered geofence
                        new Position(41.9136805, -88.3127193), // center point
                        Distance.FromMeters(50) // radius of fence
                    ));
                });
            }
        }

        public RelayCommand AddTasteOfHimalayasGeofenceCommand
        {
            get
            {
                return new RelayCommand(() =>
                {
                    MyMonitoredRegions.Add(new GeofenceRegion(
                        "TasteOfHimalayas", // identifier - must be unique per registered geofence
                        new Position(41.9144739, -88.3168716), // center point
                        Distance.FromMeters(50) // radius of fence
                    ));
                });
            }
        }

        public List<GeofenceRegion> MyMonitoredRegions
        {
            get { return _myMonitoredRegions; }
            set { Set<List<GeofenceRegion>>(() => MyMonitoredRegions, ref _myMonitoredRegions, value); }
        }

        public RelayCommand RemoveAllGeofencesCommand
        {
            get
            {
                return new RelayCommand(() =>
                {
                    MyMonitoredRegions.Clear();
                });
            }
        }

        private Position currentLocation { get; set; }

        public async void CheckGeofenceStatus()
        {
            if (!isRunning)
            {
                isRunning = true;
                await UpdateLocationAsync();

                foreach (var m in MyMonitoredRegions)
                {
                    RecordStatus(
                        m,
                        m.IsPositionInside(currentLocation) ? GeofenceStatus.Entered : GeofenceStatus.Exited
                    );
                }

                isRunning = false;
            }
        }

        public override async Task Init()
        {
            await UpdateLocationAsync();
        }

        public async void RecordStatus(GeofenceRegion region, GeofenceStatus status)
        {
            var activity = new GeofenceActivity()
            {
                ActivityUtcDateTime = System.DateTime.UtcNow,
                Region = region.Identifier,
                Status = status.ToString(),
                GeofenceActivityId = System.Guid.NewGuid()
            };

            activity.Longitude = currentLocation.Longitude;
            activity.Latitude = currentLocation.Latitude;

            await DataRetrievalService.WriteGeofencingActivityRecord(activity);
        }

        private async Task UpdateLocationAsync()
        {
            //use this opportunity to grab the long/lat.
            var request = new GeolocationRequest(GeolocationAccuracy.Medium);
            var locationRealtime = await Geolocation.GetLocationAsync(request);
            if (locationRealtime == null)
            {
                var locationLastKnown = await Geolocation.GetLastKnownLocationAsync();
                currentLocation = new Position(locationLastKnown.Latitude, locationLastKnown.Longitude);
            }
            else
            {
                currentLocation = new Position(locationRealtime.Latitude, locationRealtime.Longitude);
            }
        }
    }
}