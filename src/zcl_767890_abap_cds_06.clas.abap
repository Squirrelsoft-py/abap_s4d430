CLASS zcl_767890_abap_cds_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_767890_abap_cds_06 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    SELECT * FROM ZZ_767890_CustomerKpis( p_city = 'Walldorf' ) INTO TABLE @DATA(customers).

    out->write( customers ).
  ENDMETHOD.
ENDCLASS.
