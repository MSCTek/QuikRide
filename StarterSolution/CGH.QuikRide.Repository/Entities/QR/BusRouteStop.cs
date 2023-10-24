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

    // BusRouteStop
    [System.CodeDom.Compiler.GeneratedCode("EF.Reverse.POCO.Generator", "2.33.0.0")]
    public partial class BusRouteStop
    {
        public int BusRouteStopId { get; set; } // BusRouteStopId (Primary key)
        public int BusRouteId { get; set; } // BusRouteId
        public System.Guid LocationId { get; set; } // LocationId
        public bool IsMajorStop { get; set; } // IsMajorStop
        public bool IsPublishedStop { get; set; } // IsPublishedStop
        public int DataVersion { get; set; } // DataVersion
        public System.DateTime CreatedUtcDate { get; set; } // CreatedUtcDate
        public string CreatedBy { get; set; } // CreatedBy (length: 200)
        public System.DateTime ModifiedUtcDate { get; set; } // ModifiedUtcDate
        public string ModifiedBy { get; set; } // ModifiedBy (length: 200)
        public bool IsDeleted { get; set; } // IsDeleted

        // Foreign keys

        /// <summary>
        /// Parent BusRoute pointed by [BusRouteStop].([BusRouteId]) (FK_BusRouteStop_BusRoute)
        /// </summary>
        public BusRoute BusRoute { get; set; } // FK_BusRouteStop_BusRoute

        /// <summary>
        /// Parent Location pointed by [BusRouteStop].([LocationId]) (FK_BusRouteStop_Location)
        /// </summary>
        public Location Location { get; set; } // FK_BusRouteStop_Location

        public BusRouteStop()
        {
            DataVersion = 1;
            CreatedUtcDate = System.DateTime.UtcNow;
            ModifiedUtcDate = System.DateTime.UtcNow;
            IsDeleted = false;
            InitializePartial();
        }

        partial void InitializePartial();
    }

}
// </auto-generated>