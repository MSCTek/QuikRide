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

    // ReservationRequestOption
    [System.CodeDom.Compiler.GeneratedCode("EF.Reverse.POCO.Generator", "2.33.0.0")]
    public partial class ReservationRequestOption
    {
        public int ReservationRequestOptionId { get; set; } // ReservationRequestOptionId (Primary key)
        public System.Guid ReservationRequestId { get; set; } // ReservationRequestId
        public System.DateTime SuggestedPickupStart { get; set; } // SuggestedPickupStart
        public System.DateTime SuggestedPickupEnd { get; set; } // SuggestedPickupEnd
        public System.DateTime EstimatedArrivalStart { get; set; } // EstimatedArrivalStart
        public System.DateTime EstimatedArrivalEnd { get; set; } // EstimatedArrivalEnd
        public int Score { get; set; } // Score
        public int DataVersion { get; set; } // DataVersion
        public System.DateTime CreatedUtcDate { get; set; } // CreatedUtcDate
        public string CreatedBy { get; set; } // CreatedBy (length: 200)
        public System.DateTime ModifiedUtcDate { get; set; } // ModifiedUtcDate
        public string ModifiedBy { get; set; } // ModifiedBy (length: 200)
        public bool IsDeleted { get; set; } // IsDeleted

        // Reverse navigation

        /// <summary>
        /// Child Reservations where [Reservation].[ReservationRequestOptionId] point to this entity (FK_Reservation_ReservationRequestOption)
        /// </summary>
        public System.Collections.Generic.ICollection<Reservation> Reservations { get; set; } // Reservation.FK_Reservation_ReservationRequestOption

        public ReservationRequestOption()
        {
            IsDeleted = false;
            Reservations = new System.Collections.Generic.List<Reservation>();
            InitializePartial();
        }

        partial void InitializePartial();
    }

}
// </auto-generated>
