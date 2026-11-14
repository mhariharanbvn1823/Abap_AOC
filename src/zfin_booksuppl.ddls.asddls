@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'booking supple entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity zfin_booksuppl as select from /dmo/booksuppl_m
association to parent zfin_booking as _Booking
    on $projection.TravelId = _Booking.TravelId and
       $projection.BookingId = _Booking.BookingId 
association of many to exact one zfin_r_travel as _Travel
    on $projection.TravelId = _Travel.TravelId
association of one to many /DMO/I_SupplementText as _SupplementText
    on $projection.SupplementId = _SupplementText.SupplementID
{
    
    key /dmo/booksuppl_m.travel_id as TravelId,
    key /dmo/booksuppl_m.booking_id as BookingId,
    key /dmo/booksuppl_m.booking_supplement_id as BookingSupplementId,
    /dmo/booksuppl_m.supplement_id as SupplementId,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    /dmo/booksuppl_m.price as Price,
    /dmo/booksuppl_m.currency_code as CurrencyCode,
    @Semantics.systemDateTime.lastChangedAt: true
    /dmo/booksuppl_m.last_changed_at as LastChangedAt,
    _Booking,
    _Travel,
    _SupplementText
}
