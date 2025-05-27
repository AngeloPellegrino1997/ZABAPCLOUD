CLASS zcl_03_reftype_ang DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_reftype_ang IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lvr_int    TYPE REF TO i,
          lvr_string TYPE REF TO string.

    DATA lvr_ddic_tab TYPE REF TO /dmo/airport.

    DATA lvr_int2 LIKE lvr_int. "ESTE AÑADIDO LIKE YA ES VIEJO PERO HAY QUE SABERLO, EL HACE REFERENCIA A UNA VARIBLE A PARTIR DE OTRA.

************

    TYPES: ltyr_int TYPE REF TO i.
    DATA lvr_int3 TYPE ltyr_int.

    DATA lt_itab TYPE TABLE OF REF TO /dmo/airport.

************

    DATA lo_ref TYPE REF TO zcl_02_complexty_data_angelo.

  ENDMETHOD.
ENDCLASS.
