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

    // GenderType
    [System.CodeDom.Compiler.GeneratedCode("EF.Reverse.POCO.Generator", "2.33.0.0")]
    public partial class GenderType
    {
        public int GenderTypeId { get; set; } // GenderTypeId (Primary key)
        public string Code { get; set; } // Code (length: 50)
        public int DataVersion { get; set; } // DataVersion
        public System.DateTime CreatedUtcDate { get; set; } // CreatedUtcDate
        public string CreatedBy { get; set; } // CreatedBy (length: 200)
        public System.DateTime ModifiedUtcDate { get; set; } // ModifiedUtcDate
        public string ModifiedBy { get; set; } // ModifiedBy (length: 200)
        public bool IsDeleted { get; set; } // IsDeleted

        // Reverse navigation

        /// <summary>
        /// Child GenderTypeTranslations where [GenderTypeTranslation].[GenderTypeId] point to this entity (FK_GenderTypeTranslation_GenderType)
        /// </summary>
        public System.Collections.Generic.ICollection<GenderTypeTranslation> GenderTypeTranslations { get; set; } // GenderTypeTranslation.FK_GenderTypeTranslation_GenderType
        /// <summary>
        /// Child Users where [Users].[GenderTypeId] point to this entity (FK_Users_GenderType_GenderTypeId)
        /// </summary>
        public System.Collections.Generic.ICollection<User> Users { get; set; } // Users.FK_Users_GenderType_GenderTypeId

        public GenderType()
        {
            DataVersion = 1;
            CreatedUtcDate = System.DateTime.UtcNow;
            ModifiedUtcDate = System.DateTime.UtcNow;
            IsDeleted = false;
            GenderTypeTranslations = new System.Collections.Generic.List<GenderTypeTranslation>();
            Users = new System.Collections.Generic.List<User>();
            InitializePartial();
        }

        partial void InitializePartial();
    }

}
// </auto-generated>