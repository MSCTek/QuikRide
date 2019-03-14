using Microsoft.AppCenter.Crashes;
using QuikRide.Interfaces;
using QuikRide.ModelsData;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace QuikRide.Services
{
    public class SampleDataLoadService : IDataLoadService
    {
        private IDatabase _db;

        public SampleDataLoadService(IDatabase database)
        {
            _db = database;
        }

        public async Task<bool> HeartbeatCheck()
        {
            //we always return true for sample data
            return true;
        }

        public async Task<int> LoadLocations()
        {
            try
            {
                //if the table has records in it, drop and create a new one.
                if (await _db.GetAsyncConnection().Table<Location>().CountAsync() > 0)
                {
                    await _db.GetAsyncConnection().DropTableAsync<Location>();
                    await Task.Delay(500);
                    await _db.GetAsyncConnection().CreateTableAsync<Location>();
                    await Task.Delay(500);
                }

                var locations = new List<Location>()
                {
                        SampleDataModels.SampleLocation.SampleArtInstituteChicago,
                        SampleDataModels.SampleLocation.SampleFabyanVillaMuseum,
                        SampleDataModels.SampleLocation.SampleFoxBuild
                };

                return await _db.GetAsyncConnection().InsertAllAsync(locations);
            }
            catch (Exception ex)
            {
                Crashes.TrackError(ex);
                return 0;
            }
        }

        public async Task<int> LoadReservationRequests()
        {
            try
            {
                //if the table has records in it, drop and create a new one.
                if (await _db.GetAsyncConnection().Table<ReservationRequest>().CountAsync() > 0)
                {
                    await _db.GetAsyncConnection().DropTableAsync<ReservationRequest>();
                    await Task.Delay(500);
                    await _db.GetAsyncConnection().CreateTableAsync<ReservationRequest>();
                    await Task.Delay(500);
                }

                var reservationRequests = new List<ReservationRequest>()
                {
                        SampleDataModels.SampleReservationRequest.SampleFabyanToArtInstitute
                };

                return await _db.GetAsyncConnection().InsertAllAsync(reservationRequests);
            }
            catch (Exception ex)
            {
                Crashes.TrackError(ex);
                return 0;
            }
        }
    }
}