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

    TYPES:BEGIN OF lty_flights,
            iduser     TYPE /dmo/customer_id,
            aircode    TYPE /dmo/carrier_id,
            flightnum  TYPE /dmo/connection_id,
            key        TYPE land1,
            seat       TYPE /dmo/plane_seats_occupied,
            flightdate TYPE /dmo/flight_date,
          END OF lty_flights.


    DATA: gt_flights_info TYPE TABLE OF lty_flights,
          gt_my_flights   TYPE TABLE OF lty_flights.


    gt_my_flights = VALUE #( FOR i = 1 UNTIL i > 30
                            (  iduser = | { 123456 + i } - USER |
                               aircode = 'LH'
                               flightnum = 0001 + i
                               key = 'US'
                               seat = 0 + i
                               flightdate = cl_abap_context_info=>get_system_date(  ) + i     ) ).

    out->write( data = gt_my_flights name = 'gt_my_flights' ).
    out->write( |\n| ).

*    gt_flights_info = VALUE #( FOR i = 1 WHILE i <= 20
*                            (  iduser = | { 123456 + i } - USER |
*                               aircode = 'LH'
*                               flightnum = 0001 + i
*                               key = 'US'
*                               seat = 0 + i
*                               flightdate = cl_abap_context_info=>get_system_date(  ) + i     ) ).

*    out->write( data = gt_flights_info name = 'gt_flights_info' ).

    gt_flights_info = VALUE #( FOR  gs_my_flight  IN gt_my_flights
                         WHERE ( aircode = 'LH' AND flightnum GT 0012 )
                                (  iduser = gs_my_flight-iduser
                                   aircode = gs_my_flight-aircode
                                   flightnum = gs_my_flight-flightnum
                                   key = gs_my_flight-key
                                   seat = gs_my_flight-seat
                                   flightdate = gs_my_flight-flightdate     ) ).

    out->write( data = gt_flights_info name = 'gt_flights_info' ).


  ENDMETHOD.



ENDCLASS.
