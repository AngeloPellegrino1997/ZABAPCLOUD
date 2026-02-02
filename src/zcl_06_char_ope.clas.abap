CLASS zcl_06_char_ope DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_06_char_ope IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    DATA lv_string TYPE string.
*    DATA lv_char(4) TYPE c. ""AQUI LA LONGITUD DE LA VAIABLE HA SIDO ASIGNADA POR MEDIO DEL PARETESIS, SIN USAR LENGHT
*    DATA lv_char_1 TYPE c.""EN ESTE CASO, YA QUE A LA VARIABLE NO SE LE ASIGNO UNA LONGITUD, EL COMPILADOR LA PONE POR DEFECTO EN 1
*    DATA lv_char_2. ""EN ESTE CASO HEMOS DECLARADO UNA VARIABLE CUYO TIPO Y LONGITUD ESTAN AUSENTES, POR DEFECTO SERA TOMADA COMO UNA TIPO c Y DE LONGITUD 1


*    DATA: lv_n TYPE n LENGTH 20 VALUE '1234562'.

********** Concatenate

    DATA: lv_string_a TYPE string VALUE 'Welocome        to Logali        Group',
          lv_string_b TYPE string.

***** &&

*    lv_string_b = 'ABAP' && ` ` && 'Student'.

*    CONCATENATE lv_string_a lv_string_b INTO DATA(lv_fin_string) SEPARATED BY space.

*    out->write( | Concatenacion 1: { lv_fin_string } | ).

*    CONCATENATE 'x ' 'y ' 'z ' INTO DATA(lv_string_c) RESPECTING BLANKS. ""ES MUY IMPORTANTE AGREGAR EL RESPECTING BLANKS, PARA QUE ESE RESPTE LO ESPACIOS

*    out->write( | Concatenacion 2: { lv_string_c }| ).

*    DATA(lv_fin_string2) = | Concatenacion 3: { lv_string_a } / { lv_string_b } |.

*    out->write( lv_fin_string2 ).


********* CONCAT_LINES_OF ""SIRVE PARA CONCATENAR LINEAS O REGISTROS DE UNA TABLA INTERNA.

*    SELECT FROM /dmo/flight ""USAMOS UNA TABLADE DATOS A LA CUAL LE VAMOS A EXTRAER INFOMACION
*    FIELDS carrier_id ""PONEMOS LA INFORMACION ESPECIFICA QUE QUEREMOS
*    INTO TABLE @DATA(lt_itab). ""Y LUEGO ESA INFORMACION DE GUARDA EN UNA TABLA LOCAL/INTERNA

*    DATA(lv_string_itab) = concat_lines_of( table = lt_itab sep = ` ` ).""EL sep, AQUI ES OPCIONAL LO QUE HACE ES ES PONER UN SEPRADOR DEPENDE DE NOSOTROS ASIGNARLO

*    out->write( lv_string_itab ).

**********CONDENSE ""TERMINO QUE SE USA PARA ELIMINAR ESPACIOS EN BLANCO DENTRO DE LAS CADENAS DE CARACTERES

*    out->write( lv_string_a ).

*    CONDENSE lv_string_a.
*    CONDENSE lv_string_a NO-GAPS. "" EL NO-GAPS L QUE HACE ES ELIMINAR CUALQUIER ESPACIO EN BLANCO.

*    out->write( lv_string_a ).

*****CONDENSE() ""ESTA ELIMINA LOS ESPACIOS INNECESARIOS

*    lv_string_a = 'Welcome     to Logali       Group'.

*    lv_string_a = condense( lv_string_a ).
*    lv_string_a = condense( val = lv_string_a from = ` ` ). ""EL FROM LO QUE HACE ES ELIMINAR ESPACIOS INICIALES Y FINALES, QUE SON INNECESARIOS.
*    lv_string_a = condense( val = lv_string_a to = `` ). ""EL TO ELIMINA TODOS LOS ESPACIOS DENTRO DE LA CADENA DE CARACTERES.
*    out->write( lv_string_a ).

*    lv_string_a = condense( val = '!!!ABAP!!!Course!!!' del = '!' ). ""CON EL del LO QUE HACEMOS ES DARLE ALGO PARA ELIMINAR EN LA CADENA DE CARACTERES, OJO, SOLO ELIMINA INICIO  FINAL
*    out->write( lv_string_a ).

**********SPLIT ""SE USA PARA DIVIDIR CADENA D CARACTERES EN VARIOS BLOQUES O SEGMENTOS

*    DATA(lv_string1) = 'Logali-Group-SAP-Academy'.

*    SPLIT lv_string1 AT '-' INTO DATA(lv_word1) "" AT SIRVE PARA ESPECIFIFCAR  PARTIR DE DODE SE VA  A CORTAR, DEBEMOS CREAR TANTAS VARIABLES COMO NUMEROS DE SEGMENTOS TENGAMOS.
*                                 DATA(lv_word2)
*                                 DATA(lv_word3)
*                                 DATA(lv_word4).

*    out->write( lv_word1 ).
*    out->write( lv_word2 ).
*    out->write( lv_word3 ).
*    out->write( lv_word4 ).

*****SEGMENT

*   lv_word3 = segment( val = lv_string1 index = 3 sep = '-' ). ""AQUI INDEX S LA POSICION DEL SEGMENTO QUE QUEREMOS.

*    out->write( lv_word3 ).

**********SHIFT ""ESTA ES USADA PARA DESPLAZAR UNA CADENA DE CARACTERES, YA SEA A LA IZUQIERDA O DERECHA.

*    CONSTANTS gc_initial(10) TYPE c VALUE '    ABC123'.

*    DATA(gv_final_str) = gc_initial.

*    out->write( | Initial value { gv_final_str } | ).

*    SHIFT gv_final_str. "" ESTA SOLO ELIMINA UN ESPACIO YA QUE NO SE ESPECIFICO.
*    SHIFT gv_final_str BY 8 PLACES. "" AQUI SE ESPECIFICA CUANTOS ESPACIOS, MAS NO SI A LA IZQUIERDA O DERECHA, POR DFECTO L HACE A LA IZQUIERDA.
*    SHIFT gv_final_str BY 3 PLACES RIGHT. "" AQUI SE ESPECIFICA LA DIRECCION.
*    SHIFT gv_final_str RIGHT DELETING TRAILING '123'. "" AQUI ELIMINAMOS CARACTERES ESPECIFICOS.
*    SHIFT gv_final_str LEFT DELETING LEADING space. ""AQUI ESTAMOS ELIMNANDO ESPECIFICAMENTE LOS ESPACIOS A LA IZQUIERDA



*    out->write( | Initial value { gv_final_str } | ).


**********SHIFT FUNCTION

*    gv_final_str = shift_right( val = gv_final_str places = 2 ).
*    gv_final_str = shift_left( val = gv_final_str places = 2 ).

*    gv_final_str = shift_right( val = gv_final_str circular = 5 ).
*    gv_final_str = shift_left( val = gv_final_str circular = 5 ).


*    out->write( gv_final_str ).

*    gv_final_str = gc_initial.

*    gv_final_str = shift_right( val = gv_final_str sub = '123' ). "" LO QUE LE ESTAMOS DICEINDO AQUI ES QUE ELIMINE LOS VALORES ESPECIFICADOS EN EL sub

*    out->write( gv_final_str ).


*    gv_final_str = gc_initial.

*    gv_final_str = shift_right( val = gv_final_str ). ""AL NO DARLE UN VALOR AQUI, AUTOMATICAMENTE BORRA TODOS LOS ESPACIOS A LA IZQUIERDA.

*    out->write( gv_final_str ).


********** STRLEN Function "" DETERMINA LA LONGITUD EN UNA CADENA DE CARACTERES

*    DATA lv_lenght TYPE c LENGTH 6.

*    lv_lenght = strlen( 'Logali Group   ' )."" NO CUENTA LOS ESPACIOS EN BLANCO A LA IZQUIERDA O DERECHA.
*    out->write( lv_lenght ).

*    DATA(lv_lenght2) = strlen( `Logali Group   ` )."" EN ESTE CASO SI CONTO LOS ESPCIOS EN BLANCO YA QU LAS COMILLAS USADAS SON DEL TIPO STRING
*    out->write( lv_lenght2 ).


***** NUM OF CHAR

*    lv_lenght = numofchar( 'Logali Group   ' ).
*    out->write( lv_lenght ).


*    lv_lenght2 = numofchar( `Logali Group   ` ).
*    out->write( lv_lenght2 ).


********** LOWER / UPPER

*    DATA(lv_invoice) = to_upper( 'abcdexyec' ).
*    out->write( lv_invoice ).

*    lv_invoice = to_lower( 'INVaXXYYZz' ).
*    out->write( lv_invoice ).

***** TRANSLATE

*    lv_invoice = '123clientinv02'.
*    TRANSLATE lv_invoice TO UPPER CASE.
*    out->write( lv_invoice ).

*    lv_invoice = '123clientinv02'.
*    TRANSLATE lv_invoice TO LOWER CASE.
*    out->write( lv_invoice ).

*    lv_invoice = to_upper( lv_invoice ). "" ESTE FUE HECHO PARA DEMOSTRAR QUE TAMBIEN SE PUEDE TRAER VARIABLES
*    out->write( lv_invoice ).

********** INSERT/REVERSE

*    DATA(lv_ins_string) = insert( val = '123CLIENT02' sub = 'INV' off = 3 ). "" AQUI CON sub SE LE AGREGO EL INV Y CON off SE LE DIJO LA POSICION QUE SE QUERIA PONER.
*    out->write( lv_ins_string ).

*    lv_ins_string = '123CLIENT02'.
*    lv_ins_string = insert( val = lv_ins_string sub = 'INV' )."" NO SE LE ESPECIFICO LA POSICON DONDE SE IBA A PONER EL INV, ASI QUE LO TOMO COMO 0

*    out->write( lv_ins_string ).

***** REVERSE "" ESTA CAMBIA EL ORDEN DE LS CARACTERES

*    lv_ins_string = reverse( lv_ins_string ).
*    out->write( lv_ins_string ).


**********OVERLAY

*    DATA(lv_company) = '-------------------> Logali Group'.
*    DATA(lv_name) = 'ABAP_Class                           '.

*    OVERLAY lv_name WITH lv_company.""ESTO LO QUE HACE ES HACER UNA SUPERPOSICON Y BORRA TANTOS CARACTERES COMO LA SUPERPOSICION TENGA
*    out->write( lv_name ).""S ME FIJO AQUI, NOTO LA CANTIDAD DE CARACTEREES QUE BORRO

*    DATA(lv_string) = 'a.b.c.a.b.c.A'.
*    DATA(lv_string2) = 'z.x.y.Z.x.y.z'.

*    OVERLAY lv_string WITH lv_string2 ONLY 'ab'. ""EL ONLY SE USA PARA PASAR LOS PARAMETROS QUE QUEREMOS SUSTITUIR, ESTO ES SENSIBLE A MAYUSCULAS
*    out->write( lv_string ).

**********SUBSTRING ""SE USA PARA EXTRAER CADENAS DE TEXTO

*    lv_string_a = 'LOGALI GROUP'.
*    out->write( lv_string_a ).

*    lv_string_a = substring( val = lv_string_a off = 7 len = 4 ). "" off DETERMIAN LA POSICION DE DONDE SE TOMANA CARACTERES Y LEN LA CANTIDAD DE CARACTERES.
*    out->write( lv_string_a ).

*    lv_string_a = 'LOGALI GROUP'.
*    lv_string_a = substring_from( val = lv_string_a sub = 'GA' len = 6 )."" AQUI SE LE AGREGA sub, SE USA PARA ESPECIFICAR UN PARAMETRO O PATRON DE BUSQUEDA
*    out->write( lv_string_a ).

*    lv_string_a = 'LOGALI GROUP'.
*    lv_string_a = substring_after( val = lv_string_a sub = 'GA'  ).
*    out->write( lv_string_a ).

*    lv_string_a = 'LOGALI GROUP'.
*    lv_string_a = substring_before( val = lv_string_a sub = 'GA'  ).
*    out->write( lv_string_a ).


*********FIND ""SE USA PARA BUSQUEDAS ESPECIFICAS DENTRO D CADENAS DE CARACTERES

*    lv_string_a = 'ABAP Student'.
*    out->write( lv_string_a ).

*    DATA(lv_pos) = find_any_of( val = lv_string_a sub = 'x5234e' ).

*    lv_pos = sy-fdpos + 1. ""EN ESTO PARECE QUE LE AGREGO UN NUMERO PARA QUE EL CONTEO EMPIECE DESDE EL 1 Y NO DESDE EL 0, PERO NO SE SI ESTO ES ALGO ESTANDAR

*    out->write( lv_pos ).

*    lv_pos = find_any_of( val = lv_string_a sub = 'zwq85x' ).""ESTE VA A ARROJAR UN VALR -1 YA QUEESE ES EL VALO QUE TIRA CUANDO NO ENCUENTRA NINGUNA REALCION
*    out->write( lv_pos ).

*****REGEX  ""ES UN NUEVO TERMINO QUE SE PUEDE APLICAR COMO UN PATRON DE BUSQUEDA, UN POCO MAS GENERALIZADO

*    DATA: lv_string_c TYPE string VALUE 'ERP # 1 a nivel mundial desde 1972*****',
*          lv_regex    TYPE string VALUE '[0-9]'.


*    DATA(lv_find) = find( val = lv_string_c regex = lv_regex  ). ""EN regex, SE PUEDE PONER VARIABLE O DIRECTAMENTE UN PATRON DE BUSQUEDA
*    out->write( lv_find ).


*    FIND ALL OCCURRENCES OF '#' IN lv_string_c MATCH COUNT DATA(lv_count). ""CON ESTE TE DICE LAS DE VECES QUE SE ENCUENTRA LA OCURRENCIA EN EL CODIGO
*    out->write( lv_count ).

*    lv_count = count( val = lv_string_c sub = '*' ).""ESTO ES HACER LO MISMO DE ARRIBA PERO MEDINATE LA FUNCION.
*    out->write( lv_count ).



*********REPLACE
*    DATA(lv_replace) = 'Logali-Group-SAP-Academy'.
*    DATA(lv_sign) = '-'.""ESTA VARIABLE FUE CREADA CON LA FINALIDAD DE PONER EL VALOR QUE SE QUERIA REMPLAZAR
*    out->write( lv_replace ).

*    REPLACE lv_sign WITH '/' INTO lv_replace.""AQUI CON ESTA SENTENCIA SOLO SE REMPLAZARA EL PRIMER VALOR ENCONTRADO QUE COINCIDA CON EL QUE SE QUIERE QUITAR

*    out->write( lv_replace ).

*    REPLACE ALL OCCURRENCES OF lv_sign IN lv_replace WITH '/'.""EN ESTA SENTENCIA, SE REMPLAZA TODO LOS QUE COINCIDAN

*    out->write( lv_replace ).

****MEDIANTE LA FUNCION replace()

*    lv_replace = replace( val = lv_replace sub = lv_sign with = '/' occ = 0 ). ""occ QUIERE DECIR DESDE QUE NUMERO DE OCURRENCIA, SE VA A EMPEZAR A SUSTITUIR EL VALOR
*    out->write( lv_replace ).


*    lv_replace = replace( val = lv_replace with = '#' off = 5 len = 3 ).
*    out->write( lv_replace ).


**********COMPARISON OPERATORS

*****CP "" CP SIGNIFICA: CONTIENE EL PATRON

*    DATA lv_match TYPE abap_bool. "" EL TIPO abap_bool, TOMA VALORES VERDEROS O FALSOS

*    DATA(lv_text) = 'This is an example text for SAP_ABAP programming'.

*    IF lv_text CP '*SAP#_*'. "" CON LOS * QUIERE DECIR QUE VA A TOMAR CUALQUIR SECUENCIA DE CARACTERES, INCLUIDOS ESPACIOS EN BLANCO Y EL # QUIERE DECIR QUE EL SIGUENTE CARACTER DEBE REALIZAR UNA COMPARACION EXACTA ES DECIR,SI O SI DEBE ESTAR PRESENTE.
*      lv_match = abap_true.
*      out->write( 'The text contains the pattern "SAP"' ).
*    ELSE.
*      lv_match = abap_false.
*      out->write( 'The text does not contain he pattern "SAP"' ).
*    ENDIF.


*****NP "" NP SIGNIFICA: NO CONTIENE EL PATRON

*    DATA lv_match TYPE abap_bool.

*    DATA(lv_text) = 'This is an example text for SAP_ABAP programming'.

*    IF lv_text NP '*g+'. "" AQUI LO UQE SE BUSCA ES ESPCIFICAMENTE ESE PATRON DE g+, REPRESENTANDO EL + CUALQUIERE TIPO DE CARACTER DESPUES DE LA g, PARA TOMAR EN CUENTA LOS ANTES D LA g SE AGREGA EL *
*      lv_match = abap_true.
*      out->write( 'The text does not contains the pattern "g"' ).
*    ELSE.
*      lv_match = abap_false.
*      out->write( 'The text contain he pattern "g"' ).
*    ENDIF.


**********PCRE REGEX "" PCRE SIGNIFICA: PER COMPATIBLE REGULAR EXPRESSIONS

    DATA(lv_pcre) = '^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$'. ""AL CONTENIDO DE ESTO SE LE LLAMA EXPRESION REGULAR

    DATA(lv_email) = 'alumno@logali.com'.

*    FIND REGEX lv_pcre IN lv_email. ""ESTA HACE LOS MISMO SOO QU ESTA OBSOLETO

*    FIND PCRE lv_pcre IN lv_email.

*    IF sy-subrc EQ 0. ""sy-algo SON VARIABLES HECHAS POR EL SISTEMA
*      out->write( 'OK' ).
*    ELSE.
*      out->write( 'NO OK' ).
*    ENDIF.

*    DATA(lv_text) = '123A?*Z100004#~$_AA'.

*    REPLACE ALL OCCURRENCES OF PCRE '[^A-Za-z0-9]+' IN lv_text WITH | |. "" AQUI LO QUE SE HACE ES SUSTITUIR TODO AQUELLO QUE NO SEA UNA LETRA O NUMERO POR UN ESPACIO

*    out->write( lv_text ).


**********REGULAR EXPRESSIONS

*    DATA(lv_text) = 'ABAPppp Xpp1 SAppP'.

*    DATA lv_text2 TYPE string.

*    lv_text2 = replace( val = lv_text pcre = 'p{2,4}' with = '*' occ = 0 ). "" p{2,4} ESTO SIGNIFICA QUE VA A BUSCAR LA P MINUSCULA Y QUE DEBE ENCONTRAR ENTRE 2 A 4 PARA ASI PODER SER REMPLAZADO POR *
*    out->write( lv_text2 ).

*    lv_text2 = replace( val = lv_text pcre = '[^SAP]' with = '*' occ = 0 ).
*    out->write( lv_text2 ).

*    lv_text2 = replace( val = lv_text pcre = '\s' with = '//'  ). "" \ REPRESENTA UN ESPACIO, ES DECIR UN ESPACI ENTRE LETRAS, NUMEROS O CARACTER
*    out->write( lv_text2 ).

*    REPLACE ALL OCCURRENCES OF PCRE '\s' IN lv_text WITH '?'. "" ESTAS ESTA ES LA FORMA ANTIGUA PERO S EUSA PARA REMPLAZAR TODOS
*    out->write( lv_text ).


**********REPEAT

*    DATA(lv_text) = repeat( val = 'Logali' occ = 4 ). ""occ REPRESENTA EL NUMERO DE VECES QUE SE VA A HHACER LA ACCION EN VAL
*    out->write( lv_text ).


*    DATA(lv_text2) = | abap { repeat( val = ` ` occ = 10 ) } abap |.
*    out->write( lv_text2 ).


*    DATA(lv_text3) = | abap { repeat( val = ` ` occ = -10 ) } abap |."" EL TENER UN occ NEGATIVO, DARA ERROR PERO HAY UA FORMA DE TRABAJARLO.
*    out->write( lv_text3 ).


*    TRY.
*        DATA(lv_text3) = | abap { repeat( val = ` ` occ = -10 ) } abap |.
*      CATCH cx_sy_strg_par_val. ""ESTO ES EL NOBRE DE LA EXEPCION QUE ARROJA AL HACER ESTO
*        out->write( 'LA OPERACON ES INVALIDA' ).
*    ENDTRY.


**********ESCAPE ""ESTA FUNCION DEVULEVE UNA CADENA DE CARACTERES, DEPENDIENTE DEL PARAMETRO QUE ESTEMOS USANDO

*****URLs

    DATA(lv_url) = escape( val = 'Logali ABAP Academy @300' format = cl_abap_format=>e_url_full ). ""EN FORMAT, USAOS UN FORMATO YA ESTABLECIDO EN UNA CLASE GLOBAL
    out->write( lv_url ).

*****JSON

    DATA(lv_json) = escape( val = 'Logali "ABAP" test json \ Academy @300' format = cl_abap_format=>e_json_string ).
    out->write( lv_json ).

*****STRING TEMPLATES

    DATA(lv_string) = escape( val = 'Special characters in string templates: |, \, {, }' format = cl_abap_format=>e_string_tpl ).
    out->write( lv_string ).







  ENDMETHOD.

ENDCLASS.
