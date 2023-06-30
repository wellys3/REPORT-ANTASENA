*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZFIDT00306......................................*
DATA:  BEGIN OF STATUS_ZFIDT00306                    .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZFIDT00306                    .
CONTROLS: TCTRL_ZFIDT00306
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZFIDT00306                    .
TABLES: ZFIDT00306                     .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
