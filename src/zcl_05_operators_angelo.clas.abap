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

    DATA: lv_num_a TYPE i VALUE 10,
          lv_num_b TYPE i VALUE 15,
          lv_total TYPE p LENGTH 6 DECIMALS 2.
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
lv_num_a = sqrt( 25 ).
out->write( |TOTAL SQRT: { lv_num_a }| ).

lv_num_a = 9.

lv_num_a = SQRT( lv_num_a ).

out->write( |TOTAL SQRT: { lv_num_a }| ).












  ENDMETHOD.






ENDCLASS.
