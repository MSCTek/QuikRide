// <auto-generated> - Template:DTO, Version:1.1, Id:58fa7ee2-89f7-41e6-85ed-8d4482653990
namespace CGH.QuikRide.DTO.QR
{
	public partial class VehicleType
	{
		public VehicleType()
		{
			InitializePartial();
		}

		public int VehicleTypeId { get; set; } // Primary key
		public string Code { get; set; }
		public string DisplayText { get; set; }
		public int DisplayPriority { get; set; }
		public string Description { get; set; }
		public int? Capacity { get; set; }
		public double? LengthInFeetMin { get; set; }
		public double? LengthInFeetMax { get; set; }
		public double? LengthWithBumpers { get; set; }
		public double? WidthInFeet { get; set; }
		public double? WidthWithMirrorsInFeet { get; set; }
		public double? HeightInFeet { get; set; }
		public double? WheelbaseInFeet { get; set; }
		public double? FrontOverhangInFeet { get; set; }
		public double? RearOverhangInFeet { get; set; }
		public double? GroundClearanceInFeet { get; set; }
		public int DataVersion { get; set; }
		public System.DateTime CreatedUtcDate { get; set; }
		public string CreatedBy { get; set; }
		public System.DateTime ModifiedUtcDate { get; set; }
		public string ModifiedBy { get; set; }
		public bool IsDeleted { get; set; }
		// public virtual System.Collections.Generic.ICollection<Vehicle> Vehicles { get; set; } // Many to many mapping -- Excluded navigation property per configuration.
		public virtual System.Collections.Generic.ICollection<VehicleTypeVehicleFeatureType> VehicleTypeVehicleFeatureTypes { get; set; } // Many to many mapping


		partial void InitializePartial();

	}
}
