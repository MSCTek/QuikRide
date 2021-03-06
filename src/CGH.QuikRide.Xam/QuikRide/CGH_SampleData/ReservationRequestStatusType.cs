// <auto-generated> - Template:XamSample, Version:1.1, Id:9131a0a2-7ceb-4f4c-b8a9-6740ac19f66c
using System;
using CGH.QuikRide.DTO.QR;

namespace CGH.QuikRide.DTO.QR
{
	public static class DemoReservationRequestStatusType
	{
		public static int SampleReservationRequestStatusTypeId0000 = 2118648318;
		public static int SampleReservationRequestStatusTypeId0100 = 1698368196;

		public static ReservationRequestStatusType SampleReservationRequestStatusType00
		{
			get
			{
				return new ReservationRequestStatusType()
				{
					ReservationRequestStatusTypeId = SampleReservationRequestStatusTypeId0000,
					Code = "SampleCode",
					DataVersion = 0,
					CreatedUtcDate = DateTime.Now,
					CreatedBy = "SampleCreatedBy",
					ModifiedUtcDate = DateTime.Now,
					ModifiedBy = "SampleModifiedBy",
					IsDeleted = false,
				};
			}
		}
		public static ReservationRequestStatusType SampleReservationRequestStatusType01
		{
			get
			{
				return new ReservationRequestStatusType()
				{
					ReservationRequestStatusTypeId = SampleReservationRequestStatusTypeId0100,
					Code = "SampleCode",
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
