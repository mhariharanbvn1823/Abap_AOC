@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'supplement CDS entity projection'
@Metadata.ignorePropagatedAnnotations: false
define view entity zhar_supplemnt_processor as projection on zhar_cds_supplements
{
    key TravelId,
    key BookingId,
    key BookingSupplementId,
    SupplementId,
    Price,
    CurrencyCode,
    LastChangedAt,
    /* Associations */
    _Booking : redirected to parent zhar_booking_processor,
    _Supplement,
    _SupplementText,
    _Travel :  redirected to zhar_travel_processor
}
