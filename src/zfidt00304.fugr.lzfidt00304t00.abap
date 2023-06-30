*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZFIDT00304......................................*
DATA:  BEGIN OF STATUS_ZFIDT00304                    .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZFIDT00304                    .
CONTROLS: TCTRL_ZFIDT00304
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZFIDT00304                    .
TABLES: ZFIDT00304                     .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
