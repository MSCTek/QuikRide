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

    // ReservationStatusType
    [System.CodeDom.Compiler.GeneratedCode("EF.Reverse.POCO.Generator", "2.33.0.0")]
    public partial class ReservationStatusType
    {
        public int ReservationStatusTypeId { get; set; } // ReservationStatusTypeId (Primary key)
        public string Code { get; set; } // Code (length: 50)
        public int DataVersion { get; set; } // DataVersion
        public System.DateTime CreatedUtcDate { get; set; } // CreatedUtcDate
        public string CreatedBy { get; set; } // CreatedBy (length: 200)
        public System.DateTime ModifiedUtcDate { get; set; } // ModifiedUtcDate
        public string ModifiedBy { get; set; } // ModifiedBy (length: 200)
        public bool IsDeleted { get; set; } // IsDeleted

        // Reverse navigation

        /// <summary>
        /// Child ReservationStatusTypeTranslations where [ReservationStatusTypeTranslation].[ReservationStatusTypeId] point to this entity (FK_ReservationStatusTypeTranslation_ReservationStatusType)
        /// </summary>
        public System.Collections.Generic.ICollection<ReservationStatusTypeTranslation> ReservationStatusTypeTranslations { get; set; } // ReservationStatusTypeTranslation.FK_ReservationStatusTypeTranslation_ReservationStatusType

        public ReservationStatusType()
        {
            DataVersion = 1;
            CreatedUtcDate = System.DateTime.UtcNow;
            ModifiedUtcDate = System.DateTime.UtcNow;
            IsDeleted = false;
            ReservationStatusTypeTranslations = new System.Collections.Generic.List<ReservationStatusTypeTranslation>();
            InitializePartial();
        }

        partial void InitializePartial();
    }

}
// </auto-generated>
