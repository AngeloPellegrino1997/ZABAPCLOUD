CLASS zcl_10_itab2_angelo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_itab2_angelo IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

**********FOR

*    TYPES:BEGIN OF lty_flights,
*            iduser     TYPE /dmo/customer_id,
*            aircode    TYPE /dmo/carrier_id,
*            flightnum  TYPE /dmo/connection_id,
*            key        TYPE land1,
*            seat       TYPE /dmo/plane_seats_occupied,
*            flightdate TYPE /dmo/flight_date,
*          END OF lty_flights.


*    DATA: gt_flights_info TYPE TABLE OF lty_flights,
*          gt_my_flights   TYPE TABLE OF lty_flights.


*    gt_my_flights = VALUE #( FOR i = 1 UNTIL i > 30
*                            (  iduser = | { 123456 + i } - USER |
*                               aircode = 'LH'
*                               flightnum = 0001 + i
*                               key = 'US'
*                               seat = 0 + i
*                               flightdate = cl_abap_context_info=>get_system_date(  ) + i     ) ).

*    out->write( data = gt_my_flights name = 'gt_my_flights' ).
*    out->write( |\n| ).

*    gt_flights_info = VALUE #( FOR i = 1 WHILE i <= 20
*                            (  iduser = | { 123456 + i } - USER |
*                               aircode = 'LH'
*                               flightnum = 0001 + i
*                               key = 'US'
*                               seat = 0 + i
*                               flightdate = cl_abap_context_info=>get_system_date(  ) + i     ) ).

*    out->write( data = gt_flights_info name = 'gt_flights_info' ).

*    gt_flights_info = VALUE #( FOR  gs_my_flight  IN gt_my_flights
*                         WHERE ( aircode = 'LH' AND flightnum GT 0012 )
*                                (  iduser = gs_my_flight-iduser
*                                   aircode = gs_my_flight-aircode
*                                   flightnum = gs_my_flight-flightnum
*                                   key = gs_my_flight-key
*                                   seat = gs_my_flight-seat
*                                   flightdate = gs_my_flight-flightdate     ) ).

*    out->write( data = gt_flights_info name = 'gt_flights_info' ).


**********NESTED FOR

*    TYPES:BEGIN OF lty_flights,
*            aircode     TYPE /dmo/carrier_id,
*            flightnum   TYPE /dmo/connection_id,
*            flightdate  TYPE /dmo/flight_date,
*            flightprice TYPE /dmo/flight_price,
*            currency    TYPE /dmo/currenCy_code,
*          END OF lty_flights.


*    SELECT FROM /dmo/flight
*    FIELDS *
*    INTO TABLE @DATA(gt_flights_type).

*    SELECT FROM /dmo/booking_m
*    FIELDS carrier_id, connection_id, flight_price, currency_code
*    INTO TABLE @DATA(Gt_airline)
*    UP TO 20 ROWS.

*    DATA gt_final TYPE SORTED TABLE OF lty_flights WITH NON-UNIQUE KEY flightprice.

*    gt_final = VALUE #( FOR gs_flight_type IN gt_flights_type WHERE ( carrier_id EQ 'AA' )

*                         FOR gs_airline IN gt_airline WHERE ( carrier_id = gs_flight_type-carrier_id )

*                         ( aircode = gs_flight_type-carrier_id
*                           flightnum = gs_flight_type-connection_id
*                           flightdate = gs_flight_type-flight_date
*                           flightprice = gs_airline-flight_price
*                           currency = gs_airline-currency_code                                 )
*    ).


*    out->write( data = gt_final name = 'GT_FINAL' ).


**********SELECT

*    SELECT FROM /dmo/flight
*    FIELDS *
*    WHERE carrier_id EQ 'LH'
*    INTO TABLE @DATA(gt_flights).

*    SELECT carrier_id, connection_id, flight_date
*    FROM @gt_flights AS gt
*    INTO TABLE @DATA(gt_flights_copy).

*    out->write( data = gt_flights_copy name = 'GT_FLIGHTS_COPY' ).

**********SORT

***PARA ORDENAR LOS REGISTROS, USAMOS LA SENTENCIA "SORT", ESTA OPERACION NO APLICARIA MUCHO PARA LAS TABLAS INTERNAS DEL TIPO SORT, ES DECIR,
**LAS QUE EN LA ECLARACION COLOCAMOS EL AÑADIDO TYPE SORT TABLE OF, ESTO PORQUE EL TIPO DE TABLA SORT, YA VIENE ORDENADO O SE ORDENA E TIEMPO SE
** EJECUCUION POR ALGUNA CLAVE QUE NOSOTROS ESPECIFIQUEMOS, ESTO APLICARIA MAS PARA LAS TABLAS TIPO ESTANDAR O HASH.

**AHORA PARA ESPECIFICAR EL ORDEN, SE HARA POR LA CLAVE PRIMARIA DE LA TABLA PRINCIPALMENTE O ESPECIFICANDO EXPLICITAMANETE UN CAMPO POR EL CUAL
** NECESITAMOS ORDENAR DE MANERA ASCENDENTE O DESCENDENTE

*    DATA: gt_flights TYPE STANDARD TABLE OF /dmo/flight.

*    SELECT FROM /dmo/flight
*    FIELDS *
*    WHERE carrier_id EQ 'LH'
*    INTO TABLE @gt_flights.

*    SELECT carrier_id, connection_id, flight_date
*    FROM @gt_flights AS gt
*    INTO TABLE @DATA(gt_flights_copy).

*    out->write( data = gt_flights_copy name = 'GT_FLIGHTS_COPY' ).

*    SORT gt_flights_copy. ""AQUI LO VA ORGANIZAR EN BASE A UNA CLAVE PRIMARIA, YA QUE NO SE LE ESPECIFICO EL CAMPO POR EL CUAL SE IBA A ORDENAR Y COMO NO FUE INDICADO EL TIPO DE ORDENACION DENTRO DE LA SENTENCIA,
    ""ESTE LO HIZO DE FORMA ASCENDENTE, EN CASO DE QUERELOS DE FORMA DESCENDENTE, SE AGREGA EL AÑADIDO "DESCENDING".

*    out->write( data = gt_flights_copy name = 'GT_FLIGHTS_COPY' ).

*    SORT gt_flights.

*    out->write( data = gt_flights name = 'GT_FLIGHTS' ).


*    SORT gt_flights BY flight_date DESCENDING connection_id ASCENDING. ""AQUI INCAMOS EL CAMPO POR EL CUAL QUERIAMOS ORDENAR Y LAS FORMAS DE COMO LO IB A AHCER

*    out->write( data = gt_flights name = 'GT_FLIGHTS' ).


**********MODIFY

    DATA: gt_flights TYPE STANDARD TABLE OF /dmo/flight.

    SELECT FROM /dmo/flight
    FIELDS *
    WHERE carrier_id EQ 'LH'
    INTO TABLE @gt_flights.

    SORT gt_flights DESCENDING.

*    out->write(  data = gt_flights name = 'BEFORE / GT_FLIGHTS' ).

    LOOP AT gt_flights INTO DATA(gs_flight).

      IF gs_flight-flight_date GT '20250101'.

        gs_flight-flight_date = cl_abap_context_info=>get_system_date(  ).

*    MODIFY gt_flights FROM gs_flight INDEX 2.

*     MODIFY gt_flights FROM gs_flight TRANSPORTING flight_date. ""ESTAS DOS SERIAN LAS FORMAS ANTIGUAS DE HACER MODIFICAICON DE LOS REGISTROS

        MODIFY gt_flights FROM VALUE #( connection_id = '111'
                                        carrier_id = 'XX'
                                        plane_type_id = 'YY'                     ) TRANSPORTING connection_id
                                                                                                 carrier_id
                                                                                                 plane_type_id.

**MEIDANTE TRANSPORTIN LO QUE HICE FUE DECIRLE QUE SOLO QUIERO QUE SE MODIFIQUEN ESOS DATOA SY QUE NO ME INICIALICE LOS OTROS, ESE DECIR, QUE MANTENGAN LOS MISMO DATOS

      ENDIF.

    ENDLOOP.

*    out->write(  data = gt_flights name = 'AFTER / GT_FLIGHTS' ).


**********DELETE

*    DATA: gt_flights_struc TYPE STANDARD TABLE OF /dmo/airport,
*          gs_flights_struc TYPE /dmo/airport.


*    SELECT FROM /dmo/airport
*    FIELDS *
*    WHERE country EQ 'US'
*    INTO TABLE @gt_flights_sTruc.

*    IF sy-subrc EQ 0.

*      out->write( data = gt_flights_struc name = 'BEFORE GT_FLIGHTS_STRUC' ).

*      LOOP AT gt_flights_struc INTO gs_flights_struc.

*        IF gs_flights_struc-airport_id = 'JFK' OR
*           gs_flights_struc-airport_id = 'BNA' OR
*           gs_flights_struc-airport_id = 'BOS'.

*          DELETE TABLE gt_flights_struc FROM gs_flights_struc.

*        ENDIF.

*      ENDLOOP.

*      DELETE gt_flights_struc INDEX 2. ""ASI SI QUIERES ELIMINAR UN INDICE ESPECIFICO DE LA TABLA

*      DELETE gt_flights_struc FROM 5 TO 8. "AQUI ESTOY ELIMINANADO DESDE UN REGISTRO HASTA EL OTRO

*      DELETE gt_flights_struc WHERE city IS INITIAL. ""CON INITIAL, LO QUE QUIERE DECIR ES QUE SI EL CAMPO ESTA VAICO, LO ELIMINA, INITIAL ES COMO DECIR QUE ESTA VACIO

*      DELETE ADJACENT DUPLICATES FROM gt_flights_struc COMPARING country. ""ESTE SE USA PARA ELIMINAR LOS CAMPOS QUE ESTEN REPETIDOS

*    ENDIF.
**********CLEAR / FREE ""A DIFERENCIA DEL CLEAR, EL FREE NO SOLO ELIMINA LOS DATOS INGRESADOS EN LOS CAMPOS SI NO QUE TAMBIEN LA MEMORIA APARTADA EN EL SISTEMA PARA LA TABLA

*    CLEAR gt_flights_struc.
*    FREE gt_flights_struc.

*    gt_flights_struc = VALUE #(  ). "" ESTA ES OTRA MANERA DE ELIMINAR LOS REGISTROS DE LA TABLA, YA QUE AUQI SE ESTA METIENDO REGISTROS VACIOS




*    out->write( |\n| ).
*    out->write( data = gt_flights_struc name = 'AFTER GT_FLIGHTS_STRUC' ).

**********COLLECT
    ""ESTA SENTENCIA INSERTA EL CONTENIDO DE UNA ESTRUCTURA, YA SEA COMO UNA UNICA FILA EN UNA TABLA INTERNA O AÑADIENDO LOS VALORES DE SUS COMPONENTES NUMERICOS
    ""A LSO VALORES CONRRESPONDIENTES DE LAS FILAS EXISTENTES CON LA MISMA CLAVE PRIAMRIA, AIS EVITAMOS ENTRADAS DUPLICADAS Y SE  MUESTRAN DE MANERA RESUMIDA


*    DATA: BEGIN OF ls_seats,
*            carrid TYPE /dmo/flight-carrier_id,
*            connid TYPE /dmo/flight-connection_id,
*            seats  TYPE /dmo/flight-seats_max,
*            price  TYPE /dmo/flight-price,
*          END OF ls_seats.

*    DATA gt_seats LIKE HASHED TABLE OF ls_seats WITH UNIQUE KEY carrid connid.

*    SELECT carrier_id, connection_id, seats_max, price
*    FROM /dmo/flight
*    INTO @ls_seats.

*      COLLECT ls_seats INTO gt_seats.


*    ENDSELECT.""ESTO SE AGREGO YA QUE QUERIAMOS VOLCAR BASTANTE INFORMACION EN LOS REGISTRO, ESTO SE COMPORTA COMO UN LOOP.


*    out->write( data = gt_seats name = 'GT_SEATS' ).

**********LET

    ""NOS AYUDA A DEFINIR VARIABLES O SIMBOLOS DE CAMPO, COMO CAMPOS AUXILIARES LOCALES EN UNA EXPRESION Y A ESTOS LES ASIGNA LOS VALORES
    ""CON ESTO SE EVITA LA DECLARACIONES NO DESEADA DE VARIABLES AUX
    ""EL RESULTADO DE ESTA OPERACION, ES UNA VARIABLE

    SELECT FROM /dmo/flight
    FIELDS *
    WHERE currency_code EQ 'USD'
    INTO TABLE @DATA(lt_flights).

    SELECT FROM /dmo/booking_m ""ESTA DE AQUI ES UNA TABLA CON MUCHOS REGISTROS, POR ESO AL FINAL SE LIMITA A 50 RONDAS
    FIELDS *
    INTO TABLE @DATA(lt_airline)
    UP TO 50 ROWS.

    LOOP AT lt_flights INTO DATA(ls_flight_let).

      DATA(lv_flights) = CONV string( LET lv_aIRline = lt_airline[ carrier_id = ls_flight_let-carrier_id ]-travel_id
                                          lV_flight_price = lt_flights[ carrier_id = ls_flight_let-carrier_id
                                                                    connection_id = ls_flight_let-connection_id  ]-price
                                          lv_carrid = lt_airline[ carrier_id = ls_flight_let-carrier_id ]-carrier_id
                                   IN | { lv_carrid } / AIRLINE NAME: { lv_airline } / FLIGHT PRICE: { lv_flight_price }|
                                                                                                                           ).

 OUT->write(  DATA = lv_flights ).

    ENDLOOP.




  ENDMETHOD.



ENDCLASS.
