// <auto-generated> - Template:ModelsBackedByDtoInterface, Version:1.1, Id:4d03f2c7-de27-4aae-a267-cad747c9606a
using System;
using System.Collections.Generic;

namespace CGH.QuikRide.Model.QR.Interface
{
	public partial interface ILocationType
	{
		string Code { get; }
		string CreatedBy { get; }
		System.DateTime CreatedUtcDate { get; }
		int DataVersion { get; }
		bool IsDeleted { get; }
		int LocationTypeId { get; }
		string ModifiedBy { get; }
		System.DateTime ModifiedUtcDate { get; }

		List<ILocation> Locations { get; }
		List<ILocationTypeTranslation> LocationTypeTranslations { get; }


	}
}