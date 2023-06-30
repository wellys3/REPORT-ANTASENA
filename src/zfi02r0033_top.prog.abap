*&---------------------------------------------------------------------*
*& Include          ZFI02R0032_TOP
*&---------------------------------------------------------------------*


*--------------------------------------------------------------------*
* Type-Pools                                                         *
*--------------------------------------------------------------------*
*TYPE-POOLS: icon, truxs, col, fiehc.
*--------------------------------------------------------------------*
* End - Type-Pools                                                   *
*--------------------------------------------------------------------*


*--------------------------------------------------------------------*
* Nodes                                                              *
*--------------------------------------------------------------------*
*NODES: peras.
*--------------------------------------------------------------------*
* End - Nodes                                                        *
*--------------------------------------------------------------------*


*--------------------------------------------------------------------*
* Infotype
*--------------------------------------------------------------------*
*INFOTYPES: 0000, 0001, 2006 MODE N.
*INFOTYPES: 0000, 0001, 2006.
*--------------------------------------------------------------------*
* End Infotype
*--------------------------------------------------------------------*


*--------------------------------------------------------------------*
* Tables                                                             *
*--------------------------------------------------------------------*
TABLES: acdoca.
*--------------------------------------------------------------------*
* End - Tables                                                       *
*--------------------------------------------------------------------*


*--------------------------------------------------------------------*
* Global Constants                                                   *
*--------------------------------------------------------------------*
CONSTANTS: gc_report_title TYPE lvc_title VALUE 'Report Antasena',
           gc_filename     TYPE string VALUE 'OTH_ADMF_GL_LEDGER',
           gc_rbukrs       TYPE bukrs VALUE 'ADMF'.
*--------------------------------------------------------------------*
* End - Global Constants                                             *
*--------------------------------------------------------------------*


*--------------------------------------------------------------------*
* Global Types                                                       *
*--------------------------------------------------------------------*
*Custom
TYPES: BEGIN OF gty_data_detail,
         rclnt          TYPE acdoca-rclnt,

         tabname        TYPE dd03l-tabname,
         rldnr          TYPE acdoca-rldnr,
         rbukrs         TYPE acdoca-rbukrs,
         gjahr          TYPE acdoca-gjahr,
         poper          TYPE acdoca-poper,
         belnr          TYPE acdoca-belnr,
         buzei          TYPE zfidt00269-buzei,

         bktxt          TYPE bkpf-bktxt,

         fstag          TYPE zfidt00269-fstag,
         zopenitem      TYPE zfidt00269-zopenitem,
         txt50          TYPE zfidt00269-txt50,

         rhcur          TYPE acdoca-rhcur,

         rhcur_skb1     TYPE skb1-waers,

         racct          TYPE acdoca-racct,
         racct_desc     TYPE skat-txt50,

         glaccount_type TYPE acdoca-glaccount_type,
         ktopl          TYPE acdoca-ktopl,

         hsl            TYPE acdoca-hsl,

         budat          TYPE acdoca-budat,

         xopvw          TYPE acdoca-xopvw,
         mitkz          TYPE skb1-mitkz,

         augdt          TYPE acdoca-augdt,

         zzku           TYPE acdoca-zzku,
         zzcp           TYPE acdoca-zzcp,
         zzpr           TYPE acdoca-zzpr,
         zzch           TYPE acdoca-zzch,
         zzpo           TYPE acdoca-zzpo,
         zzcc           TYPE acdoca-zzcc,
         zz07           TYPE acdoca-zz07,
         zz08           TYPE acdoca-zz08,
         zz09           TYPE acdoca-zz09,
         zz10           TYPE acdoca-zz10,

         kostl          TYPE zfidt00269-kostl,
         prctr          TYPE zfidt00269-prctr,
         erdat          TYPE zfidt00269-erdat,
         erzeit         TYPE zfidt00269-erzeit,
         ernam          TYPE zfidt00269-ernam,

         hslvt          TYPE faglflext-hslvt,
         hsl01          TYPE faglflext-hsl01,
         hsl02          TYPE faglflext-hsl02,
         hsl03          TYPE faglflext-hsl03,
         hsl04          TYPE faglflext-hsl04,
         hsl05          TYPE faglflext-hsl05,
         hsl06          TYPE faglflext-hsl06,
         hsl07          TYPE faglflext-hsl07,
         hsl08          TYPE faglflext-hsl08,
         hsl09          TYPE faglflext-hsl09,
         hsl10          TYPE faglflext-hsl10,
         hsl11          TYPE faglflext-hsl11,
         hsl12          TYPE faglflext-hsl12,
         hsl13          TYPE faglflext-hsl13,
         hsl14          TYPE faglflext-hsl14,
         hsl15          TYPE faglflext-hsl15,
         hsl16          TYPE faglflext-hsl16,
       END OF gty_data_detail,

       BEGIN OF gty_data_detail_b,
         rclnt          TYPE acdoca-rclnt,

         tabname        TYPE dd03l-tabname,
         rldnr          TYPE acdoca-rldnr,
         rbukrs         TYPE acdoca-rbukrs,
         gjahr          TYPE acdoca-gjahr,
         poper          TYPE acdoca-poper,

         racct          TYPE acdoca-racct,
         racct_desc     TYPE skat-txt50,
         glaccount_type TYPE acdoca-glaccount_type,
         zzku           TYPE acdoca-zzku,
         zzcp           TYPE acdoca-zzcp,

         rhcur          TYPE acdoca-rhcur,
         rhcur_skb1     TYPE skb1-waers,

         hsl            TYPE acdoca-hsl,

         hslvt          TYPE faglflext-hslvt,
         hsl01          TYPE faglflext-hsl01,
         hsl02          TYPE faglflext-hsl02,
         hsl03          TYPE faglflext-hsl03,
         hsl04          TYPE faglflext-hsl04,
         hsl05          TYPE faglflext-hsl05,
         hsl06          TYPE faglflext-hsl06,
         hsl07          TYPE faglflext-hsl07,
         hsl08          TYPE faglflext-hsl08,
         hsl09          TYPE faglflext-hsl09,
         hsl10          TYPE faglflext-hsl10,
         hsl11          TYPE faglflext-hsl11,
         hsl12          TYPE faglflext-hsl12,
         hsl13          TYPE faglflext-hsl13,
         hsl14          TYPE faglflext-hsl14,
         hsl15          TYPE faglflext-hsl15,
         hsl16          TYPE faglflext-hsl16,
       END OF gty_data_detail_b,

       BEGIN OF gty_racct,
         racct TYPE acdoca-racct,
       END OF gty_racct,

       BEGIN OF gty_output,
         line(1022) TYPE c,
       END OF gty_output.

TYPES: gtt_data_sum_final      TYPE TABLE OF zfist00173,

*       gtt_data_detail         TYPE TABLE OF gty_data_detail,
*       gtt_data_detail_b       TYPE TABLE OF gty_data_detail,
*       gtt_data_detail_combine TYPE TABLE OF gty_data_detail,
*       gtt_data_pre_detail     TYPE TABLE OF gty_data_detail,
*       gtt_zfidt00242          TYPE TABLE OF gty_data_detail,
*       gtt_zfidt00269          TYPE TABLE OF gty_data_detail,
*       gtt_acdoca_bs           TYPE TABLE OF gty_data_detail,
*       gtt_acdoca_pl           TYPE TABLE OF gty_data_detail,
*       gtt_faglflext_bs        TYPE TABLE OF gty_data_detail,
*       gtt_faglflext_pl        TYPE TABLE OF gty_data_detail,

       gtt_data_detail         TYPE TABLE OF gty_data_detail_b,
       gtt_data_detail_b       TYPE TABLE OF gty_data_detail_b,
       gtt_data_detail_combine TYPE TABLE OF gty_data_detail_b,
       gtt_data_pre_detail     TYPE TABLE OF gty_data_detail_b,
       gtt_zfidt00242          TYPE TABLE OF gty_data_detail_b,
       gtt_zfidt00269          TYPE TABLE OF gty_data_detail_b,
       gtt_acdoca_bs           TYPE TABLE OF gty_data_detail_b,
       gtt_acdoca_pl           TYPE TABLE OF gty_data_detail_b,
       gtt_faglflext_bs        TYPE TABLE OF gty_data_detail_b,
       gtt_faglflext_pl        TYPE TABLE OF gty_data_detail_b,

       gtt_output              TYPE TABLE OF gty_output.

*--------------------------------------------------------------------*

*Standard
TYPES: BEGIN OF gty_named_dref,
         name TYPE string,
         dref TYPE REF TO data,
       END OF gty_named_dref.
*--------------------------------------------------------------------*
* End - Global Types                                                 *
*--------------------------------------------------------------------*


*--------------------------------------------------------------------*
* Global Variable                                                    *
*--------------------------------------------------------------------*
*Custom

*---Variable Program - Table & Work Area
DATA: git_data_sum_final      TYPE TABLE OF zfist00173,
      gwa_data_sum_final      TYPE zfist00173,

*      git_data_detail         TYPE TABLE OF gty_data_detail,
*      git_data_detail_b       TYPE TABLE OF gty_data_detail,
*      git_data_detail_combine TYPE TABLE OF gty_data_detail,
*      git_data_pre_detail     TYPE TABLE OF gty_data_detail,

      git_data_detail         TYPE TABLE OF gty_data_detail_b,
      git_data_detail_b       TYPE TABLE OF gty_data_detail_b,
      git_data_detail_combine TYPE TABLE OF gty_data_detail_b,
      git_data_pre_detail     TYPE TABLE OF gty_data_detail_b,

*      git_zfidt00302          TYPE TABLE OF zfidt00302,
      git_zfidt00302          TYPE TABLE OF zficd_zfidt00302,
      git_zfidt00303          TYPE TABLE OF zfidt00303,
      git_zfidt00304          TYPE TABLE OF zfidt00304,

*      git_zfidt00242          TYPE TABLE OF gty_data_detail,
*      git_zfidt00269          TYPE TABLE OF gty_data_detail,
*      git_acdoca_bs           TYPE TABLE OF gty_data_detail,
*      git_acdoca_pl           TYPE TABLE OF gty_data_detail,
*      git_faglflext_bs        TYPE TABLE OF gty_data_detail,
*      git_faglflext_pl        TYPE TABLE OF gty_data_detail,

      git_zfidt00242          TYPE TABLE OF gty_data_detail_b,
      git_zfidt00269          TYPE TABLE OF gty_data_detail_b,
      git_acdoca_bs           TYPE TABLE OF gty_data_detail_b,
      git_acdoca_pl           TYPE TABLE OF gty_data_detail_b,
      git_faglflext_bs        TYPE TABLE OF gty_data_detail_b,
      git_faglflext_pl        TYPE TABLE OF gty_data_detail_b,

      git_zfidt00305          TYPE TABLE OF zfidt00305,

      git_racct               TYPE TABLE OF gty_racct.

*--------------------------------------------------------------------*
*Standard

*---Variable Program - Single Value
DATA: gd_rb         TYPE char20,
      gd_line_excel TYPE i,
      gd_tabix      TYPE i,
      gd_subrc      TYPE sy-subrc,
      gd_message    TYPE text255,
      gd_answer(1). "Variable for Popup Answer.

*---For AMDP Class
DATA: gd_where          TYPE sxmsbody,
      gd_where1         TYPE sxmsbody,
      gd_where2         TYPE sxmsbody,
      gd_where3         TYPE sxmsbody,
      gd_where4         TYPE sxmsbody,
      gd_where5         TYPE sxmsbody,
      git_named_seltabs TYPE TABLE OF gty_named_dref,
      gwa_named_seltabs TYPE gty_named_dref.

*---For Refresh ALV
DATA: gwa_stable     TYPE lvc_s_stbl,
      gd_refreshmode TYPE salv_de_constant.

*---For Debugger
DATA: git_terminal          TYPE TABLE OF tvarvc WITH HEADER LINE,
      gd_opcode_usr_attr(1) TYPE x VALUE 5,
      gd_terminal           TYPE usr41-terminal,
      gd_zdebug             TYPE text255,
      gd_flag               TYPE text255.

*---For Status Progress
DATA: gd_percent TYPE i,
      gd_lines   TYPE i.

*---Variable Get Execution Time
DATA: gd_start TYPE p DECIMALS 3,
      gd_stop  TYPE p DECIMALS 3,
      gd_run   TYPE p DECIMALS 3.
*--------------------------------------------------------------------*
* End - Global Variable                                              *
*--------------------------------------------------------------------*


*--------------------------------------------------------------------*
* Global Range                                                       *
*--------------------------------------------------------------------*
*Custom

RANGES: gra_zzku FOR acdoca-zzku,
        gra_zzcp FOR acdoca-zzcp.

*--------------------------------------------------------------------*
*Standard

RANGES: gra_racct FOR acdoca-racct,
        gra_racct_antasena FOR acdoca-racct.

*--------------------------------------------------------------------*
* End - Global Variable                                              *
*--------------------------------------------------------------------*


*--------------------------------------------------------------------*
* Define                                                             *
*--------------------------------------------------------------------*
DEFINE f_fill_range.
  &1-sign = &2.
  &1-option = &3.
  &1-low = &4.
  &1-high = &5.
  APPEND &1.
END-OF-DEFINITION.

"Example: f_fill_range: lra_lptyp 'I' 'EQ' lwa_lptyp-lptyp ''.
*--------------------------------------------------------------------*
* End - Define                                                       *
*--------------------------------------------------------------------*


*----------------------------------------------------------------------*
* Selection Screen                                                     *
*----------------------------------------------------------------------*
SELECTION-SCREEN BEGIN OF BLOCK a02 WITH FRAME TITLE text902.
SELECT-OPTIONS: s_rbukrs FOR acdoca-rbukrs MEMORY ID zfi02r0033_s_rbukrs NO-EXTENSION NO INTERVALS DEFAULT gc_rbukrs,
              s_gjahr FOR acdoca-gjahr MEMORY ID zfi02r0033_s_gjahr NO-EXTENSION NO INTERVALS,
              s_poper FOR acdoca-poper MEMORY ID zfi02r0033_s_poper NO-EXTENSION NO INTERVALS.
SELECTION-SCREEN END OF BLOCK a02.

SELECTION-SCREEN BEGIN OF BLOCK a04 WITH FRAME TITLE text904.
SELECTION-SCREEN BEGIN OF LINE.
*PARAMETERS rb1 RADIOBUTTON GROUP rb1 USER-COMMAND rad1 DEFAULT 'X' modif id p2.
PARAMETERS rb1 RADIOBUTTON GROUP rb1 DEFAULT 'X' MODIF ID p2.
SELECTION-SCREEN COMMENT 4(30) text801.
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN BEGIN OF LINE.
PARAMETERS rb2 RADIOBUTTON GROUP rb1.
SELECTION-SCREEN COMMENT 4(30) text802  MODIF ID p2.
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN BEGIN OF LINE.
PARAMETERS rb3 RADIOBUTTON GROUP rb1  MODIF ID p2.
SELECTION-SCREEN COMMENT 4(30) text803.
SELECTION-SCREEN END OF LINE.

*SELECTION-SCREEN BEGIN OF LINE.
*PARAMETERS rb4 RADIOBUTTON GROUP rb1.
*SELECTION-SCREEN COMMENT 4(30) text804.
*SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN END OF BLOCK a04.

*----------------------------------------------------------------------*
* End - Selection Screen                                               *
*----------------------------------------------------------------------*
