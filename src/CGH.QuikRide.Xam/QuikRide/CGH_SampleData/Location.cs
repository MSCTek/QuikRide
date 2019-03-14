// <auto-generated> - Template:XamSample, Version:1.1, Id:9131a0a2-7ceb-4f4c-b8a9-6740ac19f66c
using System;
using CGH.QuikRide.DTO.QR;

namespace CGH.QuikRide.DTO.QR
{
	public static class DemoLocation
	{
		public static System.Guid SampleLocationId0000 = Guid.Parse("5029d857-8efa-4056-ae5c-9d58aeade2f6");
		public static System.Guid SampleLocationId0100 = Guid.Parse("15a02393-c5e0-4f0e-ae8c-59556a6ada91");

		public static Location SampleLocation00
		{
			get
			{
				return new Location()
				{
					LocationId = SampleLocationId0100,
					Name = "SampleName",
					Latitude = 0,
					Longitude = 0,
					AddressLine1 = "SampleAddressLine1",
					AddressLine2 = "SampleAddressLine2",
					City = "SampleCity",
					State = "SampleState",
					PostalCode = "SamplePostalCode",
					DataVersion = 0,
					CreatedUtcDate = DateTime.Now,
					CreatedBy = "SampleCreatedBy",
					ModifiedUtcDate = DateTime.Now,
					ModifiedBy = "SampleModifiedBy",
					IsDeleted = false,
				};
			}
		}
		public static Location SampleLocation01
		{
			get
			{
				return new Location()
				{
					LocationId = SampleLocationId0100,
					Name = "SampleName",
					Latitude = 0,
					Longitude = 0,
					AddressLine1 = "SampleAddressLine1",
					AddressLine2 = "SampleAddressLine2",
					City = "SampleCity",
					State = "SampleState",
					PostalCode = "SamplePostalCode",
					DataVersion = 0,
					CreatedUtcDate = DateTime.Now,
					CreatedBy = "SampleCreatedBy",
					ModifiedUtcDate = DateTime.Now,
					ModifiedBy = "SampleModifiedBy",
					IsDeleted = false,
				};
			}
		}

	}
}