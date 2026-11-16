@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection for Booking entity'
@Metadata.ignorePropagatedAnnotations: false
define view entity zfin_booking_processor as projection on zfin_booking
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
    _BookingSuppl : redirected to composition child zfin_booksuppl_processor,
    _Carrier,
    _Connection,
    _Customer,
    _Travel : redirected to parent zfin_travel_processor
}
