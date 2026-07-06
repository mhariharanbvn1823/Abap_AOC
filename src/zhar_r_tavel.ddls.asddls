@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'root vire for Travel'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zhar_r_tavel as select from /dmo/travel_m
composition[0..*] of zhar_cds_booking as _Booking
association of one to one /DMO/I_Agency as _Agency on
$projection.AgencyId = _Agency.AgencyID
association of one to one /DMO/I_Customer as _Customer on
$projection.CustomerId = _Customer.CustomerID
association of one to one I_Currency as _Currency on
$projection.CurrencyCode = _Currency.Currency
association of one to one /DMO/I_Overall_Status_VH as _overallStatus on
$projection.OverallStatus = _overallStatus.OverallStatus
{
   @ObjectModel.text.element: [ 'Description' ]
   key travel_id as TravelId,
   @ObjectModel.text.element: [ 'AgencyName' ]
   @Consumption.valueHelpDefinition: [{ 
            entity : { 
                name: '/DMO/I_Agency',
                element: 'AgencyID'
            }   }]
   agency_id as AgencyId,
   _Agency.Name as AgencyName,
   @ObjectModel.text.element: [ 'CustomerName' ]
      @Consumption.valueHelpDefinition: [{ 
            entity : { 
                name: '/DMO/I_Customer',
                element: 'CustomerID'
            }   }]
   customer_id as CustomerId,
   concat( _Customer.FirstName , _Customer.LastName ) as CustomerName,
   begin_date as BeginDate,
   end_date as EndDate,
   @Semantics.amount.currencyCode: 'CurrencyCode'
   booking_fee as BookingFee,
   @Semantics.amount.currencyCode: 'CurrencyCode'
   total_price as TotalPrice,
   currency_code as CurrencyCode,
   description as Description,
   @ObjectModel.text.element: [ 'OverallStatusText' ]
      @Consumption.valueHelpDefinition: [{ 
            entity : { 
                name: '/DMO/I_Overall_Status_VH',
                element: 'OverallStatus'
            }   }]
   overall_status as OverallStatus,
   _overallStatus._Text[ Language = $session.system_language ].Text as OverallStatusText,
   @Semantics.user.createdBy: true
   created_by as CreatedBy,
   case overall_status
    when 'O' then 2
    when 'A' then 3
    when 'X' then 1
         end as status_code,
   @Semantics.systemDateTime.createdAt: true
   created_at as CreatedAt,
   @Semantics.user.lastChangedBy: true
   last_changed_by as LastChangedBy,
   @Semantics.systemDateTime.lastChangedAt: true
   last_changed_at as LastChangedAt,
   _Booking,
   _Agency,
   _Customer,
   _Currency,
   _overallStatus
}
