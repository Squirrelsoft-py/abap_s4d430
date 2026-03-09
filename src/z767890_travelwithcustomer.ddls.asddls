@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel with Customer'
@Metadata.ignorePropagatedAnnotations: false
define view entity Z767890_TravelWithCustomer as select from Z_767890_Customer as c
inner join Z_767890_Travel as t on c.CustomerId = t.CustomerId
{
  key c.CustomerId,
  key t.TravelId,
  c.FirstName,
  c.LastName,
  c.Title,
  c.Street,
  c.PostalCode,
  c.City,
  t.AgencyId,
  t.BeginDate,
  t.EndDate,
  t.BookingFee,
  t.TotalPrice,
  t.CurrencyCode,
  t.Description,
  t.Status
}
