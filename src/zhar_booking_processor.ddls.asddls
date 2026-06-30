@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking entity projection'
@Metadata.ignorePropagatedAnnotations: false
define view entity zhar_booking_processor as projection on zhar_cds_booking
{
    key TravelId,
    key BookingId,
    BookingDate,
    CustomerId,
    CarrierId,
    ConnectionId,
    FlightDate,
    FlightPrice,
    CurrencyCode,
    BookingStatus,
    LastChangedAt,
    /* Associations */
    _BookingStatus,
    _Carrier,
    _Connection,
    _Customer,
    _Supplements : redirected to composition child zhar_supplemnt_processor ,
    _Travel : redirected to parent zhar_travel_processor
}
