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

    // VehicleType
    [System.CodeDom.Compiler.GeneratedCode("EF.Reverse.POCO.Generator", "2.33.0.0")]
    public partial class VehicleTypeConfiguration : System.Data.Entity.ModelConfiguration.EntityTypeConfiguration<VehicleType>
    {
        public VehicleTypeConfiguration()
            : this("dbo")
        {
        }

        public VehicleTypeConfiguration(string schema)
        {
            ToTable("VehicleType", schema);
            HasKey(x => x.VehicleTypeId);

            Property(x => x.VehicleTypeId).HasColumnName(@"VehicleTypeId").HasColumnType("int").IsRequired().HasDatabaseGeneratedOption(System.ComponentModel.DataAnnotations.Schema.DatabaseGeneratedOption.None);
            Property(x => x.Code).HasColumnName(@"Code").HasColumnType("varchar").IsRequired().IsUnicode(false).HasMaxLength(50);
            Property(x => x.DisplayText).HasColumnName(@"DisplayText").HasColumnType("nvarchar").IsRequired().HasMaxLength(128);
            Property(x => x.DisplayPriority).HasColumnName(@"DisplayPriority").HasColumnType("int").IsRequired();
            Property(x => x.Description).HasColumnName(@"Description").HasColumnType("nvarchar").IsOptional().HasMaxLength(1024);
            Property(x => x.Capacity).HasColumnName(@"Capacity").HasColumnType("int").IsOptional();
            Property(x => x.LengthInFeetMin).HasColumnName(@"LengthInFeetMin").HasColumnType("float").IsOptional();
            Property(x => x.LengthInFeetMax).HasColumnName(@"LengthInFeetMax").HasColumnType("float").IsOptional();
            Property(x => x.LengthWithBumpers).HasColumnName(@"LengthWithBumpers").HasColumnType("float").IsOptional();
            Property(x => x.WidthInFeet).HasColumnName(@"WidthInFeet").HasColumnType("float").IsOptional();
            Property(x => x.WidthWithMirrorsInFeet).HasColumnName(@"WidthWithMirrorsInFeet").HasColumnType("float").IsOptional();
            Property(x => x.HeightInFeet).HasColumnName(@"HeightInFeet").HasColumnType("float").IsOptional();
            Property(x => x.WheelbaseInFeet).HasColumnName(@"WheelbaseInFeet").HasColumnType("float").IsOptional();
            Property(x => x.FrontOverhangInFeet).HasColumnName(@"FrontOverhangInFeet").HasColumnType("float").IsOptional();
            Property(x => x.RearOverhangInFeet).HasColumnName(@"RearOverhangInFeet").HasColumnType("float").IsOptional();
            Property(x => x.GroundClearanceInFeet).HasColumnName(@"GroundClearanceInFeet").HasColumnType("float").IsOptional();
            Property(x => x.DataVersion).HasColumnName(@"DataVersion").HasColumnType("int").IsRequired();
            Property(x => x.CreatedUtcDate).HasColumnName(@"CreatedUtcDate").HasColumnType("datetime2").IsRequired();
            Property(x => x.CreatedBy).HasColumnName(@"CreatedBy").HasColumnType("nvarchar").IsRequired().HasMaxLength(200);
            Property(x => x.ModifiedUtcDate).HasColumnName(@"ModifiedUtcDate").HasColumnType("datetime2").IsRequired();
            Property(x => x.ModifiedBy).HasColumnName(@"ModifiedBy").HasColumnType("nvarchar").IsRequired().HasMaxLength(200);
            Property(x => x.IsDeleted).HasColumnName(@"IsDeleted").HasColumnType("bit").IsRequired();
            InitializePartial();
        }
        partial void InitializePartial();
    }

}
// </auto-generated>
