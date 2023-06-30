*----------------------------------------------------------------------*
***INCLUDE LZFIDT00302F01.
*----------------------------------------------------------------------*


FORM f_new_entry. "05

  SELECT SINGLE * FROM skat INTO @DATA(lwa_skat)
    WHERE spras EQ 'i' AND
          ktopl EQ 'ADMF' AND
          saknr EQ @zfidt00302-racct.
  IF sy-subrc EQ 0.
    zfidt00302-racct_desc = lwa_skat-txt50.
*  ELSE.
*    DATA(ld_racct) = zfidt00302-racct.
*    zfidt00302-racct = ''.
*    zfidt00302-racct_desc = ''.
*    MESSAGE w888(sabapdocu) WITH 'GL Account' ld_racct 'not found!'.
  ENDIF.

*--------------------------------------------------------------------*

*  IF zfidt00302-racct_antasena IS NOT INITIAL.
*
*    SELECT SINGLE * FROM skat INTO lwa_skat
*      WHERE spras EQ 'i' AND
*            ktopl EQ 'ADMF' AND
*            saknr EQ zfidt00302-racct_antasena.
*    IF sy-subrc EQ 0.
*      zfidt00302-racct_antasena_desc = lwa_skat-txt50.
*    ELSE.
*      DATA(ld_racct_antasena) = zfidt00302-racct_antasena.
*      zfidt00302-racct_antasena = ''.
*      zfidt00302-racct_antasena_desc = ''.
*      MESSAGE w888(sabapdocu) WITH 'GL Account Antasena' ld_racct_antasena 'not found!'.
*    ENDIF.
*
*  ENDIF.

ENDFORM.


FORM f_on_changes. "21

*  IF zfidt00302-racct_antasena IS NOT INITIAL.
*
*    SELECT SINGLE * FROM skat INTO @DATA(lwa_skat)
*      WHERE spras EQ 'i' AND
*            ktopl EQ 'ADMF' AND
*            saknr EQ @zfidt00302-racct_antasena.
*    IF sy-subrc EQ 0.
*      zfidt00302-racct_antasena_desc = lwa_skat-txt50.
*    ELSE.
*      DATA(ld_racct_antasena) = zfidt00302-racct_antasena.
*      zfidt00302-racct_antasena = ''.
*      zfidt00302-racct_antasena_desc = ''.
*      MESSAGE w888(sabapdocu) WITH 'GL Account Antasena' ld_racct_antasena 'not found!'.
*    ENDIF.
*
*  ENDIF.

ENDFORM.


*FORM f_before_saving. "01
*
*  FIELD-SYMBOLS: <fs_field> TYPE any.
*
*  LOOP AT total.
*
*    CHECK <action> EQ aendern.
*
**    ASSIGN COMPONENT 'RACCT_ANTASENA' OF STRUCTURE <vim_total_struc> TO <fs_field>.
*
*    SELECT SINGLE * FROM skat INTO @DATA(lwa_skat)
*      WHERE spras EQ 'i' AND
*            ktopl EQ 'ADMF' AND
*            saknr EQ @zfidt00302-racct_antasena.
*    IF sy-subrc EQ 0.
*
*      "Update RACCT_ANTASENA_DESC
*      ASSIGN COMPONENT 'RACCT_ANTASENA_DESC' OF STRUCTURE <vim_total_struc> TO <fs_field>.
*      IF sy-subrc EQ 0.
*        <fs_field> = lwa_skat-txt50.
*      ENDIF.
*
*    ELSE.
*
*      ASSIGN COMPONENT 'RACCT_ANTASENA_DESC' OF STRUCTURE <vim_total_struc> TO <fs_field>.
*      IF sy-subrc EQ 0.
*        <fs_field> = ''.
*      ENDIF.
*
*    ENDIF.
*
*    READ TABLE extract WITH KEY <vim_xtotal_key>.
*    IF sy-subrc EQ 0.
*      extract = total.
*      MODIFY extract INDEX sy-tabix.
*    ENDIF.
*
*    IF total IS NOT INITIAL.
*      MODIFY total.
*    ENDIF.
*
*  ENDLOOP.
*
*ENDFORM.
