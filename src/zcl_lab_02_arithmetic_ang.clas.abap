CLASS zcl_lab_02_arithmetic_ang DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_02_arithmetic_ang IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  "**********PART 1

    DATA: lv_base_rate            TYPE i VALUE 20,
          lv_corp_area_rate       TYPE i VALUE 10,
          lv_medical_service_rate TYPE i VALUE 15,
          lv_total_rate           TYPE i.

    lv_total_rate = lv_base_rate + lv_corp_area_rate + lv_medical_service_rate.

    out->write( lv_total_rate ).

    ADD 5 TO lv_total_rate.

    out->write( |RESULTADO FINAL: { lv_total_rate }| ).

**********PART 2
    CLEAR lv_base_rate.

    DATA: lv_maintenance_rate TYPE i VALUE 30,
          lv_margin_rate      TYPE i VALUE 10.

    lv_base_rate = lv_maintenance_rate - lv_margin_rate.
    out->write( lv_base_rate ).

    SUBTRACT 4 FROM lv_base_rate.

    out->write( |RESULTADO FINAL DE LA RESTA: { lv_base_rate }| ).

**********PART 3

    DATA: lv_package_weight TYPE i VALUE 2,
          lv_cost_per_kg    TYPE i VALUE 3,
          lv_multi_rate     TYPE i.

    lv_multi_rate = lv_package_weight * lv_cost_per_kg.
    out->write( lv_multi_rate ).

    MULTIPLY lv_multi_rate BY 2.

    out->write( |RESULTADO FINAL DE LA MULTIPLICACION ES: { lv_multi_rate  } | ).

**********PART 4

    DATA: lv_total_weight TYPE i VALUE 38,
          lv_num_packages TYPE i VALUE 4,
          lv_applied_rate TYPE p LENGTH 8 DECIMALS 2.

    lv_applied_rate = lv_total_weight / lv_num_packages .
    out->write( lv_applied_rate ).

    DIVIDE lv_applied_rate BY 3.
    out->write( |EL RESULTADO FINAL DE LA DIVISION ES: { lv_applied_rate } | ).

**********PART 5

    DATA: lv_total_cost         TYPE i VALUE 17,
          lv_discount_threshold TYPE i VALUE 4,
          lv_result             TYPE p LENGTH 4 DECIMALS 2.

    lv_result = lv_total_cost DIV lv_discount_threshold.

    out->write( |EL RESSULTADO DEL RESTO ES: { lv_result } | ).

**********PART 6

    DATA lv_remainder  TYPE p LENGTH 4 DECIMALS 2.
    CLEAR lv_total_cost.
    CLEAR lv_discount_threshold.

    lv_total_cost = 19.
    lv_discount_threshold = 4.

    lv_remainder = lv_total_cost MOD lv_discount_threshold.
    out->write( |EL RESIDUO TOTAL ES: { lv_remainder } | ).

**********PART 7

    DATA: lv_weight TYPE i VALUE 5,
          lv_expo   TYPE i.

    lv_expo = lv_weight ** 2.

    out->write( |EL RESULTADO DEL CUADRADO ES: { lv_expo } | ).

**********PART 9

    DATA lv_square_root TYPE i.

    lv_square_root = sqrt( lv_expo ).
    out->write( |LA RAIZ CUADRADA ES: { lv_square_root } | ).

  ENDMETHOD.
ENDCLASS.
