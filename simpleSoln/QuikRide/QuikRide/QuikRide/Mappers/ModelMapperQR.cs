using dataQR = QuikRide.ModelsData;
using objQR = QuikRide.ModelsObj;

namespace QuikRide.Mappers
{
    public static class ModelMapperQR
    {
        public static dataQR.ReservationRequest ToModelData(this objQR.ReservationRequest source)
        {
            return new dataQR.ReservationRequest()
            {
                CreatedBy = source.CreatedBy,
                CreatedUtcDate = source.CreatedUtcDate,
                DestinationLocationId = source.DestinationLocationId,
                IsDeleted = source.IsDeleted,
                ModifiedBy = source.ModifiedBy,
                ModifiedUtcDate = source.ModifiedUtcDate,
                PickupLocationId = source.PickupLocationId,
                RequestedArrivalEnd = source.RequestedArrivalEnd,
                RequestedArrivalStart = source.RequestedArrivalStart,
                RequestedPickupEnd = source.RequestedPickupEnd,
                RequestedPickupStart = source.RequestedPickupStart,
                ReservationRequestCancellationReasonTypeId = source.ReservationRequestCancellationReasonTypeId,
                ReservationRequestId = source.ReservationRequestId,
                ReservationRequestStatusTypeId = source.ReservationRequestStatusTypeId,
            };
        }

        public static objQR.ReservationRequest ToModelData(this dataQR.ReservationRequest source)
        {
            return new objQR.ReservationRequest()
            {
                CreatedBy = source.CreatedBy,
                CreatedUtcDate = source.CreatedUtcDate,
                DestinationLocationId = source.DestinationLocationId,
                IsDeleted = source.IsDeleted,
                ModifiedBy = source.ModifiedBy,
                ModifiedUtcDate = source.ModifiedUtcDate,
                PickupLocationId = source.PickupLocationId,
                RequestedArrivalEnd = source.RequestedArrivalEnd,
                RequestedArrivalStart = source.RequestedArrivalStart,
                RequestedPickupEnd = source.RequestedPickupEnd,
                RequestedPickupStart = source.RequestedPickupStart,
                ReservationRequestCancellationReasonTypeId = source.ReservationRequestCancellationReasonTypeId,
                ReservationRequestId = source.ReservationRequestId,
                ReservationRequestStatusTypeId = source.ReservationRequestStatusTypeId,
            };
        }

        public static dataQR.Location ToModelObj(this objQR.Location source)
        {
            return new dataQR.Location()
            {
                AddressLine1 = source.AddressLine1,
                AddressLine2 = source.AddressLine2,
                City = source.City,
                CreatedBy = source.CreatedBy,
                CreatedUtcDate = source.CreatedUtcDate,
                IsDeleted = source.IsDeleted,
                Latitude = source.Latitude,
                LocationId = source.LocationId,
                Longitude = source.Longitude,
                ModifiedBy = source.ModifiedBy,
                ModifiedUtcDate = source.ModifiedUtcDate,
                Name = source.Name,
                PostalCode = source.PostalCode,
                State = source.State,
            };
        }

        public static objQR.Location ToModelObj(this dataQR.Location source)
        {
            return new objQR.Location()
            {
                AddressLine1 = source.AddressLine1,
                AddressLine2 = source.AddressLine2,
                City = source.City,
                CreatedBy = source.CreatedBy,
                CreatedUtcDate = source.CreatedUtcDate,
                IsDeleted = source.IsDeleted,
                Latitude = source.Latitude,
                LocationId = source.LocationId,
                Longitude = source.Longitude,
                ModifiedBy = source.ModifiedBy,
                ModifiedUtcDate = source.ModifiedUtcDate,
                Name = source.Name,
                PostalCode = source.PostalCode,
                State = source.State,
            };
        }
    }
}