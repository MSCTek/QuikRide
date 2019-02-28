using GalaSoft.MvvmLight.Command;
using QuikRide.Interfaces;
using QuikRide.ModelsObj;
using System;
using System.Collections.ObjectModel;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace QuikRide.ViewModels
{
    public class MyReservationRequestsViewModel : CustomViewModelBase
    {
        private ObservableCollection<ReservationRequest> _myRequests;

        public MyReservationRequestsViewModel(INavigationService navService) : base(navService)
        {
            MyRequests = new ObservableCollection<ReservationRequest>();
        }

        public RelayCommand<Guid> CancelCommand
        {
            get
            {
                return new RelayCommand<Guid>(async (id) =>
                {
                    //TODO: rts cancel
                    await Application.Current.MainPage.DisplayAlert("TODO",
                        $"Write code to cancel this reservation: {id}!", "OK");
                });
            }
        }

        public RelayCommand MapCommand
        {
            get
            {
                return new RelayCommand(() =>
                {
                });
            }
        }

        public ObservableCollection<ReservationRequest> MyRequests
        {
            get { return _myRequests; }
            set { Set(() => MyRequests, ref _myRequests, value); }
        }

        public override async Task Init()
        {
            //we usually do async calls here to get data here, but sample data is call synchronously
            MyRequests = new ObservableCollection<ReservationRequest>()
            {
                SampleData.SampleReservationRequest.Sample1,
                SampleData.SampleReservationRequest.Sample2
            };
        }
    }
}