CLASS zcl_01_types_ang DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_types_ang IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA: lv_string TYPE string, "Variaable del tipo string (cadena de caracteres)
          lv_int    TYPE i VALUE 20250110, "Variable de tipo de numero entero
          lv_date   TYPE d VALUE '20250110',
          lv_dec    TYPE p LENGTH 8 DECIMALS 2 VALUE '202501.10', "Aqui se declara el numero en comillas debido a que puede haber error con el punto de final de sentencia y el punto del decimal.
          lv_car    TYPE c LENGTH 10 VALUE 'Logali'.
    lv_string = '20250110'.

    out->write( lv_string ).
    out->write( lv_int ).
    out->write( lv_date ).
    out->write( lv_dec ).
    out->write( lv_car ).

  ENDMETHOD.
ENDCLASS.
