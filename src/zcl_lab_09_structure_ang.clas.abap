CLASS zcl_lab_09_structure_ang DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_09_structure_ang IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

******PARTE 1

    TYPES:BEGIN OF ty_flights,
            iduser     TYPE c LENGTH 40,
            aircode    TYPE /dmo/carrier_id,
            flightnum  TYPE /dmo/connection_id,
            key        TYPE land1,
            seat       TYPE /dmo/plane_seats_occupied,
            flightdate TYPE /dmo/flight_date,

          END OF ty_flights.

    DATA ls_flights TYPE ty_flights.



    TYPES:BEGIN OF ty_airlines,
            carrid    TYPE /dmo/carrier_id,
            connid    TYPE /dmo/connection_id,
            countryfr TYPE land1,
            cityfrom  TYPE /dmo/city,
            airfrom   TYPE /dmo/airport_id,
            countryto TYPE land1,

          END OF ty_airlines.

    DATA ls_airlines TYPE ty_airlines.

*****PARTE 2

    TYPES BEGIN OF ty_nested.

    INCLUDE TYPE ty_flights AS flights RENAMING WITH SUFFIX _flights.
    INCLUDE STRUCTURE ls_airlines AS airlines RENAMING WITH SUFFIX _airlines.

    TYPES END OF ty_nested.

    DATA ls_nested TYPE ty_nested.

    ""    out->write( LS_nested ).

*****PARTE 3

    TYPES:BEGIN OF ty_deep,
            carrid  TYPE /dmo/carrier_id,
            connid  TYPE /dmo/connection_id,
            flights TYPE ty_flights,


          END OF ty_deep.

    DATA ls_deep TYPE ty_deep.

****PARTE 4

    ls_nested = VALUE #( iduser_flights = 'ABC123'
                         aircode_flights = 'FRA'
                         flightnum_flights = '1234'
                         key_flights = '456'
                         seat_flights = 1234567890
                         flightdate_flights = '19970718'
                         carrid_airlines = `DOR`
                         connid_airlines = 7894
                         countryfr_airlines = 'GER'
                         cityfrom_airlines = 'FRANKFURT'
                         airfrom_airlines = 'GER'
                         countryto_airlines = 'FRA'                        ).

*    out->wRIte( ls_nested ).
*    out->wRIte( |\n| ).

    ls_deep = VALUE #( carrid = 'TRM'
                       connid =  6549
           flights = VALUE #( iduser = 'AXYO4513256'
                              aircode = 'AX7'
                              flightnum = '1900'
                              key = '160'
                              seat = 8030
                              flightdate = cl_abap_context_info=>get_system_date( )
             )
     ).

*    out->wRIte( ls_deep ).


*****PARTE 5

    TYPES BEGIN OF ty_include_flights.

    INCLUDE TYPE ty_flights AS flights RENAMING WITH SUFFIX _flights.
    INCLUDE STRUCTURE ls_airlines AS airlines RENAMING WITH SUFFIX _airlines.

    TYPES END OF ty_include_flights.


    DATA ls_include_flights TYPE ty_include_flights.


    ls_include_flights = VALUE #( iduser_flights = 'ANG97'
                                  aircode_flights = '123'
                                  flightnum_flights = '789'
                                  key_flights = '894'
                                  seat_flights = 654987
                                  flightdate_flights = '20260408'
                                  carrid_airlines = 'DTB'
                                  connid_airlines = 0865
                                  countryfr_airlines = 'VEN'
                                  cityfrom_airlines = 'MAR'
                                  airfrom_airlines = 'MAI'
                                  countryto_airlines = 'SPN'                         ).

*    out->write( ls_include_flights ).

******PARTE 6

    CLEAR ls_nested-aircode_flights.
    out->write( ls_nested ).
    out->write( |\n| ).

    CLEAR ls_deep.
    out->write( ls_DEEP ).


  ENDMETHOD.
ENDCLASS.
