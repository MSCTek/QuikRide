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

    // Barcode
    [System.CodeDom.Compiler.GeneratedCode("EF.Reverse.POCO.Generator", "2.33.0.0")]
    public partial class BarcodeConfiguration : System.Data.Entity.ModelConfiguration.EntityTypeConfiguration<Barcode>
    {
        public BarcodeConfiguration()
            : this("dbo")
        {
        }

        public BarcodeConfiguration(string schema)
        {
            ToTable("Barcode", schema);
            HasKey(x => x.BarcodeId);

            Property(x => x.BarcodeId).HasColumnName(@"BarcodeId").HasColumnType("uniqueidentifier").IsRequired().HasDatabaseGeneratedOption(System.ComponentModel.DataAnnotations.Schema.DatabaseGeneratedOption.None);
            Property(x => x.BarcodeTypeId).HasColumnName(@"BarcodeTypeId").HasColumnType("int").IsRequired();
            Property(x => x.DataJson).HasColumnName(@"DataJson").HasColumnType("nvarchar").IsRequired().HasMaxLength(4000);
            Property(x => x.DataVersion).HasColumnName(@"DataVersion").HasColumnType("int").IsRequired();
            Property(x => x.CreatedUtcDate).HasColumnName(@"CreatedUtcDate").HasColumnType("datetime2").IsRequired();
            Property(x => x.CreatedBy).HasColumnName(@"CreatedBy").HasColumnType("nvarchar").IsRequired().HasMaxLength(200);
            Property(x => x.ModifiedUtcDate).HasColumnName(@"ModifiedUtcDate").HasColumnType("datetime2").IsRequired();
            Property(x => x.ModifiedBy).HasColumnName(@"ModifiedBy").HasColumnType("nvarchar").IsRequired().HasMaxLength(200);
            Property(x => x.IsDeleted).HasColumnName(@"IsDeleted").HasColumnType("bit").IsRequired();

            // Foreign keys
            HasRequired(a => a.BarcodeType).WithMany(b => b.Barcodes).HasForeignKey(c => c.BarcodeTypeId).WillCascadeOnDelete(false); // FK_Barcode_BarcodeType
            InitializePartial();
        }
        partial void InitializePartial();
    }

}
// </auto-generated>
