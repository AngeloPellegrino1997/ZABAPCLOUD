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


*****PARTE 1

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

    out->write( mt_employees ).




  ENDMETHOD.



ENDCLASS.


