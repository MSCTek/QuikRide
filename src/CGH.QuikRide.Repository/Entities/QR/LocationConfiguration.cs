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
    public partial class LocationConfiguration : System.Data.Entity.ModelConfiguration.EntityTypeConfiguration<Location>
    {
        public LocationConfiguration()
            : this("dbo")
        {
        }

        public LocationConfiguration(string schema)
        {
            ToTable("Location", schema);
            HasKey(x => x.LocationId);

            Property(x => x.LocationId).HasColumnName(@"LocationId").HasColumnType("uniqueidentifier").IsRequired().HasDatabaseGeneratedOption(System.ComponentModel.DataAnnotations.Schema.DatabaseGeneratedOption.None);
            Property(x => x.LocationTypeId).HasColumnName(@"LocationTypeId").HasColumnType("int").IsRequired();
            Property(x => x.Name).HasColumnName(@"Name").HasColumnType("varchar").IsRequired().IsUnicode(false).HasMaxLength(100);
            Property(x => x.Latitude).HasColumnName(@"Latitude").HasColumnType("float").IsOptional();
            Property(x => x.Longitude).HasColumnName(@"Longitude").HasColumnType("float").IsOptional();
            Property(x => x.AddressLine1).HasColumnName(@"AddressLine1").HasColumnType("varchar").IsOptional().IsUnicode(false).HasMaxLength(100);
            Property(x => x.AddressLine2).HasColumnName(@"AddressLine2").HasColumnType("varchar").IsOptional().IsUnicode(false).HasMaxLength(100);
            Property(x => x.City).HasColumnName(@"City").HasColumnType("varchar").IsRequired().IsUnicode(false).HasMaxLength(100);
            Property(x => x.State).HasColumnName(@"State").HasColumnType("varchar").IsRequired().IsUnicode(false).HasMaxLength(100);
            Property(x => x.PostalCode).HasColumnName(@"PostalCode").HasColumnType("varchar").IsRequired().IsUnicode(false).HasMaxLength(100);
            Property(x => x.DataVersion).HasColumnName(@"DataVersion").HasColumnType("int").IsRequired();
            Property(x => x.CreatedUtcDate).HasColumnName(@"CreatedUtcDate").HasColumnType("datetime2").IsRequired();
            Property(x => x.CreatedBy).HasColumnName(@"CreatedBy").HasColumnType("nvarchar").IsRequired().HasMaxLength(200);
            Property(x => x.ModifiedUtcDate).HasColumnName(@"ModifiedUtcDate").HasColumnType("datetime2").IsRequired();
            Property(x => x.ModifiedBy).HasColumnName(@"ModifiedBy").HasColumnType("nvarchar").IsRequired().HasMaxLength(200);
            Property(x => x.IsDeleted).HasColumnName(@"IsDeleted").HasColumnType("bit").IsRequired();

            // Foreign keys
            HasRequired(a => a.LocationType).WithMany(b => b.Locations).HasForeignKey(c => c.LocationTypeId).WillCascadeOnDelete(false); // FK_Location_LocationType
            InitializePartial();
        }
        partial void InitializePartial();
    }

}
// </auto-generated>
