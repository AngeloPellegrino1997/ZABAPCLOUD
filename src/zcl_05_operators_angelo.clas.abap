CLASS zcl_05_operators_angelo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_05_operators_angelo IMPLEMENTATION.

 METHOD if_oo_adt_classrun~main.

*    DATA: lv_num_a TYPE i VALUE 10,
*          lv_num_b TYPE i VALUE 15,
*          lv_total TYPE p LENGTH 6 DECIMALS 2.
*
*    "+ SUMA
*    lv_total = lv_num_a + lv_num_b.
*
*    out->write( |Number a { lv_num_a } Number b { lv_num_b } Total = { lv_total }| ).
*
*    "ADD 'ESTA ES UNA OPERACION ANTIGUO POR LO TANTO SU USO ESTA DESCONTINUADO, PERO ES BUENO SABERLA.
*    ADD 5 TO lv_total.
*    out->write( |TOTAL ADD = { lv_total }| ).
*
*    "+=
*    lv_total += 5.
*
*    out->write( |TOTAL += = { lv_total }| ).
*
*    lv_total = lv_num_a + lv_num_b + lv_total. "incluso aqui se toma en cuenta la misma variable lv_local.
*
*    out->write( |TOTAL TOMANDO EN CUENTA TOTAL = { lv_total }| ).
*
*    CLEAR lv_total.
*
*    out->write( |TATAL CLEARED = { lv_total }| ).

**** RESTA

*    lv_total = lv_num_a - lv_num_b.
*
*    DATA(lv_total2) = lv_num_b - lv_num_a.
*
*    out->write( lv_total2 ).
*
*    out->write( lv_total ).
*
*    "SUBTRACT 'ESTA ES UNA OPERACION ANTIGUO POR LO TANTO SU USO ESTA DESCONTINUADO, PERO ES BUENO SABERLA.
*    SUBTRACT 2 FROM lv_total2.
*    out->write( lv_total2 ).
*
*    "-=
*    lv_total -= 2.
*    out->write( lv_total ).ç

**** MULTIPLICACION

*    lv_total = lv_num_a * lv_num_b.
*
*    out->write( lv_total ).
*    "MULTIPLY
*    MULTIPLY lv_total BY 5.
*    MULTIPLY lv_num_a BY lv_num_b.
*
*    out->write( lv_total ).
*    out->write( lv_num_a ).

**** DIVISION
    "lv_total = lv_num_a / lv_num_b.
*
*    out->write( lv_total ).
*
*    "DIVIDE
*    DIVIDE lv_num_a BY 2.
*    out->write( lv_num_a ).
*
*    CLEAR lv_total.
*    CLEAR lv_num_a.
*    out->write( |ESTE ES EL VALOR DE A CLEARED : { lv_num_a }| ).
*
*
*    lv_total = ( lv_num_a + lv_num_b ) / 2.
*    out->write( lv_total ).
****DIV "ESTO PERMITE OBTENER EL RESULTADO DE UNA DIVISION EN NUMERO ENTERO, ES DECIR, SIN RESTO.
*    lv_num_a = 9.
*    lv_num_b = 2.
*
*    lv_total = lv_num_a / lv_num_b.
*    out->write( |TOTAL ES IGUAL: { lv_total }| ).
*    lv_total = lv_num_a DIV lv_num_b.
*    out->write( |EL RESULTADO ENTERO DE TOTAL ES IGUAL: { lv_total }| ).

****MOD "ESTO PERMITE VER EL RESTO DE UNA DIVISION.
*    lv_num_a = 9.
*    lv_num_b = 2.
*
*    lv_total = lv_num_a / lv_num_b.
*    out->write( |TOTAL ES IGUAL: { lv_total }| ).
*    lv_total = lv_num_a MOD lv_num_b.
*    out->write( |EL RESULTADO DEL RESTO DE TOTAL ES IGUAL: { lv_total }| ).

*****EXPONENCIACION
*lv_num_a = 3.
*out->write( |Number a: { lv_num_a }| ).
*lv_num_a = lv_num_a ** 2.
*out->write( |Number a Exponenciado: { lv_num_a }| ).
*CLEAR lv_num_a.
*lv_num_a = 3.
*DATA(lv_exp) = 3.
*lv_num_a = lv_num_a ** lv_exp.
*out->write( |EL RESULTADO DE NUMBER A ELEVADO A EXP: { lv_num_a }| ).
*"IPOW
*DATA(result) = IPOW( base = 2 exp = 3 ).
*out->write( result ).

****RAIZ CUADRA O CONOCIDA EN ABAP COMO SQRT.
*lv_num_a = sqrt( 25 ).
*out->write( |TOTAL SQRT: { lv_num_a }| ).

*lv_num_a = 9.

*lv_num_a = SQRT( lv_num_a ).

*out->write( |TOTAL SQRT: { lv_num_a }| ).

********* CONVERSIONS

*    DATA: lv_string TYPE string VALUE 'LOGALI', "ESTA VARIABLE ERA NATES UNA CADENA DE NUMEROS PERO SE CAMBIO A LETRAS PARA VER EL ERROR DE COMPATIBILIDAD
*          lv_int    TYPE i,
*          lv_char   TYPE c LENGTH 2,
*          lv_num    TYPE n LENGTH 6.

*    DATA: lv_date    TYPE d,
*          lv_decimal TYPE p LENGTH 3 DECIMALS 2.

*    lv_int = lv_string."estos datos son claramente compatibles debido a que la cadena es una cadena de numeros y l otra variable es del tipo entero

*    out->write( lv_int ).

*    lv_string = '12345678'."AQUI HUBO UN ERROR POR PASAR LA LONGITUD DE LA VARIABLE A LA CUAL SE ASIGNO
*    lv_decimal = lv_string.

*    lv_date = cl_abap_context_info=>get_system_date( ).
*    out->write( lv_date ).

*    lv_int = lv_date.
*   out->write( lv_int ).

*    lv_string = 'A1B2C3'.
*    lv_num = lv_string.
*    out->write( lv_num ).


    """""""""'

*    lv_string = '20250101'.
*   lv_date = lv_string.
*
*    out->write( lv_string ).
*    out->write( | DATE { lv_date DATE = USER }| ).

********** TRUCATION AND ROUNDING

*    lv_char = lv_string.
*    out->write( lv_char )."AQUI HUBO UN TRUNCAMIENTO PORQUE LA LONGITUD DE lv_char NO DA PARA ALMACENAR TODO LO QUE TIENE lv_string

**********ROUNDING

*    lv_decimal = 1 / 6.
*    out->write( lv_decimal )."AQUI REDONDIO EL DECIMAL DEBIDO A LA LONGITUD DE LA VAR, MIENTRAS MAS LONGITUD ESTA TENGA MAS DECIMALES TE DA Y MENOS REDONDEA

***********IN LINE DECLARATONS

*    DATA(lv_multi) = 8 * 16.
*    out->write( lv_multi ).

*    DATA(lv_div) = 8 / 16.
*    out->write( lv_div ).

*    DATA(lv_text) = 'ABAP I - 2025'.
*    out->write( lv_text ).

*    DATA(lv_dec) = '10.254'.
*    out->write( lv_dec ).

*************FORCED TYPE CONVERSIONS CONV

*    DATA(lv_date_inv) = '20250101'."ESTA VARIABLE EN EL DEBUG ES TOMADA COMO TIPO CARACTER Y LA QUEREMOS DEL TIPO DATE
*    out->write( lv_date_inv ).

*    DATA(lv_date_inv2) = CONV d( lv_date_inv )."SE ASI USANDO LA PLABRA CLAVE conv() Y DENTRO DE PARENTESISI SE PONE LA VAR A LA CUAL SE VA TOMAR EL VALOR Y SE LE VA A CONVERTIR
*    out->write( | { lv_date_inv2 DATE = USER }|  ).

**************DATE AND TIME

*    DATA: lv_date  TYPE d VALUE '20250101',
*          lv_date2 TYPE d VALUE '20250622',
*         lv_time  TYPE t,
*          lv_time2 TYPE c LENGTH 6.

*    DATA(lv_month) = lv_date+4(2)."aAQUI ESTAMOS ACCEDIENDO A UNA PARTE ESPECIFIFCA DE LA VARIABLE EL 4 INDICA EL NUMERO DE DESPLAZAMIENTO Y EL 2 DICE CUANTAS POSICIONES QUEREMOS TOMAR
*   out->write( lv_month  ).
*    DATA(lv_year) = lv_date+0(4)."TAMBIEN COMO NO HAY DESPLACE SE PUEDE OBVIAR EL 0
*    out->write( lv_year ).
*    DATA(lv_day) = lv_date+6(2).
*    out->write( lv_day ).
*    DATA(lv_days) = lv_date2 - lv_date.
*    out->write( lv_days ).

*    lv_date = cl_abap_context_info=>get_system_date( ).
*    lv_time = cl_abap_context_info=>get_system_time( ).
*    lv_time2 = cl_abap_context_info=>get_user_time_zone(  ).

*    out->write( lv_date ).
*    out->write( lv_time ).
*    out->write( lv_time2 ).

****************UTCLONG"ESTE DATO PROVIENE DEL TIPO PRIMITIVO D, ES DECIR, ESTE VA A MANEJAR FECHAS SOLO QUE UN FORMATO DIFERENTE
    "PRIMEROS DIJISTOS SERA LA FECHA LUEGO MEDIANTE UN SEPARADOR SERA LA HORA O TIEMPO Y POR ULTIMO CARACTERES QUE RESPRESENTAN LA ZONA HORARIA

    DATA: lv_time1 TYPE utclong,
          lv_time2 TYPE utclong.

*    lv_time1 = utclong_current(  )."utclong_current() ACCEDE LA HORA ACTUAL DEL SERVIDOR DE APLICACIONES
*    out->write( lv_time1 ).

*    lv_time1 = utclong_add( val = lv_time1 days = 1 hours = -1 )."AQUI ESTAMOS SUMANDO Y RESTANDO, UNA CUALIDAD QUE TIENE ESTE TIPO DE DATOS
*    out->write( lv_time1 ).

*    lv_time1 = utclong_current(  ).
*    lv_time2 = utclong_current(  ).

*    lv_time2 = utclong_add( val = lv_time2 hours = -5 ).

*    DATA(lv_total) = utclong_diff( high = lv_time1 low = lv_time2 )."AQUI SE ESTA RESTANDO LOS VALORES DE UNA VAR A LA OTRA
*    out->write( lv_total ).

**********TEXT SYMBOLS: Son elmentos utilizados para gestionar y mostrar textos de manera dinamica en lo programas, estos permiten definir y ultilizar textos en multiples idiiomas, facilitando la traduccion


*    out->write( TEXT-001 )."asi se accede a un simbolo de texto
*    out->write( 'THIS IS YOUR FIRST TEXT SYMBOL'(msg) ). "la otra forma de acceder es colocando el id dentro de ()
*    out->write( TEXT-pen ).

    "CON CTR + 1 PODEMOS ANADIR COSA Y QUITAR COSAS A LOS SIMBOLOS DE TEXTO

**********PARAMETERS: Despues de ver los tipos de funciones que se puedne usar para realizar operations con cadenas de caracteres, ahora debemos conocer los parametros que podemos encontra dentro de estas funciones

*    DATA lv_text TYPE string VALUE 'LOGALI'.
*    DATA(lv_string) = find( val = lv_text sub = 'GA' case = abap_true occ = 2  ).

* find(). : Es el agregado que se utiliza para poner parametros dentro de los(). nos devulve la posicion de una coincidencia especifica en la cadena de caracters
** val = : Con este parametro podemos parasarle una variable cuyo contenido va a ser evaluado.
** sub = : Con este indicamos los caracteres o el patron que se desea buscar o insertar, dependiendo de la operacion de nuestra funcion.
** case = : Este se utiliza para anular o no la distintsion de caracteres en mayuscula o minuscula, esto usa valores del tipo ABAPBUL, es decir: X o VACIO, VERDARO, FALSO. Por defecto este siempre esta en abap_false.
** occ = : En este se va a indicar la pocision u ocurrencia de un cohincidencia, se debe tener en cuenta las
** siguentes reglas: por ejemplo las ocurrencias cuentan desde la izquierda y luego van modificando hacia la derecha si el occ el positivo y si el occ es negativo es lo contrario.
** off = : EN ESTE SE ESPECIFICA ALGUN DESPLAZAMIENTO, DESDE DONDE SE QUIERE EMPEZAR A LEER, EL VALOR PREDERTERMINADO ES 0, CON ESTE SE VA A INDICAR CON QUE OCURRENCIA SE EMPIEZA LA BUSQUEDA
** len = A ESTE SE LE PASA EL TAMANO O NUMNERO DE POSICIONES QUE SE QUIERE TOMAR DENTRO DE LA CADENA DE CARACTERES.

**********FUNCIONES DE LONGITUD: NUMOFCHAR() AND STRLEN ()

*    DATA(lv_num) = strlen( '  LOGALI  ' )."strlen() es usada para saber la longitud de una cadena de caracteres
*    out->write( lv_num ).

*    lv_num = numofchar( '  LOGALI  ' )."numofchar() esta evalua la longitud orginal de la cadena, contado los espacios en blanco al finalizar los carcteres
*    out->write( lv_num ).

**********FUNCIONES COUNT: con estas se puede saber el numero de ocurrencias o coincidencias que se obtienen en una busqueda dentro de una cadena de carcateres

*    DATA lv_string TYPE string VALUE '  LOGALI Local  '.

*    lv_num = count( val = lv_string sub = 'LO' ).
*    out->write( lv_num )."Aqui arroja una sola coincidencia debido a que sub diferencia mayusculas de minisculas

*    lv_num = count_any_of( val = lv_string sub = 'LO' ).
*    out->write( lv_num )."Este arrojo resultado de 4 debido a que evaluo L y O por separado, lo cual la L se presenta 3 veces y la O 1.

*    lv_num = count_any_not_of( val = lv_string sub = 'LO' ).
*    out->write( lv_num )."Este devolvio todos los cracteres que no coinciden, sin tomar en cuenta los ultimos dos espacios en blancos.

*********FUNCIONES FIND: Esta arroja como resultado la posicion de una coincidencia especifica en la cadena de caracters

*    lv_num = find( val = lv_string sub = 'LI' )."Este arrojo 6 debido a que desde ese numero empieza la coincidencia.
*    out->write( lv_num ).

*    lv_num = find_any_of( val = lv_string sub = 'LI' )."Este arroja 2 ya que en esa posicion se encuntre una de las letras buscadas la cual es la L
*    out->write( lv_num ).

*    lv_num = find_any_not_of( val = lv_string sub = 'LI' ).
*    out->write( lv_num )."Este devolvio 0 debido a que desde esa posicion no se encutra la coincidencia LI.

**********PROCESSING FUNCTIONS

    DATA lv_string TYPE string VALUE ' ¡LOGALI GROUP! Welcome to ABAP Cloud Master '.

*****MAYUS minus
    out->write( |TO_UPPER         = { to_upper( lv_string ) }| )."pone todo en mayucula
    out->write( |TO_LOWER         = { to_lower( lv_string ) }| )."pone todo en minuscula
    out->write( |TO_MIXED         = { to_mixed( lv_string ) }| )."
    out->write( |FROM_MIXED         = { from_mixed( lv_string ) }| )."anade un seprador y las pone en mayusucla

*****ORDER
    out->write( |REVERSE         = { reverse( lv_string ) }| )."Esta pone todo al reves
    out->write( |SHIFT_LEFT (places)       = { shift_left( val = lv_string places = 5 ) }| )."Esta hace un desplazamiento dependiedo del numeor que indiquemos, en este caso lo hace a la izquierda.
    out->write( |SHIFT_RIGHT (places)       = { shift_right( val = lv_string places = 5 ) }| )."Esta lo mismo pero a la derecha.
    out->write( |SHIFT_LEFT (circ)       = { shift_left( val = lv_string circular = 5 ) }| )."Este hace lo mismo solo que no elimina caracdteres y en su lugar los pone del lado contrario al que se hizo el shift.
    out->write( |SHIFT_RIGHT (circ)       = { shift_right( val = lv_string circular = 5 ) }| ).

*****SUBSTRING
    out->write( |SUBSTRING       = { substring( val = lv_string off = 9 len = 6 ) }| )."Esta toma en cuenta los caracteres que estan en un parametro que nosotor s pasemos, en este caso se empieza tomar desde la posicion 9 y se toman en cuenta 6 posiciones
    out->write( |SUBSTRING_FROM       = { substring_from( val = lv_string sub = 'ABAP' ) }| )."Este trabaja desde el caracter que indicamos hacia adelante
    out->write( |SUBSTRING_AFTER       = { substring_after( val = lv_string sub = 'ABAP' ) }| )."Este toma en cuenta los caracteres despues del caracter indicado
    out->write( |SUBSTRING_TO       = { substring_to( val = lv_string sub = 'ABAP' ) }| )."Este trabaja con todos los caracteres hasta el indicado
    out->write( |SUBSTRING_BEFORE      = { substring_before( val = lv_string sub = 'ABAP' ) }| )."Este trabaja con todos los caracteres depsues del indicado

*****OTHERS
    out->write( |CONDENSE      = { condense( val = lv_string ) }| )."Este quita todos los espacios de sobra o vacios en una cadena
    out->write( |REPEAT      = { repeat( val = lv_string occ = 2 ) }| )."Este repite una cadena, mediante el occ se indica las veces que se quiere repetir
    out->write( |SEGMENT1      = { segment( val = lv_string sep = '!' index = 1 ) }| )."Este separa la cadena apartir de un caracter previamente indicado por sep = y en el index se asgina la parte separada que se quiere guardar
    out->write( |SEGMENT2      = { segment( val = lv_string sep = '!' index = 2 ) }| ).

**********CONTAINS FUNCTIONS

    DATA: lv_text    TYPE string,
          lv_pattern TYPE string.

    lv_text = 'The employee`s number is: 123-456-7890'.
    lv_pattern = '\d{3}-\d{3}-\d{4}'."Phone Number

    IF contains( val = lv_text pcre = lv_pattern )."En el parametro pcre se puede pasar la expresion regular que necesitamos buscar en la cadena de caracteres
      out->write( 'The text contains a phone number' ).
    ELSE.
      out->write( 'The text doesn`t contain a phone number' ).
    ENDIF.


    ENDMETHOD.




















ENDCLASS.
