using GalaSoft.MvvmLight;
using System;

namespace QuikRide.ModelsObj
{
    public partial class Location : ObservableObject
    {
        private string _addressLine1;
        private string _addressLine2;
        private string _city;
        private string _createdBy;
        private DateTime _createdDate;
        private float _latitude;
        private Guid _locationId;
        private float _longitude;
        private string _modifiedBy;
        private DateTime _modifiedDate;
        private string _name;
        private string _postalCode;
        private string _state;

        public string AddressLine1
        {
            get { return _addressLine1; }
            set { Set(() => AddressLine1, ref _addressLine1, value); }
        }

        public string AddressLine2
        {
            get { return _addressLine2; }
            set { Set(() => AddressLine2, ref _addressLine2, value); }
        }

        public string City
        {
            get { return _city; }
            set { Set(() => City, ref _city, value); }
        }

        public string CreatedBy
        {
            get { return _createdBy; }
            set { Set(() => CreatedBy, ref _createdBy, value); }
        }

        public DateTime CreatedDate
        {
            get { return _createdDate; }
            set { Set(() => CreatedDate, ref _createdDate, value); }
        }

        public float Latitude
        {
            get { return _latitude; }
            set { Set(() => Latitude, ref _latitude, value); }
        }

        public Guid LocationId
        {
            get { return _locationId; }
            set { Set(nameof(LocationId), ref _locationId, value); }
        }

        public float Longitude
        {
            get { return _longitude; }
            set { Set(() => Longitude, ref _longitude, value); }
        }

        public string ModifiedBy
        {
            get { return _modifiedBy; }
            set { Set(() => ModifiedBy, ref _modifiedBy, value); }
        }

        public DateTime ModifiedDate
        {
            get { return _modifiedDate; }
            set { Set(() => ModifiedDate, ref _modifiedDate, value); }
        }

        public string Name
        {
            get { return _name; }
            set { Set(() => Name, ref _name, value); }
        }

        public string PostalCode
        {
            get { return _postalCode; }
            set { Set(() => PostalCode, ref _postalCode, value); }
        }

        public string State
        {
            get { return _state; }
            set { Set(() => State, ref _state, value); }
        }
    }
}