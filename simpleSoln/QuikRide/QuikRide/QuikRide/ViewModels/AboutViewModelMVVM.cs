using GalaSoft.MvvmLight.Command;
using System;
using System.Collections.Generic;
using Xamarin.Essentials;
using Xamarin.Forms;

namespace QuikRide.ViewModels
{
    public class AboutViewModelMVVM : BaseViewModel
    {
        public AboutViewModelMVVM()
        {
        }

        public RelayCommand EmailCommand
        {
            get
            {
                return new RelayCommand(async () =>
                {
                    await Helpers.Helpers.SendEmail("Question about QuikTrip", "I was wondering...", new List<string>() { "info@quikride.com" });
                });
            }
        }

        public RelayCommand FacebookCommand
        {
            get
            {
                return new RelayCommand(() =>
                {
                    Device.OpenUri(new Uri("https://facebook.com"));
                });
            }
        }

        public RelayCommand PhoneCommand
        {
            get
            {
                return new RelayCommand(() =>
                {
                    try
                    {
                        PhoneDialer.Open("16303449385");
                    }
                    catch (FeatureNotSupportedException)
                    {
                        Application.Current.MainPage.DisplayAlert("Error", "Sorry, the phone dialer is not supported on this device.", "OK");
                        /*Analytics.TrackEvent("Phone Call Attempted", new Dictionary<string, string> {
                        { "Where", "AboutUsPage-PhoneNumber-Tap" },
                        { "Error", "Phone dialer was not supported on device."}
                        });*/
                    }
                    catch (Exception ex)
                    {
                        Application.Current.MainPage.DisplayAlert("Error", ex.Message, "OK");
                        /*Crashes.TrackError(ex, new Dictionary<string, string>{
                            { "Where", "AboutUsPage-PhoneNumber-Tap" },
                            { "Error", ex.Message }
                        });*/
                    }
                });
            }
        }

        public RelayCommand SlackCommand
        {
            get
            {
                return new RelayCommand(() =>
                {
                    Application.Current.MainPage.DisplayAlert("Wait!", "You must be a member to join our Slack Channel!", "OK");
                });
            }
        }

        public RelayCommand TwitterCommand
        {
            get
            {
                return new RelayCommand(() =>
                {
                    Device.OpenUri(new Uri("https://twitter.com"));
                });
            }
        }
    }
}