CLASS zcl_07_ctrl_tr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_07_ctrl_tr IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    DATA(lv_char) = 'B'.

*    IF lv_char EQ 'A'.

*      out->write( lv_char ).

*    ELSEIF lv_char EQ 'B'.
*      out->write( lv_char ).

*    ELSEIF lv_char EQ 'C'.
*      out->write( lv_char ).

*    ELSE.

*      out->write( 'Unidentified' ).

*    ENDIF.

*    DATA(lv_num) = 3.

*    IF lv_num EQ 3 OR lv_char EQ 'A'.
*      out->write( 'Valid values' ).
*    ENDIF.

******NESTED IF

*    DATA(lv_text) = 'ABAP'.
*    DATA(lv_text2) = 'Programming'.
*    DATA(lv_text3) = 'Classes'.

*    IF lv_text = 'ABAP'.
*      IF lv_text2 EQ 'Programming'.
*        IF lv_text3 = 'Classes'.
*          out->write( 'Correct' ).
*        ELSE.
*          out->write( 'Incorrect' ).
*        ENDIF.
*      ENDIF.
*    ENDIF.

*    CLEAR lv_num.

*    IF lv_num IS INITIAL.
*      out->write( 'The variable is empty' ).
*    ENDIF.


**********CASE/ENDCASE

*    DATA(lv_client) = cl_abap_random_int=>create( seed = cl_abap_random=>seed( )
*    min = 1
*    max = 3                          )->get_next(  ).

*    CASE lv_client. "" LA DIFERENCIA DE USAR UN IF Y UN CASE, S QUE CON EL IF PODEMOS PONER CONDICIONES DE: MENOR-IGUAL, MAYOR-IGUAL O INCLUSO ANIDAR VARIAS EXPRESIONES LOGICAS

*      WHEN 1.
*        out->write( lv_client ).
*        out->write( 'COMPANY CLIENT 1' ).

*      WHEN 2.
*        out->write( lv_client ).
*        out->write( 'COMPANY CLIENT 2' ).

*      WHEN 3.
*        out->write( lv_client ).
*        out->write( 'COMPANY CLIENT 3' ).

*      WHEN OTHERS.
*        out->write( 'CLIENT NOT REGISTERED IN THE DATABASE' ).
*    ENDCASE.

**********DO/ENDDO

*    DATA(lv_num) = 0.

*    DO 3 TIMES."" SI NO SE ESPECIFICA EL TIMES, PODEMO TENER U BLOQUE DE SISTEMA ON ESTE BUCLE INFINITO

*      out->write( lv_num ).
*      lv_num += 1.

*    ENDDO.


*    DO. ""EN CASO DE NO ESPECIFICAR UN TIMES, PODMOS ACER UN IF QE LIMITE LA VECES Y ASI NO CAER EN UN ERROR DE BUCLE INFINITO

*      out->write( lv_num ).
*      lv_num += 1.

*      IF lv_num GT 8.
*        EXIT.
*      ENDIF.

*      IF lv_num GT 3. ""ESTA ES OTRA FORMA DE HACER LO DE HACER UN BUCLE
*        CONTINUE.
*      ENDIF.
*      out->write( 'CONTINUE' ).
*      out->write( lv_num ).


*    ENDDO.

**********CHECK

*    DO 20 TIMES.

*      DATA(lv_div) = sy-index MOD 2.
*      CHECK lv_div = 0.

*      out->write( sy-index ).

*    ENDDO.


**********SWITCH ""SE UTILIZA PARA CAMBIAR DE UN VALO A OTRO NE FUNCION DE LA CONDICION ESTABLECIDA

    "" EL # QUIERE DECIR QUE EL TIPO DE VALOR QUE DARA EL RESULTADO, SERA ELEGIDO POR EL CONTEXTO, YA QUE ESTE SE PODRIA ESPECIFICAR.
    "" SIEMPRE SE DEBE TENER UN OPERADOR WHEN DENTRO DE LA CONDICIONES PORQUE SI NO, NO TIEE NINGUN SENTIDO USARLO Y EL VALOR DEL WHEN DEBE SER COMPATIBLE CON LA VARIABLE INICIAL, ES DECIR, DEBEN SER EL MISMO TIPO

*   DO 6 TIMES.

*      DATA(lv_value) = SWITCH #( sy-index
*      WHEN 1 THEN | INTERATION 1|
*      WHEN 2 THEN | INTERATION 2|
*      WHEN 3 THEN | INTERATION 3|
*      ELSE |# ITERATION GREATER THAN 3| ).

*      out->write( lv_value ).
*    ENDDO.

**********COND ""ES COMO UNA NUEVA FORMA DE APLCAR EL IF, ELSEIF.

*    DATA(lv_get_time) = cl_abap_context_info=>get_system_time(  ).

*    DATA(lv_time) = COND #( WHEN lv_get_time < '120000' THEN |{ lv_get_time TIME = ISO } AM |
*                            WHEN lv_get_time > '120000' THEN | { CONV t( lv_get_time - 12 * 3600 ) TIME = ISO } PM|
*                            WHEN lv_get_time = '120000' THEN | HIG NOON |
*
*                            ELSE |UNIDETFIED TIME|   ).
    "" AL HACER LA CONDICION AY QUE TENER EN CUENTA COMO ES EL FORMATO DE LOS DATOS QUE SE MANEJAN, EN ESTE CAOS LA HORA VIENE EN 00:00:00 SIN LOS PUNTOS
    "" EL TIME = ISO, ES PARA EVITAR QUE E USAURAIO VEA LA HORA COMO LA DA ABAP, OCMO UN NUMERO DE DIGITOS, EJEMPLOS 031669, ESTO LO TRANSFORMA EN 03:15:59
    "" 12 * 3600 = 43200, SON 12 HORAS EXPRESADAS EN SEGUSO Y SE LE RESTA AL HORARIO DE 24 PARA ASI TENER UN FORMATO DE 12 HORAS

*    out->write( lv_time ).


**********WHILE/ENDWHILE

*    DATA lv_num TYPE i.

*    WHILE lv_num LE 10.

*      out->write( lv_num ).
****      out->write( | ITERATION = { sy-index } | ).
*      lv_num += 1.

*      IF lv_num GT 5.
*        EXIT.
*      ENDIF.

*    ENDWHILE.

*    out->write( 'END OF PROGRAM' ).


**********LOOP/ENDLOOP ""SIRVE PARA ITERAR SOBRE UNA TABLA INTERNA, PERMITE PROCESAR CADA FILA DE DICHA TABLA DE MANERA SECUANCIAL

*    TYPES: BEGIN OF lty_num,
*             num TYPE i,
*           END OF lty_num.

*    DATA lt_num TYPE TABLE OF lty_num.

*    DATA: lv_sum   TYPE i,
*          lv_total TYPE i.

*    lt_num = VALUE #( ( num = 10 )
*                      ( num = 20 )
*                      ( num = 30 ) ).

*    lv_sum = 0.

*    LOOP AT lt_num INTO DATA(ls_num).

*      lv_sum = lv_sum + ls_num-num.

*    ENDLOOP.

*    lv_total = lv_sum.
*    out->write( lv_total ).


**********TRY/ENDTRY ""REALIZA EL TRATAMIENTO DE LAS EXEPCIONES, LAS EXEPCIONES SON EVENTOS QUE SUCEDEN DURANTE LA EJECUCION DE UN PRGRAMA ABAP Y ESTOS EVENTOS INTERRUPEN EL FUNCIONAMIENTO
    "" DEL PROGRAMA ABAP, PORQUE NO ES POSIBLE QUE ESTE PRGRAMA CONTINUE DE MANERA SIGNIFICATIVA

    TRY.
        DATA: lv_num1 TYPE i VALUE 10,
              lv_num2 TYPE i VALUE 0,
              lv_res  TYPE f.

        lv_res = lv_num1 / lv_num2. ""AQUI DA UN ERROR LOGICO YA QUE ES 10/0, LO QUEDEBMOS HACER ES BUSCAR EL ERROR Y PONERLO EN EL TRY

        out->write( lv_res ).
      CATCH cx_sy_zerodivide INTO DATA(lx_zero_divide).
        out->write( 'ERROR: DIVISION BY ZERO DETECTED' ).

    ENDTRY.




  ENDMETHOD.

ENDCLASS.
