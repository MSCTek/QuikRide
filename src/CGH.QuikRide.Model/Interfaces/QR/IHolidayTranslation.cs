// <auto-generated> - Template:ModelsBackedByDtoInterface, Version:1.1, Id:4d03f2c7-de27-4aae-a267-cad747c9606a
using System;
using System.Collections.Generic;

namespace CGH.QuikRide.Model.QR.Interface
{
	public partial interface IHolidayTranslation
	{
		string CreatedBy { get; }
		System.DateTime CreatedUtcDate { get; }
		int DataVersion { get; }
		int DisplayPriority { get; }
		int HolidayId { get; }
		int HolidayTranslationId { get; }
		bool IsDeleted { get; }
		int LanguageTypeId { get; }
		string ModifiedBy { get; }
		System.DateTime ModifiedUtcDate { get; }
		string Value { get; }

		IHoliday Holiday { get; }
		ILanguageType LanguageType { get; }


	}
}
