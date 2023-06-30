*----------------------------------------------------------------------*
***INCLUDE LZFIDT00304F01.
*----------------------------------------------------------------------*


FORM f_new_entry. "05

  SELECT SINGLE * FROM skat INTO @DATA(lwa_skat)
    WHERE spras EQ 'i' AND
          ktopl EQ 'ADMF' AND
          saknr EQ @zfidt00304-racct.
  IF sy-subrc EQ 0.
    zfidt00304-racct_desc = lwa_skat-txt50.
*  ELSE.
*    DATA(ld_racct) = zfidt00304-racct.
*    zfidt00304-racct = ''.
*    zfidt00304-racct_desc = ''.
*    MESSAGE w888(sabapdocu) WITH 'GL Account' ld_racct 'not found!'.
  ENDIF.

ENDFORM.
