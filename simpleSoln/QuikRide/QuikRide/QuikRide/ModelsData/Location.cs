using SQLite;

namespace QuikRide.ModelsData
{
    [Table("Location")]
    public partial class Location
    {
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string City { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime CreatedUtcDate { get; set; }
        public bool IsDeleted { get; set; }
        public double? Latitude { get; set; }

        [PrimaryKey]
        public System.Guid LocationId { get; set; }

        public double? Longitude { get; set; }
        public string ModifiedBy { get; set; }
        public System.DateTime ModifiedUtcDate { get; set; }
        public string Name { get; set; }
        public string PostalCode { get; set; }
        public string State { get; set; }
    }
}