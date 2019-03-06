using SQLite;

namespace QuikRide.ModelsData
{
    [Table("ReservationRequest")]
    public partial class ReservationRequest
    {
        public string CreatedBy { get; set; }
        public System.DateTime CreatedUtcDate { get; set; }
        public int DataVersion { get; set; }
        public System.Guid DestinationLocationId { get; set; }
        public bool IsDeleted { get; set; }
        public string ModifiedBy { get; set; }
        public System.DateTime ModifiedUtcDate { get; set; }
        public System.Guid PickupLocationId { get; set; }
        public System.DateTime? RequestedArrivalEnd { get; set; }
        public System.DateTime? RequestedArrivalStart { get; set; }
        public System.DateTime? RequestedPickupEnd { get; set; }
        public System.DateTime? RequestedPickupStart { get; set; }
        public System.Guid? ReservationId { get; set; }
        public int? ReservationRequestCancellationReasonTypeId { get; set; }

        [PrimaryKey]
        public System.Guid ReservationRequestId { get; set; }

        public int ReservationRequestStatusTypeId { get; set; }
    }
}