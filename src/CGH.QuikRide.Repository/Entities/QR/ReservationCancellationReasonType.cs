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

    // ReservationCancellationReasonType
    [System.CodeDom.Compiler.GeneratedCode("EF.Reverse.POCO.Generator", "2.33.0.0")]
    public partial class ReservationCancellationReasonType
    {
        public int ReservationCancellationReasonTypeId { get; set; } // ReservationCancellationReasonTypeId (Primary key)
        public string Code { get; set; } // Code (length: 50)
        public int DataVersion { get; set; } // DataVersion
        public System.DateTime CreatedUtcDate { get; set; } // CreatedUtcDate
        public string CreatedBy { get; set; } // CreatedBy (length: 200)
        public System.DateTime ModifiedUtcDate { get; set; } // ModifiedUtcDate
        public string ModifiedBy { get; set; } // ModifiedBy (length: 200)
        public bool IsDeleted { get; set; } // IsDeleted

        // Reverse navigation

        /// <summary>
        /// Child Reservations where [Reservation].[ReservationCancellationReasonId] point to this entity (FK_Reservation_ReservationCancellationReasonType)
        /// </summary>
        public System.Collections.Generic.ICollection<Reservation> Reservations { get; set; } // Reservation.FK_Reservation_ReservationCancellationReasonType
        /// <summary>
        /// Child ReservationCancellationReasonTypeTranslations where [ReservationCancellationReasonTypeTranslation].[ReservationCancellationReasonTypeId] point to this entity (FK_ReservationCancellationReasonTypeTranslation_ReservationCancellationReasonType)
        /// </summary>
        public System.Collections.Generic.ICollection<ReservationCancellationReasonTypeTranslation> ReservationCancellationReasonTypeTranslations { get; set; } // ReservationCancellationReasonTypeTranslation.FK_ReservationCancellationReasonTypeTranslation_ReservationCancellationReasonType

        public ReservationCancellationReasonType()
        {
            DataVersion = 1;
            CreatedUtcDate = System.DateTime.UtcNow;
            ModifiedUtcDate = System.DateTime.UtcNow;
            IsDeleted = false;
            Reservations = new System.Collections.Generic.List<Reservation>();
            ReservationCancellationReasonTypeTranslations = new System.Collections.Generic.List<ReservationCancellationReasonTypeTranslation>();
            InitializePartial();
        }

        partial void InitializePartial();
    }

}
// </auto-generated>
