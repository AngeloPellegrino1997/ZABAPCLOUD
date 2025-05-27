CLASS zcl_lab_03_datatypes_ang DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_03_datatypes_ang IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

"  **********PART 1

    DATA: mv_char  TYPE c LENGTH 10 VALUE '12345',
          mv_num   TYPE i,
          mv_float TYPE f.
    mv_num = mv_char.
*    out->write( mv_num ).
    mv_float = mv_char.
*    out->write( mv_float ).

**********PART 2

    DATA: mv_trunc TYPE i,
          mv_round TYPE i.

    CLEAR mv_float.
    mv_float = '123.45'.
*    out->write( mv_float ).

    mv_trunc = mv_float.
    out->write( |VALOR TRUNCADO: { mv_trunc }| ).

    mv_float = mv_float + '0.5' .
*    out->write( mv_float ).
    mv_round = mv_float.
    out->write( |VALOR REDONDEADO: { mv_round }| ).

***********PART 3

    DATA(mv_abap) = 'ABAP'.

***********PART 4

    mv_num = CONV i( mv_char ).
    out->write( mv_num ).

***********PART 5

    DATA: mv_date_1 TYPE d,
          mv_date_2 TYPE d,
          mv_days   TYPE i,
          mv_time   TYPE t.
    mv_date_1 = cl_abap_context_info=>get_system_date( ).
*    out->write( | { mv_date_1 DATE = USER } | ).
    out->write( | { mv_date_1+6(2) }/{ mv_date_1+4(2) }/{ mv_date_1+0(4) } ESTE LO HICE A MANO | )."OTRA FOMAR DE ADAPTAR EL FORMATO SIN USAR DATE = USER
    mv_date_2 = mv_date_1 - 2."AQUI LE QUITE DIAS PERO ME GUSTARIA SABER COMO HACER PAR AQUITAR MESES O ANOS
    out->write( | { mv_date_2 DATE = USER } | ).

    mv_days = mv_date_1 - mv_date_2.
    out->write( |DIAS DE DIFERENCIA = { mv_days }| ).

*************PART 6
    CLEAR mv_date_2.
    DATA mv_timestamp TYPE utclong.
    mv_timestamp = utclong_current( ).

    CONVERT UTCLONG mv_timestamp
    TIME ZONE cl_abap_context_info=>get_user_time_zone(  )
    INTO DATE mv_date_2
    TIME mv_time.

    out->write( mv_date_2 ).
    out->write( mv_time ).

    mv_timestamp = utclong_add( val = mv_timestamp hours = -2 ).
    out->write( mv_timestamp ).

  ENDMETHOD.
ENDCLASS.
