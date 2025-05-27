CLASS zcl_04_objt_ang DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_objt_ang IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lv_num1 TYPE i VALUE 10,
          lv_num2 TYPE i,
          lv_num3 TYPE i.

    CONSTANTS: lc_num4   TYPE i VALUE 10,
               lc_num5   TYPE i VALUE 20,
               lc_string TYPE string VALUE 'ABAP'.
    "lc_num4 = 5. "this line was made solely with the purpose of demonstrating we cannt change the value

    lv_num2 = lc_num4.

    lv_num3 = lc_num5 + 5.

    "lv_num2 = 15.

    "lv_num3 = lv_num1 + lv_num2.
    out->write( 'ABAP Class - Logali' ).
    out->write( |Student 1| ).
    out->write( |Value number 1 = { lv_num1 } Value number 2 = { lv_num2 } Value number 3 = { lv_num3 } | ).

    DATA(lv_invoice) = '01234XC'.
    DATA(lv_tax) = 1234.

  ENDMETHOD.
ENDCLASS.
