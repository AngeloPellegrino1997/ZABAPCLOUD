CLASS zcl_lab_01_vat_angelo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_01_vat_angelo IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA: mv_purchase_date TYPE d VALUE '20240611',
          mv_purchase_time TYPE t VALUE '153200',
          mv_price         TYPE f VALUE '10.5',
          mv_tax           TYPE i VALUE 16,
          mv_increase      TYPE decfloat16 VALUE '20.5',
          mv_discounts     TYPE decfloat34 VALUE '10.5',
          mv_type          TYPE c LENGTH 10 VALUE 'PC',
          mv_shipping      TYPE p LENGTH 8 VALUE '40.36',
          mv_id_code       TYPE n LENGTH 4 VALUE '1110',
          mv_qr_code       TYPE x LENGTH 5 VALUE 'F5CF'.

    TYPES: BEGIN OF mty_customer,
             id       TYPE i,
             customer TYPE c LENGTH 15,
             age      TYPE i,
           END OF mty_customer.
    DATA ms_customer TYPE mty_customer.
    ms_customer = VALUE #( id = 1997
                          customer = 'Jose Luis'
                           age = 27                    ).





    "out->write( |La id es: { ms_customer-id } El customer es: { ms_customer-customer } Su age es: { ms_customer-age }| ).

    DATA ms_employee TYPE /dmo/employee_hr.

    ms_employee = VALUE #( client = 18
   employee = '1807'
    first_name = 'Pirulito'
    last_name = 'Cachirulito'
    salary_currency = 'BOLOS'
    manager = 'XRL8'

    ).

    "out->write( |Client:{ ms_employee-client } Employee:{ ms_employee-employee } First Name:{ ms_employee-first_name } Last Name:{ ms_employee-last_name } Salary Currency:{ ms_employee-salary_currency } Manager:{ ms_employee-manager } | ).


    DATA mv_product TYPE string VALUE 'LAPTOP'.
    DATA mv_bar_code TYPE xstring VALUE '12121121211'.


    DATA: mc_purchase_date TYPE d VALUE '20240611',
          mc_purchase_time TYPE t VALUE '153200',
          mc_price         TYPE f VALUE '10.5',
          mc_tax           TYPE i VALUE 16,
          mc_increase      TYPE decfloat16 VALUE '20.5',
          mc_discounts     TYPE decfloat34 VALUE '10.5',
          mc_type          TYPE c LENGTH 10 VALUE 'PC',
          mc_shipping      TYPE p LENGTH 8 VALUE '40.36',
          mc_id_code       TYPE n LENGTH 4 VALUE '1110',
          mc_qr_code       TYPE x LENGTH 5 VALUE 'F5CF'.


    mc_purchase_date = mv_purchase_date.
    mc_purchase_time = mv_purchase_time.
    mc_price = mv_price.
    mc_tax = mv_tax.
    mc_increase = mv_increase.
    mc_discounts = mv_discounts.
    mc_type = mv_type.
    mc_shipping = mv_shipping.
    mc_id_code = mv_id_code.
    mc_qr_code = mv_qr_code.




    "DATA mc_p TYPE i VALUE 5. LO DE ARRIBA LO PUDE HABER HECHO ASI TRANQUILAMENTE.
    "DATA(mv_p) = mc_p.
    "out->write( mv_p ).

    DATA(lv_product) = mv_product.
    DATA(lv_bar_code) = mv_bar_code.

  ENDMETHOD.
ENDCLASS.
