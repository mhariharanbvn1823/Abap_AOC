CLASS zrap_myfirstclass DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZRAP_MYFIRSTCLASS IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    out->write( 'Hello World RAP Champian Hari haran ' ) .
    out->write( 'We Warmly Welcome you !!!! ' ) .
  ENDMETHOD.
ENDCLASS.
