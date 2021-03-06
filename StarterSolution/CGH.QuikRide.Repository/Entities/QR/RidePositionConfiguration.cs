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

    // RidePosition
    [System.CodeDom.Compiler.GeneratedCode("EF.Reverse.POCO.Generator", "2.33.0.0")]
    public partial class RidePositionConfiguration : System.Data.Entity.ModelConfiguration.EntityTypeConfiguration<RidePosition>
    {
        public RidePositionConfiguration()
            : this("dbo")
        {
        }

        public RidePositionConfiguration(string schema)
        {
            ToTable("RidePosition", schema);
            HasKey(x => x.RidePositionId);

            Property(x => x.RidePositionId).HasColumnName(@"RidePositionId").HasColumnType("uniqueidentifier").IsRequired().HasDatabaseGeneratedOption(System.ComponentModel.DataAnnotations.Schema.DatabaseGeneratedOption.None);
            Property(x => x.RideId).HasColumnName(@"RideId").HasColumnType("uniqueidentifier").IsRequired();
            Property(x => x.Latitude).HasColumnName(@"Latitude").HasColumnType("numeric").IsRequired().HasPrecision(18,10);
            Property(x => x.Longitude).HasColumnName(@"Longitude").HasColumnType("numeric").IsRequired().HasPrecision(18,10);
            Property(x => x.Ts).HasColumnName(@"TS").HasColumnType("datetime2").IsRequired();
            Property(x => x.DataVersion).HasColumnName(@"DataVersion").HasColumnType("int").IsRequired();
            Property(x => x.CreatedUtcDate).HasColumnName(@"CreatedUtcDate").HasColumnType("datetime2").IsRequired();
            Property(x => x.CreatedBy).HasColumnName(@"CreatedBy").HasColumnType("nvarchar").IsRequired().HasMaxLength(200);
            Property(x => x.ModifiedUtcDate).HasColumnName(@"ModifiedUtcDate").HasColumnType("datetime2").IsRequired();
            Property(x => x.ModifiedBy).HasColumnName(@"ModifiedBy").HasColumnType("nvarchar").IsRequired().HasMaxLength(200);
            Property(x => x.IsDeleted).HasColumnName(@"IsDeleted").HasColumnType("bit").IsRequired();

            // Foreign keys
            HasRequired(a => a.Ride).WithMany(b => b.RidePositions).HasForeignKey(c => c.RideId).WillCascadeOnDelete(false); // FK_RidePosition_Ride
            InitializePartial();
        }
        partial void InitializePartial();
    }

}
// </auto-generated>
