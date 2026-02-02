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

    CLEAR lv_count.

    FIND ALL OCCURRENCES OF 'A' IN lv_status MATCH COUNT lv_count.
    out->write( lv_count ).

**********PARTE 4

    DATA lv_request TYPE string VALUE 'SAP-ABAP-32-PE'.

    REPLACE ALL OCCURRENCES OF '-' IN lv_request WITH '/'.
    out->write( lv_request ).

**********PARTE 5

    DATA lv_regex TYPE string VALUE '^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$'.
    DATA lv_email TYPE string VALUE 'joselito423@gmail.com'.

    FIND REGEX lv_regex IN lv_email.

    IF sy-subrc EQ 0.
      out->write( 'OK' ).
    ELSE.
      out->write( 'NO OK' ).
    ENDIF.

    CLEAR lv_regex.

**********PARTE 6

    DATA lv_idcustome TYPE string VALUE '0000012345'.

    lv_regex = '0*'.

    lv_idcustome = replace( val = lv_idcustome pcre = lv_regex with = ' ' ).
    out->write( lv_idcustome ).

**********PARTE 7

    lv_idcustome = repeat( val = lv_idcustome occ = 3 ).
    out->write( lv_idcustome ).

**********PARTE 8

    DATA lv_format TYPE string VALUE 'Send payment data via internet'.

    DATA(lv_format_url) = escape( val = lv_format format = cl_abap_format=>e_url_full ).
    out->write( lv_format_url ).


    DATA(lv_format_json) = escape( val = lv_format format = cl_abap_format=>e_json_string ).
    out->write( lv_format_json ).

    DATA(lv_format_tpl) = escape( val = lv_format format = cl_abap_format=>e_string_tpl ).
    out->write( lv_format_tpl ).

  ENDMETHOD.
ENDCLASS.
