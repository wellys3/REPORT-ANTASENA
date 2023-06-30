*&---------------------------------------------------------------------*
*& Include          ZFI02R0032_F01
*&---------------------------------------------------------------------*


*&---------------------------------------------------------------------*
*& Form F_PRE_EXECUTE
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_pre_execute CHANGING p_subrc.


*--------------------------------------------------------------------*
*Get Table Maintain ZFIDT00302

  CLEAR git_zfidt00302[].
*  SELECT * FROM zfidt00302 INTO TABLE git_zfidt00302
  SELECT * FROM zficd_zfidt00302 INTO TABLE @git_zfidt00302
    WHERE rbukrs IN @s_rbukrs.
  IF git_zfidt00302[] IS NOT INITIAL.

    MOVE-CORRESPONDING git_zfidt00302[] TO git_racct[].
    SORT git_racct ASCENDING BY racct.
    DELETE ADJACENT DUPLICATES FROM git_racct COMPARING racct.

  ENDIF.

*--------------------------------------------------------------------*
*Get Table Maintain ZFIDT00303

  CLEAR git_zfidt00303[].
  SELECT * FROM zfidt00303 INTO TABLE git_zfidt00303
    WHERE rbukrs IN s_rbukrs.

*--------------------------------------------------------------------*
*Get Table Maintain ZFIDT00304

  CLEAR git_zfidt00304[].
  SELECT * FROM zfidt00304 INTO TABLE git_zfidt00304
    WHERE rbukrs IN s_rbukrs.

*--------------------------------------------------------------------*
*Get Radio Button

  IF rb1 EQ 'X'.
    gd_rb = 'NO TRACING'.
  ELSEIF rb2 EQ 'X'.
    gd_rb = 'TRACING LEVEL 1'.
  ELSEIF rb3 EQ 'X'.
    gd_rb = 'TRACING LEVEL 2'.
*  ELSEIF rb4 EQ 'X'.
*    gd_rb = 'TRACING LEVEL 3'.
  ENDIF.

ENDFORM.


*&---------------------------------------------------------------------*
*& Form F_EXECUTE
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_execute .

  DATA: ld_indicator TYPE boolean. "Indicator Table Z or not? X = Table Z | <Space> = Non Table Z

*--------------------------------------------------------------------*

  CASE gd_rb.
    WHEN 'NO TRACING'.

      CLEAR git_zfidt00305[].
      CLEAR ld_indicator.
      SELECT * FROM zfidt00305 INTO TABLE @git_zfidt00305
        WHERE rbukrs EQ @s_rbukrs-low AND
              gjahr EQ @s_gjahr-low AND
              poper EQ @s_poper-low.
      IF git_zfidt00305[] IS NOT INITIAL.
        ld_indicator = 'X'.
        MESSAGE 'This report for Amount Adjustment field got from Table ZFIDT00305' TYPE 'I'.
      ENDIF.

      PERFORM f_start_timer.

      PERFORM f_get_data_b CHANGING git_zfidt00242[]
                                    git_zfidt00269[]
                                    git_acdoca_bs[]
                                    git_acdoca_pl[]
                                    git_faglflext_bs[]
                                    git_faglflext_pl[].

      PERFORM f_combine_table USING git_zfidt00242[]
                                    git_zfidt00269[]
                                    git_acdoca_bs[]
                                    git_acdoca_pl[]
                                    git_faglflext_bs[]
                                    git_faglflext_pl[]
                           CHANGING git_data_detail[]
                                    git_data_detail_b[].

      PERFORM f_prepare_alv_b     USING ld_indicator " X = From Table | <BLANK> = Not From Table
                                        git_data_detail[]
                                        git_data_detail_b[]
                               CHANGING git_data_sum_final[]
                                        git_data_pre_detail[].

      IF git_data_sum_final[] IS NOT INITIAL.

        PERFORM f_stop_timer.
        "001: This program sucessfully executed! (Exec. Time & seconds)
        MESSAGE s071(zfimsg) WITH gd_run.

        PERFORM f_display_data USING ld_indicator

                                     git_data_detail_combine[]
                                     git_data_pre_detail[]
                                     git_data_sum_final[].

      ELSE.
        MESSAGE 'No data found' TYPE 'S' DISPLAY LIKE 'W'.
      ENDIF.

    WHEN 'TRACING LEVEL 1'.

      PERFORM f_start_timer.

      PERFORM f_get_data_b CHANGING git_zfidt00242[]
                                    git_zfidt00269[]
                                    git_acdoca_bs[]
                                    git_acdoca_pl[]
                                    git_faglflext_bs[]
                                    git_faglflext_pl[].

      PERFORM f_combine_table USING git_zfidt00242[]
                                    git_zfidt00269[]
                                    git_acdoca_bs[]
                                    git_acdoca_pl[]
                                    git_faglflext_bs[]
                                    git_faglflext_pl[]
                           CHANGING git_data_detail[]
                                    git_data_detail_b[].

      PERFORM f_prepare_alv_b     USING ld_indicator " X = From Table | <BLANK> = Not From Table
                                        git_data_detail[]
                                        git_data_detail_b[]
                               CHANGING git_data_sum_final[]
                                        git_data_pre_detail[].

      IF git_data_pre_detail[] IS NOT INITIAL.

        PERFORM f_stop_timer.
        "001: This program sucessfully executed! (Exec. Time & seconds)
        MESSAGE s071(zfimsg) WITH gd_run.

        PERFORM f_display_data USING ld_indicator " X = From Table | <BLANK> = Not From Table

                                     git_data_detail_combine[]
                                     git_data_pre_detail[]
                                     git_data_sum_final[].

      ELSE.
        MESSAGE 'No data found' TYPE 'S' DISPLAY LIKE 'W'.
      ENDIF.

    WHEN 'TRACING LEVEL 2'.

      PERFORM f_start_timer.

      PERFORM f_get_data_b CHANGING git_zfidt00242[]
                                    git_zfidt00269[]
                                    git_acdoca_bs[]
                                    git_acdoca_pl[]
                                    git_faglflext_bs[]
                                    git_faglflext_pl[].

      PERFORM f_combine_table USING git_zfidt00242[]
                                    git_zfidt00269[]
                                    git_acdoca_bs[]
                                    git_acdoca_pl[]
                                    git_faglflext_bs[]
                                    git_faglflext_pl[]
                           CHANGING git_data_detail[]
                                    git_data_detail_b[].

      APPEND LINES OF git_data_detail[] TO git_data_detail_combine[].
      APPEND LINES OF git_data_detail_b[] TO git_data_detail_combine[].

      IF git_data_detail_combine[] IS NOT INITIAL.

        PERFORM f_stop_timer.
        "001: This program sucessfully executed! (Exec. Time & seconds)
        MESSAGE s071(zfimsg) WITH gd_run.

        PERFORM f_display_data USING ld_indicator " X = From Table | <BLANK> = Not From Table

                                     git_data_detail_combine[]
                                     git_data_pre_detail[]
                                     git_data_sum_final[].

      ELSE.
        MESSAGE 'No data found' TYPE 'S' DISPLAY LIKE 'W'.
      ENDIF.

  ENDCASE.

*  ENDIF.

ENDFORM.


*&---------------------------------------------------------------------*
*& Form F_GET_DATA
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      <-- GIT_DATA[]
*&---------------------------------------------------------------------*
FORM f_get_data_b CHANGING p_git_zfidt00242 TYPE gtt_zfidt00242
                           p_git_zfidt00269 TYPE gtt_zfidt00269
                           p_git_acdoca_bs TYPE gtt_acdoca_bs
                           p_git_acdoca_pl TYPE gtt_acdoca_pl
                           p_git_faglflext_bs TYPE gtt_faglflext_bs
                           p_git_faglflext_pl TYPE gtt_faglflext_pl.

  CLEAR: p_git_zfidt00242[],
         p_git_zfidt00269[],
         p_git_acdoca_bs[],
         p_git_acdoca_pl[],
         p_git_faglflext_bs[],
         p_git_faglflext_pl[].

*--------------------------------------------------------------------*
*Get Data ZFIDT00242

  PERFORM f_progress_bar_single USING 'Getting Data from ZFIDT00242...'.

  PERFORM f_get_data_from_table_b    USING 'ZFIDT00242'
                                CHANGING p_git_zfidt00242[]
                                         p_git_zfidt00269[]
                                         p_git_acdoca_bs[]
                                         p_git_acdoca_pl[]
                                         p_git_faglflext_bs[]
                                         p_git_faglflext_pl[].

*--------------------------------------------------------------------*
*Get Data ZFIDT00269

  PERFORM f_progress_bar_single USING 'Getting Data from ZFIDT00269...'.

  PERFORM f_get_data_from_table_b    USING 'ZFIDT00269'
                                CHANGING p_git_zfidt00242[]
                                         p_git_zfidt00269[]
                                         p_git_acdoca_bs[]
                                         p_git_acdoca_pl[]
                                         p_git_faglflext_bs[]
                                         p_git_faglflext_pl[].

*--------------------------------------------------------------------*
*Get Data ACDOCA BALANCE SHEET

  PERFORM f_progress_bar_single USING 'Getting Data from ACDOCA BALANCE SHEET...'.

  PERFORM f_get_data_from_table_b    USING 'ACDOCA BS'
                                CHANGING p_git_zfidt00242[]
                                         p_git_zfidt00269[]
                                         p_git_acdoca_bs[]
                                         p_git_acdoca_pl[]
                                         p_git_faglflext_bs[]
                                         p_git_faglflext_pl[].

*--------------------------------------------------------------------*
*Get Data ACDOCA PROFIT LOSS

  PERFORM f_progress_bar_single USING 'Getting Data from ACDOCA PROFIT LOSS...'.

  PERFORM f_get_data_from_table_b    USING 'ACDOCA PL'
                                CHANGING p_git_zfidt00242[]
                                         p_git_zfidt00269[]
                                         p_git_acdoca_bs[]
                                         p_git_acdoca_pl[]
                                         p_git_faglflext_bs[]
                                         p_git_faglflext_pl[].

*--------------------------------------------------------------------*
*Get Data FAGLFLEXT BALANCE SHEET

  PERFORM f_progress_bar_single USING 'Getting Data from FAGLFLEXT BALANCE SHEET...'.

  PERFORM f_get_data_from_table_b    USING 'FAGLFLEXT BS'
                                CHANGING p_git_zfidt00242[]
                                         p_git_zfidt00269[]
                                         p_git_acdoca_bs[]
                                         p_git_acdoca_pl[]
                                         p_git_faglflext_bs[]
                                         p_git_faglflext_pl[].

*--------------------------------------------------------------------*
*Get Data FAGLFLEXT PROFIT LOSS

  PERFORM f_progress_bar_single USING 'Getting Data from FAGLFLEXT PROFIT LOSS...'.

  PERFORM f_get_data_from_table_b    USING 'FAGLFLEXT PL'
                                CHANGING p_git_zfidt00242[]
                                         p_git_zfidt00269[]
                                         p_git_acdoca_bs[]
                                         p_git_acdoca_pl[]
                                         p_git_faglflext_bs[]
                                         p_git_faglflext_pl[].

ENDFORM.


*&---------------------------------------------------------------------*
*& Form F_GET_DATA_FROM_TABLE_B
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> P_
*&      <-- GIT_ZFIDT00242[]
*&---------------------------------------------------------------------*
FORM f_get_data_from_table_b  USING   p_kind
*                                      p_lwa_zfidt00302 TYPE zfidt00302
                             CHANGING p_git_zfidt00242 TYPE gtt_zfidt00242
                                      p_git_zfidt00269 TYPE gtt_zfidt00269
                                      p_git_acdoca_bs TYPE gtt_acdoca_bs
                                      p_git_acdoca_pl TYPE gtt_acdoca_pl
                                      p_git_faglflext_bs TYPE gtt_faglflext_bs
                                      p_git_faglflext_pl TYPE gtt_faglflext_pl.

*--------------------------------------------------------------------*

  CLEAR: gd_where,
         gd_where1,
         gd_where2,
         gd_where3,
         gd_where4,
         gd_where5,
         git_named_seltabs[].

  CASE p_kind.
    WHEN 'ZFIDT00242'. "Engine Yearly

*      TRY.
*          gd_where = cl_shdb_seltab=>combine_seltabs(
*            EXPORTING it_named_seltabs = git_named_seltabs[]
*                      iv_client_field = 'RCLNT'
*          ).
*        CATCH cx_shdb_exception.
*      ENDTRY.

      "*--------------------------------------------------------------------*

      TRY.
          CLEAR p_git_zfidt00242[].
*          CALL METHOD zficl_amdp_013=>get_zfidt00242_b
          CALL METHOD zficl_amdp_013=>get_zfidt00242_c
            EXPORTING
              im_mandt      = sy-mandt
              im_rldnr      = '0L'
              im_bukrs      = gc_rbukrs
              im_gjahr      = s_gjahr-low
*             im_where      = gd_where
*             im_where1     = gd_where1
*             im_where2     = gd_where2
*             im_where3     = gd_where3
*             im_where4     = gd_where4
*             im_where5     = gd_where5
              it_racct      = git_racct[]
            IMPORTING
              et_zfidt00242 = p_git_zfidt00242.
        CATCH cx_amdp_error. " Exceptions when calling AMDP methods
      ENDTRY.

*      SORT p_git_zfidt00242 ASCENDING BY rldnr rbukrs gjahr poper belnr buzei.
      SORT p_git_zfidt00242 ASCENDING BY rldnr rbukrs gjahr poper.

    WHEN 'ZFIDT00269'. "Engine Monthly

*      TRY.
*          gd_where = cl_shdb_seltab=>combine_seltabs(
*            EXPORTING it_named_seltabs = git_named_seltabs[]
*                      iv_client_field = 'RCLNT'
*          ).
*        CATCH cx_shdb_exception.
*      ENDTRY.

      "*--------------------------------------------------------------------*

*      TRY.
*          CLEAR p_git_zfidt00269[].
**          CALL METHOD zficl_amdp_013=>get_zfidt00269_b
*          CALL METHOD zficl_amdp_013=>get_zfidt00269_c
*            EXPORTING
*              im_mandt      = sy-mandt
*              im_rldnr      = '0L'
*              im_bukrs      = gc_rbukrs
*              im_gjahr      = s_gjahr-low
*              im_poper      = s_poper-low
**             im_where      = gd_where
**             im_where1     = gd_where1
**             im_where2     = gd_where2
**             im_where3     = gd_where3
**             im_where4     = gd_where4
**             im_where5     = gd_where5
*              it_racct      = git_racct[]
*            IMPORTING
*              et_zfidt00269 = p_git_zfidt00269.
*        CATCH cx_amdp_error. " Exceptions when calling AMDP methods
*      ENDTRY.
*
**      SORT p_git_zfidt00269 ASCENDING BY rldnr rbukrs gjahr poper belnr buzei.
*      SORT p_git_zfidt00269 ASCENDING BY rldnr rbukrs gjahr poper.

    WHEN 'ACDOCA BS'. "ACDOCA BALANCE SHEET

*      CLEAR gwa_named_seltabs.
*      gwa_named_seltabs-name = 'RACCT'.
*      gwa_named_seltabs-dref = REF #( gra_racct[] ).
*      APPEND gwa_named_seltabs TO git_named_seltabs.
*
*      TRY.
*          gd_where = cl_shdb_seltab=>combine_seltabs(
*            EXPORTING it_named_seltabs = git_named_seltabs[]
*                      iv_client_field = 'RCLNT'
*          ).
*        CATCH cx_shdb_exception.
*      ENDTRY.

      "*--------------------------------------------------------------------*

      TRY.
          CLEAR p_git_acdoca_bs[].
*          CALL METHOD zficl_amdp_013=>get_acdoca_b
          CALL METHOD zficl_amdp_013=>get_acdoca_c
            EXPORTING
              im_kind   = 'ACDOCA BS'
              im_mandt  = sy-mandt
              im_rldnr  = '0L'
              im_bukrs  = gc_rbukrs
              im_gjahr  = s_gjahr-low
              im_poper  = s_poper-low
              im_budat  = '00000000'
              im_augdt  = '00000000'
*             im_where  = gd_where
*             im_where1 = gd_where1
*             im_where2 = gd_where2
*             im_where3 = gd_where3
*             im_where4 = gd_where4
*             im_where5 = gd_where5
              it_racct  = git_racct[]
            IMPORTING
              et_acdoca = p_git_acdoca_bs.
        CATCH cx_amdp_error. " Exceptions when calling AMDP methods
      ENDTRY.

*      SORT p_git_acdoca_bs ASCENDING BY rldnr rbukrs gjahr poper belnr buzei.
      SORT p_git_acdoca_bs ASCENDING BY rldnr rbukrs gjahr poper.

    WHEN 'ACDOCA PL'. "ACDOCA PROFIT LOSS

*      TRY.
*          gd_where = cl_shdb_seltab=>combine_seltabs(
*            EXPORTING it_named_seltabs = git_named_seltabs[]
*                      iv_client_field = 'RCLNT'
*          ).
*        CATCH cx_shdb_exception.
*      ENDTRY.

      "*--------------------------------------------------------------------*

      TRY.
          CLEAR p_git_acdoca_pl[].
*          CALL METHOD zficl_amdp_013=>get_acdoca_b
          CALL METHOD zficl_amdp_013=>get_acdoca_c
            EXPORTING
              im_kind   = 'ACDOCA PL'
              im_mandt  = sy-mandt
              im_rldnr  = '0L'
              im_bukrs  = gc_rbukrs
              im_gjahr  = s_gjahr-low
              im_poper  = s_poper-low
              im_budat  = '00000000'
              im_augdt  = '00000000'
*             im_where  = gd_where
*             im_where1 = gd_where1
*             im_where2 = gd_where2
*             im_where3 = gd_where3
*             im_where4 = gd_where4
*             im_where5 = gd_where5
              it_racct  = git_racct[]
            IMPORTING
              et_acdoca = p_git_acdoca_pl.
        CATCH cx_amdp_error. " Exceptions when calling AMDP methods
      ENDTRY.

*      SORT p_git_acdoca_pl ASCENDING BY rldnr rbukrs gjahr poper belnr buzei.
      SORT p_git_acdoca_pl ASCENDING BY rldnr rbukrs gjahr poper.

    WHEN 'FAGLFLEXT BS'. "FAGLFLEXT BALANCE SHEET

*      CLEAR git_named_seltabs[].
*      TRY.
*          gd_where = cl_shdb_seltab=>combine_seltabs(
*            EXPORTING it_named_seltabs = git_named_seltabs[]
*                      iv_client_field = 'RCLNT'
*          ).
*        CATCH cx_shdb_exception.
*      ENDTRY.

      "*--------------------------------------------------------------------*

      TRY.
          CLEAR p_git_faglflext_bs[].
*          CALL METHOD zficl_amdp_013=>get_faglflext_b
          CALL METHOD zficl_amdp_013=>get_faglflext_c
            EXPORTING
              im_kind      = 'FAGLFLEXT BS'
              im_mandt     = sy-mandt
              im_rldnr     = '0L'
              im_bukrs     = gc_rbukrs
              im_gjahr     = s_gjahr-low
              im_poper     = s_poper-low
*             im_where     = gd_where
*             im_where1    = gd_where1
*             im_where2    = gd_where2
*             im_where3    = gd_where3
*             im_where4    = gd_where4
*             im_where5    = gd_where5
              it_racct     = git_racct[]
            IMPORTING
              et_faglflext = p_git_faglflext_bs.
        CATCH cx_amdp_error. " Exceptions when calling AMDP methods
      ENDTRY.

*      SORT p_git_faglflext_bs ASCENDING BY rldnr rbukrs gjahr belnr.
      SORT p_git_faglflext_bs ASCENDING BY rldnr rbukrs gjahr.

    WHEN 'FAGLFLEXT PL'. "FAGLFLEXT PROFIT LOSS

*****      CLEAR gra_racct[].
*****      f_fill_range: gra_racct 'E' 'BT' '0000199998' '0000199999'.
*****
*****      CLEAR gwa_named_seltabs.
*****      gwa_named_seltabs-name = 'RACCT'.
*****
*****      gwa_named_seltabs-dref = REF #( gra_racct[] ).
*****      APPEND gwa_named_seltabs TO git_named_seltabs.
*****
*****      TRY.
*****          gd_where1 = cl_shdb_seltab=>combine_seltabs(
*****            EXPORTING it_named_seltabs = git_named_seltabs[]
*****          ).
*****        CATCH cx_shdb_exception.
*****      ENDTRY.

      "*--------------------------------------------------------------------*

      CLEAR git_named_seltabs[].
      TRY.
          gd_where = cl_shdb_seltab=>combine_seltabs(
            EXPORTING it_named_seltabs = git_named_seltabs[]
                      iv_client_field = 'RCLNT'
          ).
        CATCH cx_shdb_exception.
      ENDTRY.

      "*--------------------------------------------------------------------*

      TRY.
          CLEAR p_git_faglflext_pl[].
*          CALL METHOD zficl_amdp_013=>get_faglflext_b
          CALL METHOD zficl_amdp_013=>get_faglflext_c
            EXPORTING
              im_kind      = 'FAGLFLEXT PL'
              im_mandt     = sy-mandt
              im_rldnr     = '0L'
              im_bukrs     = gc_rbukrs
              im_gjahr     = s_gjahr-low
              im_poper     = s_poper-low
*             im_budat     = '00000000'
*             im_augdt     = '00000000'
*             im_where     = gd_where
*             im_where1    = gd_where1
*             im_where2    = gd_where2
*             im_where3    = gd_where3
*             im_where4    = gd_where4
*             im_where5    = gd_where5
              it_racct     = git_racct[]
            IMPORTING
              et_faglflext = p_git_faglflext_pl.
        CATCH cx_amdp_error. " Exceptions when calling AMDP methods
      ENDTRY.

*      SORT p_git_faglflext_pl ASCENDING BY rldnr rbukrs gjahr belnr.
      SORT p_git_faglflext_pl ASCENDING BY rldnr rbukrs gjahr.

  ENDCASE.

ENDFORM.


*&---------------------------------------------------------------------*
*& Form F_SUM_DATA
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_combine_table USING p_git_zfidt00242 TYPE gtt_zfidt00242
                           p_git_zfidt00269 TYPE gtt_zfidt00269
                           p_git_acdoca_bs TYPE gtt_acdoca_bs
                           p_git_acdoca_pl TYPE gtt_acdoca_pl
                           p_git_faglflext_bs TYPE gtt_faglflext_bs
                           p_git_faglflext_pl TYPE gtt_faglflext_pl
                  CHANGING p_git_data_detail TYPE gtt_data_detail
                           p_git_data_detail_b TYPE gtt_data_detail.

  PERFORM f_progress_bar_single USING 'Combining data from data already collected before...'.

  APPEND LINES OF p_git_zfidt00242[] TO p_git_data_detail[].
  APPEND LINES OF p_git_zfidt00269[] TO p_git_data_detail[].
  APPEND LINES OF p_git_acdoca_bs[] TO p_git_data_detail[].
  APPEND LINES OF p_git_acdoca_pl[] TO p_git_data_detail[].

*  SORT p_git_data_detail ASCENDING BY tabname rldnr rbukrs gjahr poper belnr buzei.
  SORT p_git_data_detail ASCENDING BY tabname rldnr rbukrs gjahr poper.

  "*--------------------------------------------------------------------*

  APPEND LINES OF p_git_faglflext_bs[] TO p_git_data_detail_b[].
  APPEND LINES OF p_git_faglflext_pl[] TO p_git_data_detail_b[].

*  SORT p_git_data_detail_b ASCENDING BY tabname rldnr rbukrs gjahr poper belnr buzei.
  SORT p_git_data_detail_b ASCENDING BY tabname rldnr rbukrs gjahr poper.

ENDFORM.


*&---------------------------------------------------------------------*
*& Form F_PROCESS_SUMMARY
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> GIT_DATA_DETAIL[]
*&      <-- GIT_DATA_FINAL[]
*&---------------------------------------------------------------------*
FORM f_process_summary  USING p_indicator
                              lwa_zfidt00302 TYPE zficd_zfidt00302
                              p_git_data_detail TYPE gtt_data_detail
                     CHANGING p_gwa_data_sum_final TYPE zfist00173
                              p_lit_data_pre_detail TYPE gtt_data_detail.

  DATA: lit_data_pre_detail TYPE gtt_data_detail.

*--------------------------------------------------------------------*

  CLEAR: gd_where,
         gd_where1,
         gd_where2,
         gd_where3,
         gd_where4,
         gd_where5,
         git_named_seltabs[].

  "*--------------------------------------------------------------------*

  CLEAR gra_zzku[].
  CLEAR git_named_seltabs[].
  CLEAR gwa_named_seltabs.
  gwa_named_seltabs-name = 'ZZKU'.

  IF p_gwa_data_sum_final-zzku_from IS NOT INITIAL AND
     p_gwa_data_sum_final-zzku_to IS NOT INITIAL.
    IF p_gwa_data_sum_final-zzku_from EQ p_gwa_data_sum_final-zzku_to.
      f_fill_range: gra_zzku 'I' 'EQ' p_gwa_data_sum_final-zzku_from ''.
    ELSE.
      f_fill_range: gra_zzku 'I' 'BT' p_gwa_data_sum_final-zzku_from p_gwa_data_sum_final-zzku_to.
    ENDIF.
  ENDIF.

  gwa_named_seltabs-dref = REF #( gra_zzku[] ).
  APPEND gwa_named_seltabs TO git_named_seltabs.

  TRY.
      gd_where1 = cl_shdb_seltab=>combine_seltabs(
        EXPORTING it_named_seltabs = git_named_seltabs[]
      ).
    CATCH cx_shdb_exception.
  ENDTRY.

  "*--------------------------------------------------------------------*

  CLEAR gra_zzcp[].
  CLEAR git_named_seltabs[].
  CLEAR gwa_named_seltabs.
  gwa_named_seltabs-name = 'ZZCP'.

  IF p_gwa_data_sum_final-zzcp_from IS NOT INITIAL AND
     p_gwa_data_sum_final-zzcp_to IS NOT INITIAL.
    IF p_gwa_data_sum_final-zzcp_from EQ p_gwa_data_sum_final-zzcp_to.
      f_fill_range: gra_zzcp 'I' 'EQ' p_gwa_data_sum_final-zzcp_from ''.
    ELSE.
      f_fill_range: gra_zzcp 'I' 'BT' p_gwa_data_sum_final-zzcp_from p_gwa_data_sum_final-zzcp_to.
    ENDIF.
  ENDIF.

  gwa_named_seltabs-dref = REF #( gra_zzcp[] ).
  APPEND gwa_named_seltabs TO git_named_seltabs.

  TRY.
      gd_where2 = cl_shdb_seltab=>combine_seltabs(
        EXPORTING it_named_seltabs = git_named_seltabs[]
      ).
    CATCH cx_shdb_exception.
  ENDTRY.

  "*--------------------------------------------------------------------*

  CLEAR gra_racct[].
  f_fill_range: gra_racct 'I' 'EQ' p_gwa_data_sum_final-racct ''.

  CLEAR git_named_seltabs[].
  CLEAR gwa_named_seltabs.
  gwa_named_seltabs-name = 'RACCT'.
  gwa_named_seltabs-dref = REF #( gra_racct[] ).
  APPEND gwa_named_seltabs TO git_named_seltabs.

  TRY.
      gd_where = cl_shdb_seltab=>combine_seltabs(
        EXPORTING it_named_seltabs = git_named_seltabs[]
                  iv_client_field = 'RCLNT'
      ).
    CATCH cx_shdb_exception.
  ENDTRY.

  TRY.
      CLEAR lit_data_pre_detail[].
*      CALL METHOD zficl_amdp_013=>get_summary
      CALL METHOD zficl_amdp_013=>get_summary_b
        EXPORTING
*         im_kind        = 'ACDOCA PL'
          im_mandt       = sy-mandt
          im_rldnr       = '0L'
          im_bukrs       = p_gwa_data_sum_final-rbukrs
          im_gjahr       = p_gwa_data_sum_final-gjahr
*         im_poper       = p_gwa_data_sum_final-poper
*         im_budat       = '00000000'
*         im_augdt       = '00000000'
          im_where       = gd_where
          im_where1      = gd_where1
          im_where2      = gd_where2
*         im_where3      = gd_where3
*         im_where4      = gd_where4
*         im_where5      = gd_where5
          it_data_detail = p_git_data_detail[]
        IMPORTING
          et_data_detail = lit_data_pre_detail[].
    CATCH cx_amdp_error. " Exceptions when calling AMDP methods
  ENDTRY.

*  SORT lit_data_pre_detail ASCENDING BY tabname rldnr rbukrs gjahr poper belnr buzei.
  SORT lit_data_pre_detail ASCENDING BY tabname rldnr rbukrs gjahr poper.

  "*--------------------------------------------------------------------*

  IF lit_data_pre_detail[] IS NOT INITIAL.

    SELECT rbukrs,
           racct,
*           rhcur,
           rhcur_skb1,
           SUM( hsl ) AS hsl
      FROM @lit_data_pre_detail AS a
*      GROUP BY rbukrs, racct, rhcur
      GROUP BY rbukrs, racct, rhcur_skb1
        INTO CORRESPONDING FIELDS OF TABLE @p_lit_data_pre_detail
      ##db_feature_mode[itabs_in_from_clause]
      ##itab_key_in_select
      ##itab_db_select.

    IF p_lit_data_pre_detail[] IS NOT INITIAL.

      READ TABLE p_lit_data_pre_detail INTO DATA(lwa_data_pre_detail) INDEX 1.
      IF sy-subrc EQ 0.

        p_gwa_data_sum_final-currency = lwa_data_pre_detail-rhcur_skb1.
        p_gwa_data_sum_final-amount = lwa_data_pre_detail-hsl.

        IF p_indicator EQ 'X'.

          READ TABLE git_zfidt00305 INTO DATA(lwa_zfidt00305)
            WITH KEY rbukrs = p_gwa_data_sum_final-rbukrs
                     gjahr = p_gwa_data_sum_final-gjahr
                     poper = p_gwa_data_sum_final-poper
                     date_of_end_month = p_gwa_data_sum_final-date_of_end_month
                     racct = p_gwa_data_sum_final-racct
                     zzku_from = p_gwa_data_sum_final-zzku_from
                     zzku_to = p_gwa_data_sum_final-zzku_to
                     zzcp_from = p_gwa_data_sum_final-zzcp_from
                     zzcp_to = p_gwa_data_sum_final-zzcp_to.
          IF sy-subrc EQ 0.
            p_gwa_data_sum_final-amount_adjustment = lwa_zfidt00305-amount_adjustment.
          ENDIF.

        ENDIF.

        p_gwa_data_sum_final-amount_final = p_gwa_data_sum_final-amount_adjustment + lwa_data_pre_detail-hsl.

      ENDIF.

    ENDIF.

  ELSE.

    p_gwa_data_sum_final-currency = lwa_zfidt00302-waers_skb1.

  ENDIF.

ENDFORM.


*&---------------------------------------------------------------------*
*& Form F_PROCESS_SUMMARY_B
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> GIT_DATA_DETAIL[]
*&      <-- GIT_DATA_FINAL[]
*&---------------------------------------------------------------------*
FORM f_process_summary_b  USING p_git_data_detail_b TYPE gtt_data_detail
                       CHANGING p_lit_data_pre_detail TYPE gtt_data_detail.

*--------------------------------------------------------------------*

  IF p_git_data_detail_b[] IS NOT INITIAL.

    SELECT rbukrs,
           racct,
           racct_desc,
*           rhcur,
           rhcur_skb1,
           SUM( hsl ) AS hsl
      FROM @p_git_data_detail_b AS a
*      GROUP BY rbukrs, racct, racct_desc, rhcur
      GROUP BY rbukrs, racct, racct_desc, rhcur_skb1
        INTO CORRESPONDING FIELDS OF TABLE @p_lit_data_pre_detail
      ##db_feature_mode[itabs_in_from_clause]
      ##itab_key_in_select
      ##itab_db_select.

  ENDIF.

ENDFORM.


*&---------------------------------------------------------------------*
*& Form F_PREPARE_ALV_B
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> GIT_DATA_PRE_DETAIL[]
*&      <-- GIT_DATA_SUM_FINAL[]
*&---------------------------------------------------------------------*
FORM f_prepare_alv_b  USING   p_indicator
                              p_git_data_detail TYPE gtt_data_detail
                              p_git_data_detail_b TYPE gtt_data_detail
                     CHANGING p_git_data_sum_final TYPE gtt_data_sum_final
                              p_git_data_pre_detail TYPE gtt_data_pre_detail.

  DATA: lit_data_pre_detail TYPE gtt_data_detail,
        ld_racct            TYPE racct.

*--------------------------------------------------------------------*

  CLEAR: gd_percent, gd_lines.
  DESCRIBE TABLE git_zfidt00302 LINES gd_lines.

  LOOP AT git_zfidt00302 INTO DATA(lwa_zfidt00302).

    PERFORM f_progress_bar USING 'Preparing data to show ALV...'
                                  sy-tabix
                                  gd_lines.

    CLEAR gwa_data_sum_final.

    gwa_data_sum_final-rbukrs = s_rbukrs-low.
    gwa_data_sum_final-gjahr = s_gjahr-low.
    gwa_data_sum_final-poper = s_poper-low.

    PERFORM f_get_date_of_end_month USING s_gjahr-low
                                          s_poper-low
                                 CHANGING gwa_data_sum_final-date_of_end_month.

    gwa_data_sum_final-racct = lwa_zfidt00302-racct.
    gwa_data_sum_final-racct_desc = lwa_zfidt00302-racct_desc.

    gwa_data_sum_final-zzku_from = lwa_zfidt00302-zzku_from.
    gwa_data_sum_final-zzku_to = lwa_zfidt00302-zzku_to.
    gwa_data_sum_final-zzcp_from = lwa_zfidt00302-zzcp_from.
    gwa_data_sum_final-zzcp_to = lwa_zfidt00302-zzcp_to.

    gwa_data_sum_final-racct_antasena = lwa_zfidt00302-racct_antasena.
    gwa_data_sum_final-racct_antasena_desc = lwa_zfidt00302-racct_antasena_desc.

    "*--------------------------------------------------------------------*

    CLEAR lit_data_pre_detail[].
    PERFORM f_process_summary    USING p_indicator
                                       lwa_zfidt00302
                                       p_git_data_detail[]
                              CHANGING gwa_data_sum_final
                                       lit_data_pre_detail[].

    IF lit_data_pre_detail[] IS NOT INITIAL.
      APPEND LINES OF lit_data_pre_detail[] TO p_git_data_pre_detail[].
    ENDIF.

    "*--------------------------------------------------------------------*

    SELECT SINGLE *
      FROM @git_zfidt00303 AS a
        WHERE rbukrs = @gwa_data_sum_final-rbukrs AND
              ( racct_from <= @gwa_data_sum_final-racct AND
              racct_to >= @gwa_data_sum_final-racct )
          INTO @DATA(lwa_zfidt00303)
      ##db_feature_mode[itabs_in_from_clause]
      ##itab_key_in_select
      ##itab_db_select.

    IF lwa_zfidt00303 IS NOT INITIAL.
      gwa_data_sum_final-type_gl = lwa_zfidt00303-type_gl.
      gwa_data_sum_final-type_ledger = lwa_zfidt00303-type_ledger.
    ENDIF.

    "*--------------------------------------------------------------------*

*{(ADD)/Equine/SAPABAP/EG-WSU/EG-YKS/06012023/Cause: #1   A4DK908509
    gwa_data_sum_final-currency_dummy = 'IDR'.
*}(END OF ADD)/SAPABAP/EG-WSU/EG-YKS/06012023

    "*--------------------------------------------------------------------*

    READ TABLE git_zfidt00304 INTO DATA(lwa_zfidt00304)
      WITH KEY rbukrs = gwa_data_sum_final-rbukrs
               racct = gwa_data_sum_final-racct.
    IF sy-subrc EQ 0.
      gwa_data_sum_final-currency_valas = lwa_zfidt00304-currency_valas.
    ELSE.
      gwa_data_sum_final-currency_valas = gwa_data_sum_final-currency.
    ENDIF.

    "*--------------------------------------------------------------------*

    APPEND gwa_data_sum_final TO p_git_data_sum_final[].

  ENDLOOP.

  "*--------------------------------------------------------------------*
  "*--------------------------------------------------------------------*
  "*--------------------------------------------------------------------*

  CLEAR lit_data_pre_detail[].
  PERFORM f_process_summary_b    USING p_git_data_detail_b[]
                              CHANGING lit_data_pre_detail[].

  CLEAR: gd_percent, gd_lines.
  DESCRIBE TABLE lit_data_pre_detail LINES gd_lines.

  IF lit_data_pre_detail[] IS NOT INITIAL.

    LOOP AT lit_data_pre_detail INTO DATA(lwa_data_pre_detail).


      PERFORM f_progress_bar USING 'Preparing data to show ALV (step 2)...'
                                    sy-tabix
                                    gd_lines.
      CLEAR gwa_data_sum_final.
      gwa_data_sum_final-rbukrs = s_rbukrs-low.
      gwa_data_sum_final-gjahr = s_gjahr-low.
      gwa_data_sum_final-poper = s_poper-low.

      PERFORM f_get_date_of_end_month USING s_gjahr-low
                                            s_poper-low
                                   CHANGING gwa_data_sum_final-date_of_end_month.

      gwa_data_sum_final-racct = lwa_data_pre_detail-racct.
      gwa_data_sum_final-racct_desc = lwa_data_pre_detail-racct_desc.

      gwa_data_sum_final-zzku_from = ''.
      gwa_data_sum_final-zzku_to = ''.
      gwa_data_sum_final-zzcp_from = ''.
      gwa_data_sum_final-zzcp_to = ''.

      CLEAR ld_racct.
      ld_racct = |{ lwa_data_pre_detail-racct ALPHA = OUT }|.
      ld_racct = ld_racct && '0'.
      ld_racct = |{ ld_racct ALPHA = IN }|.

      gwa_data_sum_final-racct_antasena = ld_racct.
      gwa_data_sum_final-racct_antasena_desc = lwa_data_pre_detail-racct_desc.

      "*--------------------------------------------------------------------*

*****      gwa_data_sum_final-type_gl = ''.
*****      gwa_data_sum_final-type_ledger = ''.

      CLEAR lwa_zfidt00303.
      SELECT SINGLE *
        FROM @git_zfidt00303 AS a
          WHERE rbukrs = @lwa_data_pre_detail-rbukrs AND
                ( racct_from <= @lwa_data_pre_detail-racct AND
                racct_to >= @lwa_data_pre_detail-racct )
            INTO @lwa_zfidt00303
        ##db_feature_mode[itabs_in_from_clause]
        ##itab_key_in_select
        ##itab_db_select.

      IF lwa_zfidt00303 IS NOT INITIAL.
        gwa_data_sum_final-type_gl = lwa_zfidt00303-type_gl.
        gwa_data_sum_final-type_ledger = lwa_zfidt00303-type_ledger.
      ENDIF.

      "*--------------------------------------------------------------------*

*****      gwa_data_sum_final-currency_valas = ''.

      READ TABLE git_zfidt00304 INTO lwa_zfidt00304
        WITH KEY rbukrs = gwa_data_sum_final-rbukrs
                 racct = gwa_data_sum_final-racct.
      IF sy-subrc EQ 0.
        gwa_data_sum_final-currency_valas = lwa_zfidt00304-currency_valas.
      ELSE.
        gwa_data_sum_final-currency_valas = lwa_data_pre_detail-rhcur_skb1.
      ENDIF.

*{(ADD)/Equine/SAPABAP/EG-WSU/EG-YKS/06012023/Cause: #1   A4DK908509
      gwa_data_sum_final-currency_dummy = 'IDR'.
*}(END OF ADD)/SAPABAP/EG-WSU/EG-YKS/06012023

*      gwa_data_sum_final-currency = lwa_data_pre_detail-rhcur.
      gwa_data_sum_final-currency = lwa_data_pre_detail-rhcur_skb1.

      gwa_data_sum_final-amount = lwa_data_pre_detail-hsl.


*****      gwa_data_sum_final-amount_adjustment = ''.

      IF p_indicator EQ 'X'.

        READ TABLE git_zfidt00305 INTO DATA(lwa_zfidt00305)
          WITH KEY rbukrs = gwa_data_sum_final-rbukrs
                   gjahr = gwa_data_sum_final-gjahr
                   poper = gwa_data_sum_final-poper
                   date_of_end_month = gwa_data_sum_final-date_of_end_month
                   racct = gwa_data_sum_final-racct
                   zzku_from = ''
                   zzku_to = ''
                   zzcp_from = ''
                   zzcp_to = ''.
        IF sy-subrc EQ 0.
          gwa_data_sum_final-amount_adjustment = lwa_zfidt00305-amount_adjustment.
        ENDIF.

      ENDIF.

*      gwa_data_sum_final-amount_final = lwa_data_pre_detail-hsl.
      gwa_data_sum_final-amount_final = gwa_data_sum_final-amount_adjustment + lwa_data_pre_detail-hsl.

      APPEND gwa_data_sum_final TO p_git_data_sum_final.

    ENDLOOP.

  ENDIF.

ENDFORM.


*&---------------------------------------------------------------------*
*& Form F_SAVE_TO_TABLE
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_save_to_table .

  DATA: lit_zfidt00305 TYPE TABLE OF zfidt00305.

*--------------------------------------------------------------------*

  CLEAR lit_zfidt00305[].
  MOVE-CORRESPONDING git_data_sum_final[] TO lit_zfidt00305[].

  "*--------------------------------------------------------------------*

  SELECT SINGLE * FROM zfidt00305 INTO @DATA(lwa_zfidt00305)
    WHERE rbukrs EQ @s_rbukrs-low AND
          gjahr EQ @s_gjahr-low AND
          poper EQ @s_poper-low.
  IF sy-subrc EQ 0.

    DELETE FROM zfidt00305
      WHERE rbukrs EQ s_rbukrs-low AND
            gjahr EQ s_gjahr-low AND
            poper EQ s_poper-low.

    MODIFY zfidt00305 FROM TABLE lit_zfidt00305[].
    IF sy-subrc EQ 0.
      COMMIT WORK AND WAIT.
      MESSAGE 'Successfully saved to ZFIDT00305' TYPE 'S'.
    ELSE.
      MESSAGE 'Failed save to ZFIDT00305' TYPE 'S' DISPLAY LIKE 'E'.
    ENDIF.

  ELSE.

    MODIFY zfidt00305 FROM TABLE lit_zfidt00305[].
    IF sy-subrc EQ 0.
      COMMIT WORK AND WAIT.
      MESSAGE 'Successfully saved to ZFIDT00305' TYPE 'S'.
    ELSE.
      MESSAGE 'Failed save to ZFIDT00305' TYPE 'S' DISPLAY LIKE 'E'.
    ENDIF.

  ENDIF.

ENDFORM.


*&---------------------------------------------------------------------*
*& Form F_SAVE_ZIP_TO_LOCAL_PC
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_save_zip_to_local_pc .

  DATA: lit_output     TYPE TABLE OF gty_output.

*--------------------------------------------------------------------*

  CLEAR lit_output.
  PERFORM f_prepare_data_itab    USING git_data_sum_final[]
                              CHANGING lit_output[].

  "*--------------------------------------------------------------------*
  "*--------------------------------------------------------------------*
  "*--------------------------------------------------------------------*

  IF lit_output[] IS NOT INITIAL.

    PERFORM f_download_zip_to_local_pc USING lit_output[].

  ENDIF.

ENDFORM.


*&---------------------------------------------------------------------*
*& Form F_CALCULATE_AMOUNT_FINAL
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_calculate_amount_final .

  CASE gd_rb.
    WHEN 'NO TRACING'.

*      LOOP AT git_data_sum_final ASSIGNING FIELD-SYMBOL(<fs_data_sum_final>).
*        <fs_data_sum_final>-amount_final = <fs_data_sum_final>-amount + <fs_data_sum_final>-amount_adjustment.
*      ENDLOOP.

      SELECT rbukrs,
             gjahr,
             poper,
             date_of_end_month,
             racct,
             racct_desc,
             zzku_from,
             zzku_to,
             zzcp_from,
             zzcp_to,
             racct_antasena,
             racct_antasena_desc,
             type_gl,
             type_ledger,

*{(ADD)/Equine/SAPABAP/EG-WSU/EG-YKS/06012023/Cause: #1   A4DK908509
             currency_dummy,
*}(END OF ADD)/SAPABAP/EG-WSU/EG-YKS/06012023

             currency_valas,
             currency,
             amount,
             amount_adjustment,
             ( amount + amount_adjustment ) AS amount_final
        FROM @git_data_sum_final AS a
          INTO TABLE @DATA(lit_data_sum_final)
        ##db_feature_mode[itabs_in_from_clause]
        ##itab_key_in_select
        ##itab_db_select.

      IF lit_data_sum_final[] IS NOT INITIAL.
        CLEAR git_data_sum_final[].
        MOVE-CORRESPONDING lit_data_sum_final[] TO git_data_sum_final[].
      ENDIF.

    WHEN 'TRACING LEVEL 1'.
      "Do nothing

    WHEN 'TRACING LEVEL 2'.
      "Do nothing

  ENDCASE.

ENDFORM.


*&---------------------------------------------------------------------*
*& Form F_PREPARE_DATA_TO_TXT
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> GIT_DATA_SUM_FINAL
*&      <-- LIT_OUTPUT
*&---------------------------------------------------------------------*
FORM f_prepare_data_itab    USING p_git_data_sum_final TYPE gtt_data_sum_final
                         CHANGING p_lit_output TYPE gtt_output.

  DATA: lwa_output         LIKE LINE OF p_lit_output,

        ld_amount_external TYPE bapicurr-bapicurr,
        ld_str_1           TYPE string,
        ld_str_2           TYPE string,
        ld_str_3           TYPE string,
        ld_str_4           TYPE string,
        ld_str_5           TYPE string,
        ld_str_6           TYPE string,
        ld_str_7           TYPE string,
        ld_str_8           TYPE string.

*--------------------------------------------------------------------*

  LOOP AT p_git_data_sum_final INTO DATA(lwa_data_sum_final).

*{(ADD)/Equine/SAPABAP/EG-WSU/EG-YKS/14032023/Cause: #1   A4DK908716
    gd_tabix = sy-tabix.
*}(END OF ADD)/SAPABAP/EG-WSU/EG-YKS/14032023

    CLEAR: lwa_output,
           ld_str_1,
           ld_str_2,
           ld_str_3,
           ld_str_4,
           ld_str_5,
           ld_str_6 ,
           ld_str_7,
           ld_str_8.

    "*--------------------------------------------------------------------*

*{(ADD)/Equine/SAPABAP/EG-WSU/EG-YKS/14032023/Cause: #1   A4DK908716
    IF gd_tabix EQ 1.

      lwa_output-line = 'DTE_EFFT' && '|' &&
                        'CDE_BRANCH' && '|' &&
                        'IDN_GL' && '|' &&
                        'CDE_CURR' && '|' &&
                        'AMT_BAL_EQV' && '|' &&
                        'CDE_TYPE_GL' && '|' &&
                        'CDE_TYPE_LEDGER' && '|' &&
                        'DATA_SOURCE'.

      APPEND lwa_output TO p_lit_output.

    ENDIF.
*}(END OF ADD)/SAPABAP/EG-WSU/EG-YKS/14032023

    "*--------------------------------------------------------------------*

    "1 DTE_EFFT
    PERFORM f_conv_date_sapformat_with_sep    USING lwa_data_sum_final-date_of_end_month
                                                    '-'
                                           CHANGING ld_str_1.
    CONDENSE ld_str_1.

    "2 CDE_BRANCH
    ld_str_2 = lwa_data_sum_final-rbukrs. CONDENSE ld_str_2.

    "3 IDN_GL
*    ld_str_3 = lwa_data_sum_final-racct_antasena. CONDENSE ld_str_3.
    ld_str_3 = |{ lwa_data_sum_final-racct_antasena ALPHA = OUT }|. CONDENSE ld_str_3.

    "4 CDE_CURR
*{(REM)/Equine/SAPABAP/EG-WSU/EG-YKS/14032023/Cause: #2   A4DK908716
*    ld_str_4 = lwa_data_sum_final-currency_valas. CONDENSE ld_str_4.
*}(END OF REM)/SAPABAP/EG-WSU/EG-YKS/14032023

*{(ADD)/Equine/SAPABAP/EG-WSU/EG-YKS/14032023/Cause: #2   A4DK908716
    IF lwa_data_sum_final-currency_valas IS NOT INITIAL.
      ld_str_4 = lwa_data_sum_final-currency_valas. CONDENSE ld_str_4.
    ELSE.
      ld_str_4 = lwa_data_sum_final-currency_dummy. CONDENSE ld_str_4.
    ENDIF.
*}(END OF ADD)/SAPABAP/EG-WSU/EG-YKS/14032023

    "5 AMT_BAL_EQV
    CLEAR ld_amount_external.

*{(REM)/Equine/SAPABAP/EG-WSU/EG-YKS/06012023/Cause: #1   A4DK908509
*    PERFORM f_convert_amount    USING 'TO_EXTERNAL'
*                                      lwa_data_sum_final-currency
*                                      lwa_data_sum_final-amount_final
*                             CHANGING ld_amount_external.
*}(END OF REM)/SAPABAP/EG-WSU/EG-YKS/06012023

*{(ADD)/Equine/SAPABAP/EG-WSU/EG-YKS/06012023/Cause: #1   A4DK908509
    PERFORM f_convert_amount    USING 'TO_EXTERNAL'
                                      lwa_data_sum_final-currency_dummy
                                      lwa_data_sum_final-amount_final
                             CHANGING ld_amount_external.
*}(END OF ADD)/SAPABAP/EG-WSU/EG-YKS/06012023

    ld_str_5 = ld_amount_external. CONDENSE ld_str_5.
    REPLACE ALL OCCURRENCES OF '.0000' IN ld_str_5 WITH ''.
    REPLACE ALL OCCURRENCES OF '-' IN ld_str_5 WITH ''.
    IF ld_amount_external < 0.
*****      ld_str_5 = '-' && ld_str_5.
      ld_str_5 = '-' && ld_str_5 && '.00'.
    ELSE.
*****      ld_str_5 = ld_str_5.
      ld_str_5 = ld_str_5 && '.00'.
    ENDIF.

    "6 CDE_TYPE_GL
    ld_str_6 = lwa_data_sum_final-type_gl. CONDENSE ld_str_6.

    "7 CDE_TYPE_LEDGER
    ld_str_7 = lwa_data_sum_final-type_ledger. CONDENSE ld_str_7.

    "8 DATA_SOURCE
    ld_str_8 = 'GL_ADMF'. CONDENSE ld_str_8.

    lwa_output-line = ld_str_1 && '|' &&
                       ld_str_2 && '|' &&
                       ld_str_3 && '|' &&
                       ld_str_4 && '|' &&
                       ld_str_5 && '|' &&
                       ld_str_6 && '|' &&
                       ld_str_7 && '|' &&
                       ld_str_8.

    APPEND lwa_output TO p_lit_output.

  ENDLOOP.

ENDFORM.


*&---------------------------------------------------------------------*
*& Form F_DOWNLOAD_ZIP_TO_LOCAL_PC
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> LIT_OUTPUT[]
*&---------------------------------------------------------------------*
FORM f_download_zip_to_local_pc  USING    p_lit_output TYPE gtt_output.

  DATA: lcl_zip          TYPE REF TO cl_abap_zip,

        lit_binary_tab   TYPE solix_tab,
        lit_zip_bin_data TYPE STANDARD TABLE OF raw255,

        ld_filename      TYPE string,
        ld_filesize      TYPE i,
        ld_zip_filesize  TYPE i,
        ld_xstring       TYPE xstring,
        ld_zip_xstring   TYPE xstring,
        ld_path          TYPE string,
        ld_fullpath      TYPE string.

*--------------------------------------------------------------------*

  "Convert the data from Itab to Binary format
  CLEAR ld_filesize.
  CALL FUNCTION 'SCMS_TEXT_TO_BINARY'
    IMPORTING
      output_length = ld_filesize
    TABLES
      text_tab      = p_lit_output
      binary_tab    = lit_binary_tab
    EXCEPTIONS
      failed        = 1
      OTHERS        = 2.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
    WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

  "*--------------------------------------------------------------------*

  "Convert the data from Binary format to XSTRING
  CALL FUNCTION 'SCMS_BINARY_TO_XSTRING'
    EXPORTING
      input_length = ld_filesize
    IMPORTING
      buffer       = ld_xstring
    TABLES
      binary_tab   = lit_binary_tab
    EXCEPTIONS
      failed       = 1
      OTHERS       = 2.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
    WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

  "*--------------------------------------------------------------------*

  CREATE OBJECT lcl_zip. "Create instance of Zip Class

  CLEAR ld_filename.
  ld_filename = gc_filename && '.txt'.

  "Add file to the zip folder
  lcl_zip->add(  name    = ld_filename
                content = ld_xstring ).

  "Get the binary stream for ZIP file
  ld_zip_xstring = lcl_zip->save( ).

  "Convert the XSTRING to Binary table
  CLEAR ld_filesize.
  CALL FUNCTION 'SCMS_XSTRING_TO_BINARY'
    EXPORTING
      buffer        = ld_zip_xstring
    IMPORTING
      output_length = ld_zip_filesize
    TABLES
      binary_tab    = lit_zip_bin_data.

  "*--------------------------------------------------------------------*

  CLEAR ld_filename.
  "DD.MM.YYYY_HH.MM.SS
  PERFORM f_get_date_time USING sy-datum
                                sy-uzeit
                                '_'
                       CHANGING ld_filename.

  ld_filename = ld_filename && '_' && gc_filename.

  cl_gui_frontend_services=>file_save_dialog(
    EXPORTING
      window_title         = 'Select the File Save Location'
      file_filter          = '(*.zip)|*.zip|'
      default_file_name    = ld_filename
    CHANGING
      filename             = ld_filename
      path                 = ld_path
      fullpath             = ld_fullpath
    EXCEPTIONS
      cntl_error           = 1
      error_no_gui         = 2
      not_supported_by_gui = 3
      OTHERS               = 4
         ).
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
    WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

  "*--------------------------------------------------------------------*

  CHECK ld_fullpath IS NOT INITIAL.

  "Download the Zip file
  CLEAR ld_filesize.
  cl_gui_frontend_services=>gui_download(
    EXPORTING
      bin_filesize              = ld_zip_filesize
      filename                  = ld_fullpath
      filetype                  = 'BIN'
    IMPORTING
      filelength                = ld_filesize
    CHANGING
      data_tab                  = lit_zip_bin_data
    EXCEPTIONS
      file_write_error          = 1
      no_batch                  = 2
      gui_refuse_filetransfer   = 3
      invalid_type              = 4
      no_authority              = 5
      unknown_error             = 6
      header_not_allowed        = 7
      separator_not_allowed     = 8
      filesize_not_allowed      = 9
      header_too_long           = 10
      dp_error_create           = 11
      dp_error_send             = 12
      dp_error_write            = 13
      unknown_dp_error          = 14
      access_denied             = 15
      dp_out_of_memory          = 16
      disk_full                 = 17
      dp_timeout                = 18
      file_not_found            = 19
      dataprovider_exception    = 20
      control_flush_error       = 21
      not_supported_by_gui      = 22
      error_no_gui              = 23
      OTHERS                    = 24
).
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
    WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

ENDFORM.
