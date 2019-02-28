using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Xamarin.Essentials;
using Xamarin.Forms;

namespace QuikRide.Helpers
{
    public static class Helpers
    {
        public static async Task SendEmail(string subject, string body, List<string> recipients)
        {
            try
            {
                var message = new EmailMessage
                {
                    Subject = subject,
                    Body = body,
                    To = recipients,
                    //Cc = ccRecipients,
                    //Bcc = bccRecipients
                };
                await Email.ComposeAsync(message);
            }
            catch (FeatureNotSupportedException fbsEx)
            {
                // Email is not supported on this device
                Application.Current.MainPage.DisplayAlert("Error", "Sorry, email is not supported on this device.", "OK");
                /*Analytics.TrackError(fbsEx, new Dictionary<string, string> {
                { "Where", "AboutUsPage-Email-Tap" },
                { "Error", "Email was not supported on device."}
                });*/
            }
            catch (Exception ex)
            {
                // Some other exception occurred
                /*Analytics.TrackError(ex, new Dictionary<string, string> {
                { "Where", "AboutUsPage-Email-Tap" },
                { "Error", ex.Message}
                });*/
            }
        }
    }
}