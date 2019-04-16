// <auto-generated> - Template:XamSample, Version:1.1, Id:9131a0a2-7ceb-4f4c-b8a9-6740ac19f66c
using System;
using CGH.QuikRide.DTO.QR;

namespace CGH.QuikRide.DTO.QR
{
	public static class DemoUser
	{
		public static int SampleUserId0000 = 177274021;
		public static int SampleUserId0100 = 875303960;

		public static User SampleUser00
		{
			get
			{
				return new User()
				{
					UserId = SampleUserId0000,
					UserName = "SampleUserName",
					Email = "SampleEmail",
					BirthDate = DateTime.Now,
					FirstName = "SampleFirstName",
					LastName = "SampleLastName",
					GenderTypeId = 0,
					Password = "SamplePassword",
					Salt = "SampleSalt",
					LastLogin = DateTime.Now,
					PreferredLanguageId = 0,
					DataVersion = 0,
					CreatedUtcDate = DateTime.Now,
					CreatedBy = "SampleCreatedBy",
					ModifiedUtcDate = DateTime.Now,
					ModifiedBy = "SampleModifiedBy",
					IsDeleted = false,
				};
			}
		}
		public static User SampleUser01
		{
			get
			{
				return new User()
				{
					UserId = SampleUserId0100,
					UserName = "SampleUserName",
					Email = "SampleEmail",
					BirthDate = DateTime.Now,
					FirstName = "SampleFirstName",
					LastName = "SampleLastName",
					GenderTypeId = 0,
					Password = "SamplePassword",
					Salt = "SampleSalt",
					LastLogin = DateTime.Now,
					PreferredLanguageId = 0,
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
