CLASS zcl_00_abapcloud_ang DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_abapcloud_ang IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

     out->write( 'THIS IS MY FIRST CLASS' ).

  ENDMETHOD.
ENDCLASS.
