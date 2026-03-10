@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'aaahhh'

@Metadata.ignorePropagatedAnnotations: false

define view entity ZZ_767890_CustomerKpis
  as select from Z767890_TravelWithCustomer

{
  key CustomerId,

      FullName,
      Street,
      PostalCode,
      City,

      count(distinct AgencyId)        as NumberOfDifferentAgencies,
      avg(Duration as abap.dec(16,0)) as AverageDuration,
      CurrencyCode,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      sum(TotalPrice + BookingFee)    as TotalRevenue
}

group by CustomerId,
         FullName,
         Street,
         PostalCode,
         City,
         CurrencyCode
having 
  sum(TotalPrice + BookingFee) >= 5000
