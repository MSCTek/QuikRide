using System;

using Xamarin.Forms;

namespace QuikRide.Views
{
    public class AboutPageNoXAML : ContentPage
    {
        public AboutPageNoXAML()
        {
            var grid = new Grid();

            var gridRow0 = new RowDefinition();
            gridRow0.Height = GridLength.Auto;
            grid.RowDefinitions.Add(gridRow0);
            var image = new Image();
            image.Source = new UriImageSource
            {
                Uri = new Uri("https://github.com/MSCTek/QuikRide/blob/master/assets/QuikRide.PNG?raw=true"),
                CachingEnabled = true,
                CacheValidity = new TimeSpan(30, 0, 0, 0)  //30 days
            };
            grid.Children.Add(image, 0, 0);

            var gridRow1 = new RowDefinition();
            gridRow1.Height = GridLength.Star;
            grid.RowDefinitions.Add(gridRow1);

            var scrollView = new ScrollView();
            var stackLayout = new StackLayout(); //default is vertical

            stackLayout.Padding = new Thickness(16, 10, 16, 40);
            stackLayout.Spacing = 10;

            var labelFirst = new Label();
            labelFirst.Text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur volutpat massa vitae turpis vestibulum, id ultrices ante suscipit. Morbi feugiat massa ut eros imperdiet luctus. Sed dapibus, magna sed varius accumsan, sem nibh elementum massa, vitae sodales libero erat eget purus. Maecenas nisl nibh, commodo quis tortor eu, semper facilisis erat. Maecenas at auctor risus, at pulvinar sem. Vestibulum elementum, purus venenatis laoreet ornare, magna metus condimentum quam, at varius lorem elit nec nisl. Donec nec rhoncus ipsum, a imperdiet erat.";
            stackLayout.Children.Add(labelFirst);

            var labelSecond = new Label();
            labelSecond.Text = "Morbi a neque id diam pellentesque dictum vel eu justo. Fusce quis nisl sit amet turpis euismod pulvinar. Aliquam erat volutpat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse id nisi varius velit posuere egestas sit amet in felis. Sed facilisis nulla libero, ornare pharetra sapien tincidunt at. Pellentesque pellentesque leo id suscipit consectetur. Aliquam sed enim sit amet nulla facilisis semper. Fusce porttitor tristique ex, non egestas dolor euismod et. Sed arcu arcu, venenatis ac congue posuere, laoreet et urna. Nulla tristique ante sed enim laoreet, sed blandit nulla ullamcorper. Nunc elementum tincidunt turpis. Pellentesque laoreet ipsum quis venenatis maximus. Pellentesque et ligula sed sem porttitor scelerisque.";
            stackLayout.Children.Add(labelSecond);

            var labelThird = new Label();
            labelThird.Text = "Contact Us";
            stackLayout.Children.Add(labelThird);

            var labelFourth = new Label();
            labelFourth.Text = "QuikRide Incorporated";
            stackLayout.Children.Add(labelFourth);

            var labelFifth = new Label();
            labelFifth.Text = "123 Elm Street Suite 123";
            stackLayout.Children.Add(labelFifth);

            var labelSixth = new Label();
            labelSixth.Text = "AnyTown, State  12345";
            stackLayout.Children.Add(labelSixth);

            scrollView.Content = stackLayout;

            grid.Children.Add(scrollView, 0, 1);

            Content = grid;
            Title = "About QuikRide";
        }
    }
}