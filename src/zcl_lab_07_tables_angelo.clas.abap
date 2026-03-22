CLASS zcl_lab_07_tables_angelo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_07_tables_angelo IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.


*****PARTE 1 ""ADDING REGISTERS

    DATA mt_employees TYPE STANDARD TABLE OF zemp_logali.
    DATA ms_employees TYPE zemp_logali.

    mt_employees = VALUE #( ( client = 213
                              id = 001
                              email = 'GIANSCAMACCA@GMAIL.COM'
                              ape1 = 'SCAMACCA'
                              ape2 = 'LUGLIO'
                              name = 'GIANLUCA'
                              fechan = '20260315'
                              fechaa = '20260320'               ) ).


    ms_employees-client = 312.
    ms_employees-id = 002.
    ms_employees-email = 'BARELLANICO@GMAIL.COM'.
    ms_employees-ape1 = 'BARELLA'.
    ms_employees-ape2 = 'TONALI'.
    ms_employees-name = 'NICOLO'.
    ms_employees-fechaa = '20260313'.
    ms_employees-fechan = '20260315'.

    APPEND ms_employees TO mt_employees.

*    out->write( mt_employees ).

*****PARTE 2 "" INSERTING REGISTERS

    INSERT VALUE #( client = 987
                    id = 003
                    email = 'FEDECHIESA@GMAIL.COM'
                    ape1 = 'CHIESA'
                    ape2 = 'INGLESIA'
                    name = 'FEDERICO'
                    fechan = '20260320'
                    fechaa = '20260321'            ) INTO TABLE mt_employees.

    out->write( mt_employees ).


*****PARTE 3 ""ADDING REGISTERS WITH APPEND

*TABLAS TRANSPARENTE: En SAP, una tabla transparente (transparent table) es un tipo de tabla del Diccionario ABAP (ABAP Dictionary) cuya estructura coincide exactamente con la estructura física de la tabla en la base de datos subyacente.
*Dicho de otra forma:
*Lo que ves en el Diccionario ABAP es exactamente lo que existe en la base de datos.
*No hay transformación, no hay mapeo especial, no hay capas intermedias.

    CLEAR ms_employees.

    DATA mt_employees2 TYPE STANDARD TABLE OF zemp_logali.

    ms_employees-client = 180.
    ms_employees-id = 1234567890.
    ms_employees-email = 'KEANM@GMAIL.COM'.
    ms_employees-ape1 = 'KEAN'.
    ms_employees-ape2 = 'BUOTY'.
    ms_employees-name = 'MOISE'.
    ms_employees-fechan = '20260322'.
    ms_employees-fechaa = '20260323'.

    APPEND ms_employees TO mt_employees2.
    out->write( |\n| ).

    APPEND VALUE #( client = 645
                    id = 7894561230
                    email = 'DIEGOC@GMAIL.COM'
                    ape1 = 'COPPOLA'
                    ape2 = 'PIETRI'
                    name = 'DIEGO'
                    fechan = '20260718'
                    fechaa = '20260719'             ) TO mt_employees2.

    APPEND LINES OF mt_employees FROM 2 TO 3 TO mt_employees2.

    out->write( mt_employees2 ).

*****PARTE 4 "" CORRESPONDING

    DATA mt_spfli TYPE STANDARD TABLE OF /dmo/connection.
    DATA ms_spfli TYPE /dmo/connection.
    DATA ms_spfli_2 TYPE /dmo/connection.

    SELECT FROM /dmo/connection
    FIELDS *
    INTO TABLE @mt_spfli.



    SELECT FROM /dmo/connection
    FIELDS *
    WHERE carrier_id = 'LH'
    INTO TABLE @DATA(mt_reading). ""DEBO USAR @ PARA USAR CUALQUIER DATO LOCAL, ES DECIR, LOS DECLARADOS EN LA CLASE
    out->write( |\n| ).
    out->write( mt_reading ).

    READ TABLE mt_spfli INTO ms_spfli INDEX 1.
    out->write( |\n| ).
    out->write( ms_spfli ).
    out->write( |\n| ).

    MOVE-CORRESPONDING ms_spfli TO ms_spfli_2.
    out->write( ms_spfli_2 ).
    out->write( |\n| ).

*****PARTE 5 "" READ TABLE WITH INDEX

    CLEAR ms_spfli.

    READ TABLE mt_spfli INTO ms_spfli INDEX 1 TRANSPORTING airport_from_id.
    out->write( ms_spfli ).
    out->write( |\n| ).

*****PARTE 6 "" READ TABLE WITH KEY

    CLEAR ms_spfli.

    READ TABLE mt_spfli INTO ms_spfli WITH KEY airport_to_id = 'FRA'.

    out->write( mS_spfli ).
    out->write( |\n| ).

*    LOOP AT mt_spfli INTO DATA(ls_droga) WHERE airport_to_id = 'FRA'. **AQUI QUISE OBTENER TODOS LOS REGISTROS QUE DIERAN LA COINCIDENCIA

*    OUT->write( ls_droga ).

*    ENDLOOP.

****PARTE 7 ""CHECKING OF REGISTERS

    CLEAR mt_spfli.

    SELECT FROM /dmo/connection
    FIELDS *
    WHERE connection_id > 0400
    INTO TABLE @mT_spfli.

*    out->write( mt_spfli ). ""VERIFICANDO TODOS LOS VALORES QUE CUMPLEN LA CONDICION ANTERIOR

    IF line_exists( mt_spfli[ connection_id = 0407 ] ).
      out->write( 'THE FLIGHT EXISTS' ).
    ELSE.
      out->write( 'THE FLIGHT DOESNT EXIST' ).
    ENDIF.

*****PARTE 8 "" A REGISTER'S INDEX

    DATA(lv_index) = line_index( mt_spfli[ connection_id = 0407 ] ).
    out->write( lv_index ).
    out->write( |\n| ).

*****PARTE 9 "" LOOP

    CLEAR mt_spfli.

    SELECT FROM /dmo/connection
    FIELDS *
    INTO TABLE @mt_spfli.

    LOOP AT mt_spfli INTO DATA(ms_km) WHERE distance_unit = 'KM'.

      out->write( ms_km ).

    ENDLOOP.







  ENDMETHOD.



ENDCLASS.


