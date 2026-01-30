CLASS zcl_lab_05_invoice_ang DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_05_invoice_ang IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

**********PARTE 1

    DATA: lv_sale        TYPE string  VALUE 'Purchase Completed',
          lv_sale_status TYPE string VALUE 'Invoice'.

**********PARTE 2

    DATA(lv_result) = 'SAP-ABAP-32-PE'.

    out->write( substring( val = lv_result off = 9 len = 5  ) ).
    out->write( substring_before( val = lv_result sub = 'ABAP' ) ).
    out->write( substring_after( val = lv_result sub = 'ABAP' ) ).

**********PARTE 3

    DATA: lv_status TYPE string VALUE 'INVOICE GENERATED SUCCESFULLY',
          lv_count  TYPE i.

    lv_count = find_any_of( val = lv_status sub = 'GEN').
    lv_count = sy-fdpos + 1.
    out->write( lv_count ).





  ENDMETHOD.
ENDCLASS.
