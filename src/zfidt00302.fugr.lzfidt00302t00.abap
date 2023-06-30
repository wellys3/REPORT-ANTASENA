*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZFIDT00302......................................*
DATA:  BEGIN OF STATUS_ZFIDT00302                    .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZFIDT00302                    .
CONTROLS: TCTRL_ZFIDT00302
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZFIDT00302                    .
TABLES: ZFIDT00302                     .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
