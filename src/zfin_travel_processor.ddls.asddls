@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection for travel entity'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define root view entity zfin_travel_processor as projection on zfin_r_travel
{
    key TravelId,
    AgencyId,
    
    CustomerId,
    CustomerName,
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
    AgencyName,
    OverallStatusText,
    /* Associations */
    _Agency,
    _Booking : redirected to composition child zfin_booking_processor,
    _Currency,
    _Customer,
    _OverallStatus
}
