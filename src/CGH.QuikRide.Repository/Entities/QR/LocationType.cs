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

    // LocationType
    [System.CodeDom.Compiler.GeneratedCode("EF.Reverse.POCO.Generator", "2.33.0.0")]
    public partial class LocationType
    {
        public int LocationTypeId { get; set; } // LocationTypeId (Primary key)
        public string Code { get; set; } // Code (length: 50)
        public int DataVersion { get; set; } // DataVersion
        public System.DateTime CreatedUtcDate { get; set; } // CreatedUtcDate
        public string CreatedBy { get; set; } // CreatedBy (length: 200)
        public System.DateTime ModifiedUtcDate { get; set; } // ModifiedUtcDate
        public string ModifiedBy { get; set; } // ModifiedBy (length: 200)
        public bool IsDeleted { get; set; } // IsDeleted

        // Reverse navigation

        /// <summary>
        /// Child Locations where [Location].[LocationTypeId] point to this entity (FK_Location_LocationType)
        /// </summary>
        public System.Collections.Generic.ICollection<Location> Locations { get; set; } // Location.FK_Location_LocationType
        /// <summary>
        /// Child LocationTypeTranslations where [LocationTypeTranslation].[LocationTypeId] point to this entity (FK_LocationTypeTranslation_LocationType)
        /// </summary>
        public System.Collections.Generic.ICollection<LocationTypeTranslation> LocationTypeTranslations { get; set; } // LocationTypeTranslation.FK_LocationTypeTranslation_LocationType

        public LocationType()
        {
            DataVersion = 1;
            CreatedUtcDate = System.DateTime.UtcNow;
            ModifiedUtcDate = System.DateTime.UtcNow;
            IsDeleted = false;
            Locations = new System.Collections.Generic.List<Location>();
            LocationTypeTranslations = new System.Collections.Generic.List<LocationTypeTranslation>();
            InitializePartial();
        }

        partial void InitializePartial();
    }

}
// </auto-generated>
