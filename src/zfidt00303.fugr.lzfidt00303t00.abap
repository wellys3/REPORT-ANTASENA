*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZFIDT00303......................................*
DATA:  BEGIN OF STATUS_ZFIDT00303                    .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZFIDT00303                    .
CONTROLS: TCTRL_ZFIDT00303
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZFIDT00303                    .
TABLES: ZFIDT00303                     .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
