// <auto-generated> - Template:XamSample, Version:1.1, Id:9131a0a2-7ceb-4f4c-b8a9-6740ac19f66c
using System;
using CGH.QuikRide.DTO.QR;

namespace CGH.QuikRide.DTO.QR
{
	public static class DemoRide
	{
		public static System.Guid SampleRideId0000 = Guid.Parse("133f697e-6904-48cc-9629-056523b37d2c");
		public static System.Guid SampleRideId0100 = Guid.Parse("456e1492-c871-4b3d-8257-4fe5fe8da838");

		public static Ride SampleRide00
		{
			get
			{
				return new Ride()
				{
					RideId = SampleRideId0000,
					Start = DateTime.Now,
					StartLatitude = 0,
					StartLongitude = 0,
					End = DateTime.Now,
					EndLatitude = 0,
					EndLongitude = 0,
					VehicleId = 0,
					DriverId = 0,
					UserId = 0,
					DurationInSeconds = 0,
					GeoDistance = 0,
					DataVersion = 0,
					CreatedUtcDate = DateTime.Now,
					CreatedBy = "SampleCreatedBy",
					ModifiedUtcDate = DateTime.Now,
					ModifiedBy = "SampleModifiedBy",
					IsDeleted = false,
				};
			}
		}
		public static Ride SampleRide01
		{
			get
			{
				return new Ride()
				{
					RideId = SampleRideId0100,
					Start = DateTime.Now,
					StartLatitude = 0,
					StartLongitude = 0,
					End = DateTime.Now,
					EndLatitude = 0,
					EndLongitude = 0,
					VehicleId = 0,
					DriverId = 0,
					UserId = 0,
					DurationInSeconds = 0,
					GeoDistance = 0,
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
