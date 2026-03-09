CLASS zcl_767890_demo01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_767890_demo01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA travels type table of /DMO/I_Travel_D.

  select from /DMO/I_Travel_D
    fields *
    into table @travels.

   out->write( travels ).

  ENDMETHOD.
ENDCLASS.
