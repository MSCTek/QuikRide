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

    // GenderTypeTranslation
    [System.CodeDom.Compiler.GeneratedCode("EF.Reverse.POCO.Generator", "2.33.0.0")]
    public partial class GenderTypeTranslationConfiguration : System.Data.Entity.ModelConfiguration.EntityTypeConfiguration<GenderTypeTranslation>
    {
        public GenderTypeTranslationConfiguration()
            : this("dbo")
        {
        }

        public GenderTypeTranslationConfiguration(string schema)
        {
            ToTable("GenderTypeTranslation", schema);
            HasKey(x => x.GenderTypeTranslationId);

            Property(x => x.GenderTypeTranslationId).HasColumnName(@"GenderTypeTranslationId").HasColumnType("int").IsRequired().HasDatabaseGeneratedOption(System.ComponentModel.DataAnnotations.Schema.DatabaseGeneratedOption.Identity);
            Property(x => x.GenderTypeId).HasColumnName(@"GenderTypeId").HasColumnType("int").IsRequired();
            Property(x => x.LanguageTypeId).HasColumnName(@"LanguageTypeId").HasColumnType("int").IsRequired();
            Property(x => x.Value).HasColumnName(@"Value").HasColumnType("nvarchar").IsRequired().HasMaxLength(4000);
            Property(x => x.DisplayPriority).HasColumnName(@"DisplayPriority").HasColumnType("int").IsRequired();
            Property(x => x.Description).HasColumnName(@"Description").HasColumnType("nvarchar").IsOptional().HasMaxLength(1024);
            Property(x => x.DataVersion).HasColumnName(@"DataVersion").HasColumnType("int").IsRequired();
            Property(x => x.CreatedUtcDate).HasColumnName(@"CreatedUtcDate").HasColumnType("datetime2").IsRequired();
            Property(x => x.CreatedBy).HasColumnName(@"CreatedBy").HasColumnType("nvarchar").IsRequired().HasMaxLength(200);
            Property(x => x.ModifiedUtcDate).HasColumnName(@"ModifiedUtcDate").HasColumnType("datetime2").IsRequired();
            Property(x => x.ModifiedBy).HasColumnName(@"ModifiedBy").HasColumnType("nvarchar").IsRequired().HasMaxLength(200);
            Property(x => x.IsDeleted).HasColumnName(@"IsDeleted").HasColumnType("bit").IsRequired();

            // Foreign keys
            HasRequired(a => a.GenderType).WithMany(b => b.GenderTypeTranslations).HasForeignKey(c => c.GenderTypeId); // FK_GenderTypeTranslation_GenderType
            HasRequired(a => a.LanguageType).WithMany(b => b.GenderTypeTranslations).HasForeignKey(c => c.LanguageTypeId).WillCascadeOnDelete(false); // FK_GenderTypeTranslation_LanguageType
            InitializePartial();
        }
        partial void InitializePartial();
    }

}
// </auto-generated>