// <auto-generated>
// ReSharper disable ConvertPropertyToExpressionBody
// ReSharper disable DoNotCallOverridableMethodsInConstructor
// ReSharper disable EmptyNamespace
// ReSharper disable InconsistentNaming
// ReSharper disable PartialMethodWithSinglePart
// ReSharper disable PartialTypeWithSinglePart
// ReSharper disable RedundantNameQualifier
// ReSharper disable RedundantOverridenMember
// ReSharper disable UseNameofExpression
// TargetFrameworkVersion = 4.6
#pragma warning disable 1591    //  Ignore "Missing XML Comment" warning


namespace CGH.QuikRide.Repository.Entities.QR
{

    // Location
    [System.CodeDom.Compiler.GeneratedCode("EF.Reverse.POCO.Generator", "2.33.0.0")]
    public partial class Location
    {
        public System.Guid LocationId { get; set; } // LocationId (Primary key)
        public int LocationTypeId { get; set; } // LocationTypeId
        public string Name { get; set; } // Name (length: 100)
        public double? Latitude { get; set; } // Latitude
        public double? Longitude { get; set; } // Longitude
        public string AddressLine1 { get; set; } // AddressLine1 (length: 100)
        public string AddressLine2 { get; set; } // AddressLine2 (length: 100)
        public string City { get; set; } // City (length: 100)
        public string State { get; set; } // State (length: 100)
        public string PostalCode { get; set; } // PostalCode (length: 100)
        public int DataVersion { get; set; } // DataVersion
        public System.DateTime CreatedUtcDate { get; set; } // CreatedUtcDate
        public string CreatedBy { get; set; } // CreatedBy (length: 200)
        public System.DateTime ModifiedUtcDate { get; set; } // ModifiedUtcDate
        public string ModifiedBy { get; set; } // ModifiedBy (length: 200)
        public bool IsDeleted { get; set; } // IsDeleted

        // Reverse navigation

        /// <summary>
        /// Child BusRouteStops where [BusRouteStop].[LocationId] point to this entity (FK_BusRouteStop_Location)
        /// </summary>
        public System.Collections.Generic.ICollection<BusRouteStop> BusRouteStops { get; set; } // BusRouteStop.FK_BusRouteStop_Location
        /// <summary>
        /// Child Reservations where [Reservation].[PickUpLocationId] point to this entity (FK_Reservation_Location)
        /// </summary>
        public System.Collections.Generic.ICollection<Reservation> Reservations { get; set; } // Reservation.FK_Reservation_Location
        /// <summary>
        /// Child ReservationRequests where [ReservationRequest].[DestinationLocationId] point to this entity (FK_ReservationRequest_DestinationLocation)
        /// </summary>
        public System.Collections.Generic.ICollection<ReservationRequest> DestinationLocation { get; set; } // ReservationRequest.FK_ReservationRequest_DestinationLocation
        /// <summary>
        /// Child ReservationRequests where [ReservationRequest].[PickupLocationId] point to this entity (FK_ReservationRequest_PickupLocation)
        /// </summary>
        public System.Collections.Generic.ICollection<ReservationRequest> PickupLocation { get; set; } // ReservationRequest.FK_ReservationRequest_PickupLocation
        /// <summary>
        /// Child UsersLocations where [Users_Location].[LocationId] point to this entity (FK_Users_Location_Location)
        /// </summary>
        public System.Collections.Generic.ICollection<UsersLocation> UsersLocations { get; set; } // Users_Location.FK_Users_Location_Location

        // Foreign keys

        /// <summary>
        /// Parent LocationType pointed by [Location].([LocationTypeId]) (FK_Location_LocationType)
        /// </summary>
        public LocationType LocationType { get; set; } // FK_Location_LocationType

        public Location()
        {
            DataVersion = 1;
            CreatedUtcDate = System.DateTime.UtcNow;
            ModifiedUtcDate = System.DateTime.UtcNow;
            IsDeleted = false;
            BusRouteStops = new System.Collections.Generic.List<BusRouteStop>();
            Reservations = new System.Collections.Generic.List<Reservation>();
            DestinationLocation = new System.Collections.Generic.List<ReservationRequest>();
            PickupLocation = new System.Collections.Generic.List<ReservationRequest>();
            UsersLocations = new System.Collections.Generic.List<UsersLocation>();
            InitializePartial();
        }

        partial void InitializePartial();
    }

}
// </auto-generated>
