@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection for booking supply entity'
@Metadata.ignorePropagatedAnnotations: false
define view entity zfin_booksuppl_processor as projection on zfin_booksuppl
{
    key TravelId,
    key BookingId,
    key BookingSupplementId,
    SupplementId,
    Price,
    CurrencyCode,
    LastChangedAt,
    /* Associations */
    _Booking : redirected to parent zfin_booking_processor,
    _SupplementText,
    _Travel : redirected to zfin_travel_processor
}
