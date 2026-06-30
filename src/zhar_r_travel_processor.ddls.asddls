@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tavel Bo projection'
@Metadata.ignorePropagatedAnnotations: false
define root view entity zhar_r_travel_processor as projection on zhar_r_tavel
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
    _Booking ,
    _Currency,
    _Customer,
    _overallStatus 
}
