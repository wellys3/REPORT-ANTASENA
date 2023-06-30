*&---------------------------------------------------------------------*
*& Include          ZFI02R0032_F00
*&---------------------------------------------------------------------*


*&---------------------------------------------------------------------*
*& Form F_INITIALIZATION
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_initialization .

  PERFORM set_text .

ENDFORM.


*&---------------------------------------------------------------------*
*& Form SET_TEXT
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM set_text .

*  text901 = 'Selection Option'.
  text902 = 'Selection Area'.
*  text903 = 'Selection Area (Run via FM purpose only! Don''t use if you use Selection Screen)'.
  text904 = 'Tracing'.

  %_s_rbukrs_%_app_%-text = 'Company Code'.
  %_s_poper_%_app_%-text = 'Period'.
  %_s_gjahr_%_app_%-text = 'Fiscal Year'.

*  %_s_recid_%_app_%-text = 'Recon. ID'.
*  %_s_zlevel_%_app_%-text = 'Level'.
*  %_s_baldat_%_app_%-text = 'Balance Date'.
*  %_s_unlv1_%_app_%-text = 'Unit ID Level 1'.
*  %_s_unlv2_%_app_%-text = 'Unit ID Level 2'.
*  %_s_unlv3_%_app_%-text = 'Unit ID Level 3'.

*  %_c_switch_%_app_%-text = 'Turn on'.
*  %_p_datum_%_app_%-text = 'Date'.
*  %_p_uzeit_%_app_%-text = 'Time'.

*  text701 = 'Switch On / Off'.
*  text702 = '(X = On | <BLANK> = Off)'.
  text801 = 'No Tracing'.
  text802 = 'Tracing Level 1'.
  text803 = 'Tracing Level 2'.
*  text804 = 'Tracing Level 3'.

ENDFORM.


*&---------------------------------------------------------------------*
*& Form F_MODIFY_SCREEN
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_modify_screen .

*  IF c_sw_fm EQ ''.

  LOOP AT SCREEN.

    CASE screen-name.
      WHEN 'S_RBUKRS-LOW'.
        screen-required = '2'.
        MODIFY SCREEN.
      WHEN 'S_POPER-LOW'.
        screen-required = '2'.
        MODIFY SCREEN.
      WHEN 'S_GJAHR-LOW'.
        screen-required = '2'.
        MODIFY SCREEN.
    ENDCASE.

*      CASE screen-group1.
*        WHEN 'P1'.
*          screen-input = '0'.
*          MODIFY SCREEN.
*      ENDCASE.

  ENDLOOP.

*  ELSE.
*
*    LOOP AT SCREEN.
*
*      CASE screen-name.
*        WHEN 'S_ZLEVEL-LOW'.
*          screen-required = '2'.
*          MODIFY SCREEN.
*        WHEN 'S_RBUKRS-LOW'.
*          screen-required = '2'.
*          MODIFY SCREEN.
*        WHEN 'S_RECID-LOW'.
*          screen-required = '2'.
*          MODIFY SCREEN.
*        WHEN 'S_BALDAT-LOW'.
*          screen-required = '2'.
*          MODIFY SCREEN.
*      ENDCASE.
*
*      CASE screen-group1.
*        WHEN 'P2'.
*          screen-input = '0'.
*          MODIFY SCREEN.
*      ENDCASE.
*
*    ENDLOOP.
*
*    rb1 = 'X'.
*    rb2 = ''.
*    rb3 = ''.
*
*  ENDIF.

ENDFORM.


*&---------------------------------------------------------------------*
*& Form F_MANDATORY_VALIDATION
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_mandatory_validation .

  IF sy-ucomm = 'ONLI'.

    IF s_rbukrs-low IS INITIAL.
      SET CURSOR FIELD 'S_RBUKRS-LOW'.
      MESSAGE 'Fill out all required entry fields' TYPE 'E'.
    ENDIF.

    IF s_poper-low IS INITIAL.
      SET CURSOR FIELD 'S_POPER-LOW'.
      MESSAGE 'Fill out all required entry fields' TYPE 'E'.
    ENDIF.

    IF s_gjahr-low IS INITIAL.
      SET CURSOR FIELD 'S_GJAHR-LOW'.
      MESSAGE 'Fill out all required entry fields' TYPE 'E'.
    ENDIF.

  ENDIF.

ENDFORM.


FORM f_progress_bar_single USING p_value.

  CALL FUNCTION 'SAPGUI_PROGRESS_INDICATOR'
    EXPORTING
      percentage = 0
      text       = p_value.

  MESSAGE p_value TYPE 'S'.

ENDFORM.


FORM f_progress_bar USING p_value
                          p_tabix
                          p_nlines.

  DATA: w_text(250),
        w_percentage      TYPE p,
        w_percent_char(3).

  w_percentage    = ( p_tabix / p_nlines ) * 100.
  w_percent_char  = w_percentage.

  SHIFT w_percent_char LEFT DELETING LEADING ' '.
  CONCATENATE w_percent_char '% complete' INTO w_text.
  CONCATENATE p_value w_text INTO w_text SEPARATED BY space.

*This check needs to be in, otherwise when looping around big tables
*SAP will re-display indicator too many times causing report to run
*very slow. (No need to re-display same percentage anyways)

  IF w_percentage GT gd_percent
      OR p_tabix  EQ 1.
    CALL FUNCTION 'SAPGUI_PROGRESS_INDICATOR'
      EXPORTING
        percentage = w_percentage
        text       = w_text.
    MESSAGE w_text TYPE 'S'.

    gd_percent = w_percentage.
  ENDIF.

ENDFORM.


*&---------------------------------------------------------------------*
*& Form F_GET_DATE_OF_END_MONTH
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> S_GJAHR_LOW
*&      --> S_POPER_LOW
*&      <-- GWA_DATA_SUM_FINAL_DATE_OF_END
*&---------------------------------------------------------------------*
FORM f_get_date_of_end_month  USING    p_gjahr
                                       p_poper
                              CHANGING p_end_of_month.

  DATA: ld_datum TYPE sy-datum.

*--------------------------------------------------------------------*

  CLEAR ld_datum.
  ld_datum = p_gjahr && p_poper+1(2) && '01'.

  CALL FUNCTION 'RP_LAST_DAY_OF_MONTHS'
    EXPORTING
      day_in            = ld_datum
    IMPORTING
      last_day_of_month = p_end_of_month
    EXCEPTIONS
      day_in_no_date    = 1.
  IF sy-subrc <> 0.
    "Implement suitable error handling here
  ENDIF.

ENDFORM.


*&---------------------------------------------------------------------*
*& Form F_CONFIRM
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*      <--P_LD_ANSWER  text
*&---------------------------------------------------------------------*
FORM f_confirm USING p_word1
                     p_word2
                     p_button1
                     p_button2
            CHANGING p_answer.

  CALL FUNCTION 'POPUP_TO_CONFIRM'
    EXPORTING
      titlebar              = p_word1
      text_question         = p_word2
      text_button_1         = p_button1
      text_button_2         = p_button2
      display_cancel_button = 'X'
    IMPORTING
      answer                = p_answer
    EXCEPTIONS
      text_not_found        = 1
      OTHERS                = 2.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ELSE.
    "Do nothing
  ENDIF.

ENDFORM.


*&---------------------------------------------------------------------*
*&      Form  F_CONV_DATE_SAPFORMAT_WITH_SEPARATOR
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_GWA_EXCEL_RAW_COL4  text
*      -->P_GWA_EXCEL_FIX_VALID_FROM  text
*----------------------------------------------------------------------*
FORM f_conv_date_sapformat_with_sep   USING p_input
                                            p_separator
                                   CHANGING p_output.
  CLEAR p_output.
  "YYYY-MM-DD
  p_output = p_input(4) && p_separator &&
             p_input+4(2) && p_separator &&
             p_input+6(2).
ENDFORM.                    " F_CONV_DATE_SAPFORMAT_WITH_SEPARATOR


*&---------------------------------------------------------------------*
*&      Form  F_CONVERT_DATE_WITH_SEPARATOR
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_GWA_EXCEL_RAW_COL4  text
*      -->P_GWA_EXCEL_FIX_VALID_FROM  text
*----------------------------------------------------------------------*
FORM f_conv_date_with_separator  USING    p_input
                                          p_separator
                                 CHANGING p_output.

  CLEAR p_output.
  p_output = p_input+6(2) && p_separator &&
             p_input+4(2) && p_separator &&
             p_input(4).

ENDFORM.                    " F_CONVERT_DATE_WITH_SEPARATOR


*&---------------------------------------------------------------------*
*&      Form  F_CONVERT_TIME_WITH_SEPARATOR
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_SY_UZEIT  text
*      -->P_0225   text
*      <--P_LD_STR_TIME  text
*----------------------------------------------------------------------*
FORM f_conv_time_with_separator  USING p_input
                                       p_separator
                              CHANGING p_output.
  p_output = p_input(2) && p_separator &&
             p_input+2(2) && p_separator &&
             p_input+4(2).
ENDFORM.                    " F_CONVERT_TIME_WITH_SEPARATOR


*&---------------------------------------------------------------------*
*& Form F_GET_DATE_TIME
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> SY_DATUM
*&      <-- LD_FILENAME
*&---------------------------------------------------------------------*
FORM f_get_date_time  USING    p_datum
                               p_uzeit
                               p_separator
                      CHANGING p_output.

  DATA: ld_str_date TYPE string,
        ld_str_time TYPE string.

  PERFORM f_conv_date_with_separator USING p_datum
                                           '.'
                                 CHANGING ld_str_date.

  PERFORM f_conv_time_with_separator    USING p_uzeit
                                             '.'
                                    CHANGING ld_str_time.

  p_output = ld_str_date && p_separator && ld_str_time.

ENDFORM.


*&---------------------------------------------------------------------*
*& Form F_START_TIMER
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_start_timer .
  "Record start time
  GET RUN TIME FIELD gd_start.
ENDFORM.


*&---------------------------------------------------------------------*
*& Form F_STOP_TIMER
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_stop_timer .
  "Record end time
  GET RUN TIME FIELD gd_stop.
  "Run time (milliseconds instead of seconds)
  gd_run = ( gd_stop - gd_start ) / 1000000.
ENDFORM.


FORM f_convert_amount  USING p_kind
                             p_currency
                             p_amount
                    CHANGING p_output.
  DATA: ld_io  TYPE bapicurr-bapicurr.
  CASE p_kind.
    WHEN 'TO_INTERNAL'.
      ld_io = p_amount.
      CALL FUNCTION 'BAPI_CURRENCY_CONV_TO_INTERNAL'
        EXPORTING
          currency             = p_currency
          amount_external      = ld_io
          max_number_of_digits = 23
        IMPORTING
          amount_internal      = p_output.
    WHEN 'TO_EXTERNAL'.
      CALL FUNCTION 'BAPI_CURRENCY_CONV_TO_EXTERNAL'
        EXPORTING
          currency        = p_currency
          amount_internal = p_amount
        IMPORTING
          amount_external = ld_io.
      IF sy-subrc EQ 0.
        p_output = ld_io.
      ENDIF.
  ENDCASE.
ENDFORM.
