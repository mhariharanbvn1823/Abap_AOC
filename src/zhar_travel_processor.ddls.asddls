@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel BO projection'
@Metadata.ignorePropagatedAnnotations: false
define root view entity zhar_travel_processor as projection on zhar_r_tavel
{
    key TravelId,
    AgencyId,
    CustomerId,
    BeginDate,
    EndDate,
    BookingFee,
    TotalPrice,
    CurrencyCode,
    Description,
    OverallStatus,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    /* Associations */
    _Agency,
    _Booking : redirected to composition child zhar_booking_processor,
    _Currency,
    _Customer,
    _overallStatus
}
