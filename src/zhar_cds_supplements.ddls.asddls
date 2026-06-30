@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel BO - supllements CDS entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity zhar_cds_supplements as select from /dmo/booksuppl_m
association to parent zhar_cds_booking as _Booking
    on $projection.TravelId = _Booking.TravelId and
    $projection.BookingId = _Booking.BookingId 
association of one to one zhar_r_tavel as _Travel on
     $projection.TravelId = _Travel.TravelId
association of one to one /dmo/supplement as _Supplement on
     $projection.SupplementId = _Supplement .supplement_id
association of one to many /dmo/suppl_text as _SupplementText on
     $projection.SupplementId = _SupplementText.supplement_id
{
    key /dmo/booksuppl_m.travel_id as TravelId,
    key /dmo/booksuppl_m.booking_id as BookingId,
    key /dmo/booksuppl_m.booking_supplement_id as BookingSupplementId,
    /dmo/booksuppl_m.supplement_id as SupplementId,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    /dmo/booksuppl_m.price as Price,
    /dmo/booksuppl_m.currency_code as CurrencyCode,
    @Semantics.user.lastChangedBy: true
    /dmo/booksuppl_m.last_changed_at as LastChangedAt,
   _Booking,
   _Travel,
   _Supplement,
   _SupplementText
   
}
