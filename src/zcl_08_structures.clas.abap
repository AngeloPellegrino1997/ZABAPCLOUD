CLASS zcl_08_structures DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_structures IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    ""LAS ESTRUCTURAS, EN EL LENGUAJE DE PROGRAMACION ABAP CORRESPONDEN A OBJETOS COMPUESTOS POR TIPOS DE DATOS COMPLEJOS, PODEMOS IMAGINAR UNA ESTRUCTURA COMO UNA PLANTILLA
    ""SE COMPONE DE UN CONJUNTO DE CAMPOS O COLUMNAS Y CADA UNA DE ELLAS REPRESENTA UN TIPO DE DATO, QUE PUEDE SER: UN OBJETO DE DATO ELEMNTAL, UNA ESTRUTURA, TABLA INTERNA O UNA REFERENCIA
    "" SE PUDEN USAR TANTO EN: PROGRAMAS ABAP, CLASES GLOBALES E INTERFACES GLOBALES EN LA SECCION PUBLICA
    "" HAY DOS OPCIONES PARA CREAR ESTRUCTURAS: LA FORMA LOCAL, LA CUAL PODEMOS HACER DENTRO DE NUESTRO CONTEXTO EN NUESTRO CODIGO FUENTE Y LA MENRA GLOBAL, CREADA DESDE EL DICCIONARIO DE DATOS

*    DATA ls_flight TYPE /dmo/flight.

***** DECLARANDO TIPO ESTRUCTURADO LOCAL "" SIEMPRE QUE ENCONTREMOS TYPES: ES PORQUE SE ESTA DECLARANDO UNO
    "" LO DE ABAJO ES UN TIPO LOCAL ESTRUTURADO.
*    TYPES: BEGIN OF lty_employee, ""TYPES NO RESERVA MEMORIA, SIMPLEMENTE FUNCIONA COMO UNA PLANTILLA QUE PUEDE SER USADA POSTERIORMENTE PARA DECLARAR VARIABLES
*             name  TYPE string,
*             id    TYPE i,
*             email TYPE /dmo/email_address,    ""NO SOLO SE PUEDEN USAR TIPOS ELEMENTALES O PRIMITIVOS, SI NO QUE TAMBIEN, PODEMOS USAR ELEMENTOS DEL DICCIONARIO DE DATOS, OSEA ELEMNTOS DE DATOS
*           END OF lty_employee.


***** DECLARACION DE UNA ESTRUTURA CON DATA, ES OTRA OPCION DE HACERLO Y FUNCIONA DE LA MISMA MANERA QUE LA DECLARACION CON TYPES, UNA DE LAS DIFERENCIAS QUE TIENE
***** ES QUE DENTRO DE DATA SE PUEDE INCLUIR EL VALOR DEL CAMPO MEDIANTE VALUE


*    DATA: BEGIN OF ls_employee, "" LA INSTRUCCION DATA SE UTILAZA PARA DECLARAR VARIABLES Y TABLAS INTERNAS, ESTA INSTRUCCION NO SOLO DEFINE EL TIPO DE LA VARIABLE COMO LO HACEMOS CON TYPE SI NO QUE TAMBIEN RESERVA MEMORIA PARA SU ALAMCENAMIENTO
*            name  TYPE string VALUE 'LAURA',
*            id    TYPE i,
*            email TYPE /dmo/email_address,
*          END OF ls_employee.

***** TAMBIEN SE PUEDE HACER:

*    DATA lt_employees TYPE TABLE OF lty_employee. ""ITAB, OSEA AQUI SE ESTA HACIENDO UNA TABLA LOCAL CON LA ESTRUCTURA ANTES DECLARADA, ES IMPORTANTE PONERLE TABLE OF PARA QUE RECONOZCA QUE ES UNA TABLA
*    DATA ls_emp TYPE lty_employee. ""STRUCTURE, AQUI SE HACEM UNA STRUCTURA LOCAL CON OTRA YA NATES DECLARADA

*    DATA ls_emp2 LIKE ls_employee. "" AQUI SE PUEDE USAR UNA ESTRUTURA YA DECLARADA NO UN UN TIPO LOCAL, POR ESO SE USO LA DECLRADA CON DATA Y NO EL TIPO LOCAL CON TYPES
    ""LIKE BASICAMENTE SE USA PARA QUE UN VARIABLE COMPARTA EL TIPO DE OTRA

*    DATA(ls_emp3) = ls_employee. ""AQUI EL EJEMPLO DE COMO SERIA CON UNA VARIABLE DECLRADA EN LINEA

*    DATA(ls_emp4) = VALUE lty_employee( name = 'MARIA' id = 1234 email = 'M@LOGALI.COM' ). ""ESTA E SUNA FORMA DE USAR UN TIPO LOCAL Y AGREGARLE DATOS CON UNA DECLARACION EN LINEA

********** NESTED STRUCTURE "" EN ESTAS ESTRUCTURAS AL MENOS UNO DE LOS COMPONENETES CONTIENE UNA SUBSTRUCTURA

*    DATA: BEGIN OF ls_empl_info,

*            BEGIN OF info,
*              id         TYPE i VALUE 12345,
*              first_name TYPE string VALUE 'LAURA',
*              last_name  TYPE string VALUE 'MARTINEZ',
*            END OF info,

*            BEGIN OF address,
*              city    TYPE string VALUE 'FRANKFURT',
*              street  TYPE stRING VALUE '123 MAIN STREET',
*              country TYPE string VALUE 'GERMNAY',
*            END OF address,

*            BEGIN OF position,
*              departament TYPE string VALUE 'IT',
*              salary      TYPE p DECIMALS 2 VALUE '2000.23',
*            END OF position,

*          END OF ls_empl_info.

*    out->wRIte( data = ls_empl_info name = 'EMPLOYEEE INFO' ). ""ASI SE ACCEDE A LA ESTRUTURA


**********DEEP STRUCTURE "" SON AQUELLAS QUE EN AL MENOS UNO DE SUS CAMPOS O COMPONENETES, SE TINE COMO TIPO UNA TABLA INTERNA, UN TIPO DE REFERENCIA, UNA CADENA ENTRE OTROS OBJETOS COMPUESTOS

    TYPES: BEGIN OF lty_flights,
             flight_date   TYPE /dmo/flight-flight_date,
             price         TYPE /dmo/flight-price,
             currency_code TYPE /dmo/flight-currency_code,
           END OF lty_flights.

*    DATA: BEGIN OF ls_flight_info, "" ESTA ES UNA ESTRUCTURA PROFUNDA PORQUE EN UNO DE SUS COMPONENETES TIENE UNA TABLA INTERNA A LA CUAL OPODEMOS ACCEDER A OTROS CAMPOS ADICIONALES
*            carrier    TYPE /dmo/flight-carrier_id VALUE 'AA',
*            connid     TYPE /dmo/flight-connection_id VALUE '0018',
*            lt_flights TYPE TABLE OF lty_flights WITH EMPTY KEY,
*          END OF ls_flight_info.

*    SELECT * ""ESTO ES PAA HACER RELLENAR LA ESTRUCTURA, Y EL * INDICA QUE QUIERES TOMAR TODOS LOS CAMPOS
*    FROM /dmo/flight
*    WHERE carrieR_id = 'AA' "" MEDIANTE ESTO SE LE AGREGA UN FILTRO O CONDICION PARA IR A ALGO MAS ESPECIFICO
* INTO CORRESPONDING FIELDS OF TABLE @ls_flight_info-lt_flights ""AQUI ES COMO DECIR, TRAEME LOS DATOS DE /DMO/FLIGHT QUE COINCIDAN CON LOS DATOS ANTES ESTRUTURADOS EN LT_FLIGHTS
* UP TO 4 ROWS. ""ESTO SE USA PARA TRAER UN NUMERO LIMITADO DE REGISTROS





*    out->wRIte( data = ls_flight_info name = 'LS_FLIGHT_INFO' ).


********** ACCESS ""OTRA FORMA DE AÑADIR DATOS A UNA ESTRUCTURA

*    DATA: BEGIN OF ls_flight_info,
*            carrier    TYPE /dmo/flight-carrier_id VALUE 'AA',
*            connid     TYPE /dmo/flight-connection_id VALUE '0018',
*            ls_flights TYPE lty_flights, ""AQUI LO CAMBIAMOS DE SE TABLA A ESTRUCTURA, SE HIZO PARA PODER RELLENARLO DE LA FORMA QUE SE HACE ABAJO,
*          END OF ls_flight_info.         ""YA QUE DE NO HACERLO NO SE PODRIA DEBIDO A HARIA PARTE DE UNA TABLA INTERNA Y SOLAMENTE LE ESTAMOS INGRESANDO UN REGISTRO A ESTE CAMPO

*    ls_flight_info-carrier = 'XX'.
*    ls_flight_info-connid = '0022'.
*    ls_flight_info-ls_flights-flight_date = cl_abap_context_info=>get_system_date( ). ""USAMOS LA CLASE PARA PONER LA FECHA DE HOY
*    ls_flight_info-ls_flights-currency_code = 'USD'.
*    ls_flight_info-ls_flights-price = '200'.

*    out->wRIte( data = ls_flight_info name = 'LS_FLIGHT_INFO' ).

**********ADD DATA

****OPRETAOR VALUE "" CON ESTE SE AÑADEN COSA TAMBIEN A UNA ESTRUCTURA

***NESTED STRUCTURE "" ASI SE HACE CON UNA ESTRUCTURA ANIDADA

*    DATA: BEGIN OF ls_empl_info,

*            BEGIN OF info,
*              id         TYPE i VALUE 12345,
*              first_name TYPE string VALUE 'LAURA',
*              last_name  TYPE string VALUE 'MARTINEZ',
*            END OF info,

*            BEGIN OF address,
*              city    TYPE string VALUE 'FRANKFURT',
*              street  TYPE stRING VALUE '123 MAIN STREET',
*              country TYPE string VALUE 'GERMNAY',
*            END OF address,

*            BEGIN OF position,
*              departament TYPE string VALUE 'IT',
*              salary      TYPE p DECIMALS 2 VALUE '2000.23',
*            END OF position,

*          END OF ls_empl_info.

*    ls_empl_info = VALUE #(
*    info = VALUE #( id = 123456 first_name = 'JUAN' last_name = 'MARTINEZ' )
*    address = VALUE #( city = 'MADRID' street = 'GRAN VIA' country = 'SPAIN' )
*    position = VALUE #( departament = 'FINANCE' salary = '2550' )      ).


*    out->wRIte( data = ls_empl_info name = 'LS_EMPL_INFO' ).

*    out->write( |\n| ). ""ESTO LO HCIMOS CON LA FINALIDAD DE HACER UN SALTO DE LINEA Y QUE NO SALGA TODO PEGADO

***DEEP STRUCTURE

*    DATA: BEGIN OF ls_flight_info,
*            carrier    TYPE /dmo/flight-carrier_id VALUE 'AA',
*            connid     TYPE /dmo/flight-connection_id VALUE '0018',
*            ls_flights TYPE lty_flights,
*          END OF ls_flight_info.

*    ls_flight_info = VALUE #( carrier = 'SP'
*    connid = '0035'
*    ls_flights = VALUE #( flight_date = cl_abap_context_info=>get_system_date(  ) ""AQUI TUVIMOS QUE ACCEDER DENTRO DE LA ESTRUTUCTURA QUE ESTABA DENTRO DE LA OTRA PARA METER DATOS
*                          currency_code = 'EUR'
*                          price = '200'                    )
*    ).


*    out->wRIte( data = ls_flight_info name = 'LS_FLIGHT_INFO' ).
*    out->write( |\n| ).

*****LOCAL STRUCTURE DECLARED IN LINE

* DATA(LS_FLIGHT2) = VALUE lty_flights( currency_code = 'USD' ). ""AQUI TUVIMOS QUE ESPECIFICAR EL DATO QUE SE VA A USAR PORQUE ESTAMOS USANDO UNA TIPO LOCAL Y NO UNA ESTRUTURA DECLARADA YA EN EL CODIGO

*    out->wRIte( data = ls_flight2 name = 'LS_FLIGHT2' ).


**********DELETE

    SELECT SINGLE FROM /dmo/flight
    FIELDS *
    WHERE carrier_id EQ 'LH'
    INTO @DATA(ls_flight2).

    out->write( data = ls_flight2 name = 'LS_FLIGHT2' ).

    CLEAR ls_flight2-connection_id.
    out->write( data = ls_flight2 name = 'LS_FLIGHT2' ).

    CLEAR ls_flight2.
    out->write( data = ls_flight2 name = 'LS_FLIGHT2' ).


  ENDMETHOD.
ENDCLASS.
