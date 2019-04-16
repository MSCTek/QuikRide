// <auto-generated> - Template:ModelsBackedByDtoInterface, Version:1.1, Id:4d03f2c7-de27-4aae-a267-cad747c9606a
using System;
using System.Collections.Generic;

namespace CGH.QuikRide.Model.QR.Interface
{
	public partial interface IVehicleFeatureTypeTranslation
	{
		string CreatedBy { get; }
		System.DateTime CreatedUtcDate { get; }
		int DataVersion { get; }
		int DisplayPriority { get; }
		bool IsDeleted { get; }
		int LanguageTypeId { get; }
		string ModifiedBy { get; }
		System.DateTime ModifiedUtcDate { get; }
		string Value { get; }
		int VehicleFeatureTypeId { get; }
		int VehicleFeatureTypeTranslationId { get; }

		ILanguageType LanguageType { get; }
		IVehicleFeatureType VehicleFeatureType { get; }


	}
}
