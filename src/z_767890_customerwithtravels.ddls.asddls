@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'aaahhhhhh'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_767890_CustomerWithTravels as select from Z_767890_Customer as ct
association [0..*] to Z_767890_Travel as _Travel on ct.CustomerId = _Travel.CustomerId
{
  key CustomerId,
  FirstName,
  LastName,
  Title,
  Street,
  PostalCode,
  City,
  _Travel  
}
where ct.CountryCode = 'DE'
