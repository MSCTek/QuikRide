using GalaSoft.MvvmLight;
using System;

namespace QuikRide.ModelsObj
{
    public class Location : ObservableObject
    {
        private string _createdBy;
        private DateTime _createdDate;
        private Guid _locationId;
        private string _modifiedBy;
        private DateTime _modifiedDate;

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

        public Guid LocationId
        {
            get { return _locationId; }
            set { Set(nameof(LocationId), ref _locationId, value); }
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
    }
}