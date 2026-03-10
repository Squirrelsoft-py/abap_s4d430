@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel with Customer'

@Metadata.ignorePropagatedAnnotations: false

define view entity Z767890_TravelWithCustomer
  as select from Z_767890_Customer                as c

    inner join   Z_767890_Travel                  as t
      on c.CustomerId = t.CustomerId

    inner join   DDCDS_CUSTOMER_DOMAIN_VALUE_T(
                   p_domain_name : '/DMO/STATUS') as d
      on d.value_low = t.Status and d.language = $session.system_language

{
  key t.TravelId,

      c.Street,
      c.PostalCode,
      c.City,
      t.AgencyId,
      t.BeginDate,
      t.EndDate,
      t.BookingFee,
      t.CurrencyCode,
      t.Description,
      d.text as StatusText,
      t.CustomerId,

      @EndUserText.label: 'Duration'
      dats_days_between(t.BeginDate, t.EndDate) + 1                 as Duration,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(amount             => t.TotalPrice,
                          source_currency    => t.CurrencyCode,
                          target_currency    => cast('EUR' as abap.cuky),
                          exchange_rate_date => $session.system_date,
                          error_handling     => 'KEEP_UNCONVERTED') as TotalPrice,

      case when c.Title is initial then concat_with_space(c.FirstName, c.LastName, 1)
      else concat_with_space(c.Title, concat_with_space(c.FirstName, c.LastName, 1), 1)
      end                                                           as FullName
}

where c.CountryCode = 'DE'
