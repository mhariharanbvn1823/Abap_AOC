@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel root entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zfin_r_travel as select from /dmo/travel_m
//composition of target_data_source_name as _association_name
association of one to one /DMO/I_Agency as _Agency on
    $projection.AgencyId = _Agency.AgencyID
    association of one to one /DMO/I_Customer as _Customer on
    $projection.CustomerId = _Customer.CustomerID
    association of one to one I_Currency as _Currency on
    $projection.CurrencyCode = _Currency.Currency
    association of one to one /DMO/I_Overall_Status_VH as _OverallStatus on
    $projection.OverallStatus = _OverallStatus.OverallStatus

{
    
    key /dmo/travel_m.travel_id as TravelId,
        /dmo/travel_m.agency_id as AgencyId,
        /dmo/travel_m.customer_id as CustomerId,
        /dmo/travel_m.begin_date as BeginDate,
        /dmo/travel_m.end_date as EndDate,
         @Semantics.amount.currencyCode: 'CurrencyCode'
        /dmo/travel_m.booking_fee as BookingFee,
         @Semantics.amount.currencyCode: 'CurrencyCode'
        /dmo/travel_m.total_price as TotalPrice,
        /dmo/travel_m.currency_code as CurrencyCode,
        /dmo/travel_m.description as Description,
        /dmo/travel_m.overall_status as OverallStatus,
        @Semantics.user.createdBy: true
        /dmo/travel_m.created_by as CreatedBy,
        @Semantics.systemDateTime.createdAt: true
        /dmo/travel_m.created_at as CreatedAt,
        @Semantics.user.lastChangedBy: true
        /dmo/travel_m.last_changed_by as LastChangedBy,
        @Semantics.systemDateTime.lastChangedAt: true
        /dmo/travel_m.last_changed_at as LastChangedAt,
        
        _Agency,
        _Customer,
        _Currency,
        _OverallStatus
        
}
