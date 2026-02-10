CLASS zcl_lab_06_condition_ang DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_06_condition_ang IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*****PARTE 1

*    DATA lv_conditional TYPE i VALUE 7.

*    IF lv_conditional = 7.
*      out->write( 'THE NUMBER IS EQUAL TO 7' ).
*    ELSE.
*      out->write( 'THE NUMBER IS DIFFERENT TO 7' ).
*    ENDIF.

*****PARTE 2

*    DATA lv_string TYPE string.

*    DO 3 TIMES.

*      IF sy-index = 1.
*        lv_string = 'LOGALI'.
*      ELSEIF sy-index = 2.
*        lv_string = 'SAP'.
*      ELSEIF sy-index = 3.
*        lv_string = 'ABAP'.
*      ENDIF.

*      CASE lv_string.

*        WHEN  'LOGALI'.
*          out->write( 'Academy' ).
*        WHEN 'SAP'.
*          out->write( 'Enterprise software' ).
*        WHEN OTHERS.
*          out->write( 'Unknown' ).
*      ENDCASE.
*    ENDDO.

*****PARTE 3

*    DATA lv_counter TYPE i.

*    DO 10 TIMES.

*      lv_counter = sy-index.
*      out->write( lv_counter ).

*    ENDDO.

*****PARTE 4

*    CLEAR lv_counter.

*    lv_counter = 0.


*    DO 10 TIMES.

*      lv_counter = sy-index.
*      out->write( lv_counter ).
*      CHECK lv_counter = 7.
*      EXIT.
*    ENDDO.


*****PARTE 5

*    DATA lv_string_2 TYPE string.

*    DO 4 TIMES.

*      IF sy-index = 1.
*        lv_string_2 = 'LOGALI'.
*      ELSEIF sy-index = 2.
*        lv_string_2 = 'SAP'.
*      ELSEIF sy-index = 3.
*        lv_string_2 = 'MOVISTAR'.
*      ELSE.
*        lv_string_2 = 'RANDOM'.
*      ENDIF.
*      out->write( lv_string_2 ).

*      DATA(lv_string_3) = SWITCH #( lv_string_2
*      WHEN 'LOGALI' THEN | Academy|
*      WHEN 'SAP' THEN | Enterprise software |
*      WHEN 'MOVISTAR' THEN | Telephony |
*      ELSE | Unknown | ).

*      out->write( lv_string_3 ).
*    ENDDO.


*****PARTE 6

*    DATA lv_time TYPE t.

*    lv_time = cl_abap_context_info=>get_system_time( ).

*    DATA(lv_time2) = COND #( WHEN lv_time < '120000' THEN |{ lv_time TIME = ISO } AM |
*                             WHEN lv_time > '120000' THEN | { CONV t( lv_time - 12 * 3600 ) TIME = ISO } PM|
*                             WHEN lv_time = '120000' THEN | HIGH NOON |
*                             ELSE | Undefinied Time | ).

*    out->write( lv_time2 ).

*****PARTE 7

*    DATA lv_counter_2 TYPE i.

*    WHILE lv_counter_2 < 20.

*      lv_counter_2 += 1.

*      out->write( |ESTE ES EL CONTADOR SE SUMA: { lv_counter_2 } | ).


*      IF lv_counter_2 > 10.
*        CONTINUE. ""OPCION AL EXIT, LO QUE VA DESPUES DEL CONTINUE NO SE EJECUTA
*      ENDIF.
*      out->write( lv_counter_2 ).
*    ENDWHILE.

*****PARTE 8

*    TYPES:BEGIN OF zemp_logali,
*            id    TYPE i,
*            name  TYPE c LENGTH 20,
*            ape1  TYPE c LENGTH 20,
*            ape2  TYPE c LENGTH 20,
*            email TYPE c LENGTH 50,
*          END OF zemp_logali.

    DATA ls_zemp TYPE zemp_lgl.

    "Registro 1
    ls_zemp-id_user    = 1.
    ls_zemp-name  = 'CARLOS'.
    ls_zemp-ape1  = 'PEREZ'.
    ls_zemp-ape2  = 'JIMENEZ'.
    ls_zemp-email = 'carlos.jimenez@test.com'.
    MODIFY zemp_lgl FROM @ls_zemp.

    "Registro 2
    ls_zemp-id_user    = 2.
    ls_zemp-name  = 'ANA'.
    ls_zemp-ape1  = 'LOPEZ'.
    ls_zemp-ape2  = 'JIMENEZ'.
    ls_zemp-email = 'ana.jimenez@test.com'.
    MODIFY zemp_lgl FROM @ls_zemp.

    "Registro 3
    ls_zemp-id_user    = 3.
    ls_zemp-name  = 'LUIS'.
    ls_zemp-ape1  = 'DIAZ'.
    ls_zemp-ape2  = 'MARTINEZ'.
    ls_zemp-email = 'luis.diaz@test.com'.
    MODIFY zemp_lgl FROM @ls_zemp.

    SELECT FROM zemp_lgl
    FIELDS *
*   WHERE "" ES PARA TRAER CAMPOS, YA SEA INDIVIDUALES O VARIOS
    INTO TABLE @DATA(lt_zemp_lgl_2).

    out->write( lt_zemp_lgl_2  ).



*****PARTE 9

    DATA lv_exception TYPE f VALUE 5.


    DATA(lv_counter) = 5.

    TRY.

        DO 5 TIMES.
          lv_counter = lv_counter - 1.

          DATA(lv_result) = lv_exception / lv_counter.
          out->write( lv_result ).


        ENDDO.
      CATCH cx_sy_zerodivide INTO DATA(lx_zero_divide).
        out->write( |NUMBER DIVIDED BY 0| ).
    ENDTRY.



  ENDMETHOD.
ENDCLASS.
