CLASS zcl_lab_04_message_ang DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_04_message_ang IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    out->write( TEXT-001 ).

    DATA: lv_order_status TYPE string VALUE 'Purchase Completed Successfully',
          lv_char_number  TYPE i.

    lv_char_number = strlen( lv_order_status ).

    out->write( lv_char_number ).

    CLEAR lv_char_number.

    lv_char_number = numofchar( lv_order_status ).
    out->write( lv_char_number ).

    CLEAR lv_char_number.

    lv_char_number = count( val = lv_order_status sub = 'A' case = abap_false )."" EL case = abap_false ES PARA DECIRLE QUE ES INDIFIRENTE MINUSCULA DE MAYUSCULA
    out->write( lv_char_number ).

    CLEAR lv_char_number.

    lv_char_number = find( val = lv_order_status sub = 'Exit' ).
    out->write( lv_char_number ).



**********PARTE 3

    out->write( to_upper( lv_order_status ) ).
    out->write( to_lower( lv_order_status ) ).
    out->write( to_mixed( lv_order_status ) ).

    out->write( shift_left( val = lv_order_status circular = 9  ) ).

    out->write( substring( val = lv_order_status off = 9 len = 9  ) ).

    out->write( reverse( val = lv_order_status ) ).


**********PARTE 4

    DATA: lv_pattern TYPE string VALUE '\d{3}-\d{3}-\d{4}',
          lv_phone   TYPE string VALUE '658-789-1234'.

    IF contains( val = lv_phone pcre = lv_pattern ).
      out->write( 'This is a legit phone number' ).
    ELSE.
      out->write( 'This is not a legit phone number' ).
    ENDIF.

**********PARTE 5

    DATA(lv_email) = 'petrica1234@gmail.com'.

    CLEAR lv_pattern.

    lv_pattern = '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'.

    IF contains( val = lv_email  pcre = lv_pattern ).
    out->write( 'This is a email' ).
    ELSE.
    out->write( 'This is not a email' ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
