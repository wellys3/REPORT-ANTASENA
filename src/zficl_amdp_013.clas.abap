CLASS zficl_amdp_013 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_amdp_marker_hdb .

    "**********************************************************************

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
*             rtcur     TYPE zfidt00269-rtcur,

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
           END OF gty_data_detail.

    TYPES: BEGIN OF gty_data_detail_b,
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
           END OF gty_data_detail_b.

    TYPES: BEGIN OF gty_racct,
             racct TYPE acdoca-racct,
           END OF gty_racct.

    TYPES: "gtt_zfidt00242 TYPE TABLE OF gty_zfidt00242,
      gtt_zfidt00242   TYPE TABLE OF gty_data_detail,
      gtt_zfidt00242_b TYPE TABLE OF gty_data_detail_b,
      gtt_zfidt00269   TYPE TABLE OF gty_data_detail,
      gtt_zfidt00269_b TYPE TABLE OF gty_data_detail_b,
      gtt_acdoca       TYPE TABLE OF gty_data_detail,
      gtt_acdoca_b     TYPE TABLE OF gty_data_detail_b,
      gtt_faglflext    TYPE TABLE OF gty_data_detail,
      gtt_faglflext_b  TYPE TABLE OF gty_data_detail_b,
      gtt_racct        TYPE TABLE OF gty_racct,
      gtt_data_detail  TYPE TABLE OF gty_data_detail,
      gtt_data_detail_b  TYPE TABLE OF gty_data_detail_b.

    "**********************************************************************

    CLASS-METHODS:
      get_demo IMPORTING
                 VALUE(it_zfidt00269) TYPE gtt_zfidt00269
               EXPORTING
                 VALUE(et_zfidt00269) TYPE gtt_zfidt00269
               RAISING
                 cx_amdp_error,

      get_zfidt00242_b IMPORTING
                         VALUE(im_mandt)      TYPE sy-mandt
                         VALUE(im_rldnr)      TYPE acdoca-rldnr
                         VALUE(im_bukrs)      TYPE acdoca-rbukrs
                         VALUE(im_gjahr)      TYPE acdoca-gjahr

*                         VALUE(im_where)      TYPE sxmsbody
*                         VALUE(im_where1)     TYPE sxmsbody
*                         VALUE(im_where2)     TYPE sxmsbody
*                         VALUE(im_where3)     TYPE sxmsbody
*                         VALUE(im_where4)     TYPE sxmsbody
*                         VALUE(im_where5)     TYPE sxmsbody

                         VALUE(it_racct)      TYPE gtt_racct
                       EXPORTING
                         VALUE(et_zfidt00242) TYPE gtt_zfidt00242
                       RAISING
                         cx_amdp_error,

      get_zfidt00242_c IMPORTING
                         VALUE(im_mandt)      TYPE sy-mandt
                         VALUE(im_rldnr)      TYPE acdoca-rldnr
                         VALUE(im_bukrs)      TYPE acdoca-rbukrs
                         VALUE(im_gjahr)      TYPE acdoca-gjahr
                         VALUE(it_racct)      TYPE gtt_racct
                       EXPORTING
                         VALUE(et_zfidt00242) TYPE gtt_zfidt00242_b
                       RAISING
                         cx_amdp_error,

      get_zfidt00269_b IMPORTING
                         VALUE(im_mandt)      TYPE sy-mandt
                         VALUE(im_rldnr)      TYPE acdoca-rldnr
                         VALUE(im_bukrs)      TYPE acdoca-rbukrs
                         VALUE(im_gjahr)      TYPE acdoca-gjahr

                         VALUE(im_poper)      TYPE acdoca-poper

*                         VALUE(im_where)      TYPE sxmsbody
*                         VALUE(im_where1)     TYPE sxmsbody
*                         VALUE(im_where2)     TYPE sxmsbody
*                         VALUE(im_where3)     TYPE sxmsbody
*                         VALUE(im_where4)     TYPE sxmsbody
*                         VALUE(im_where5)     TYPE sxmsbody

                         VALUE(it_racct)      TYPE gtt_racct
                       EXPORTING
                         VALUE(et_zfidt00269) TYPE gtt_zfidt00269
                       RAISING
                         cx_amdp_error,

      get_zfidt00269_c IMPORTING
                         VALUE(im_mandt)      TYPE sy-mandt
                         VALUE(im_rldnr)      TYPE acdoca-rldnr
                         VALUE(im_bukrs)      TYPE acdoca-rbukrs
                         VALUE(im_gjahr)      TYPE acdoca-gjahr

                         VALUE(im_poper)      TYPE acdoca-poper

                         VALUE(it_racct)      TYPE gtt_racct
                       EXPORTING
                         VALUE(et_zfidt00269) TYPE gtt_zfidt00269_b
                       RAISING
                         cx_amdp_error,

      get_summary IMPORTING
                    VALUE(im_mandt)       TYPE sy-mandt
                    VALUE(im_rldnr)       TYPE acdoca-rldnr
                    VALUE(im_bukrs)       TYPE acdoca-rbukrs
                    VALUE(im_gjahr)       TYPE acdoca-gjahr

                    VALUE(im_where)       TYPE sxmsbody
                    VALUE(im_where1)      TYPE sxmsbody
                    VALUE(im_where2)      TYPE sxmsbody
                    VALUE(im_where3)      TYPE sxmsbody
                    VALUE(im_where4)      TYPE sxmsbody
                    VALUE(im_where5)      TYPE sxmsbody

                    VALUE(it_data_detail) TYPE gtt_data_detail
                  EXPORTING
                    VALUE(et_data_detail) TYPE gtt_data_detail
                  RAISING
                    cx_amdp_error,

      get_summary_b IMPORTING
                    VALUE(im_mandt)       TYPE sy-mandt
                    VALUE(im_rldnr)       TYPE acdoca-rldnr
                    VALUE(im_bukrs)       TYPE acdoca-rbukrs
                    VALUE(im_gjahr)       TYPE acdoca-gjahr

                    VALUE(im_where)       TYPE sxmsbody
                    VALUE(im_where1)      TYPE sxmsbody
                    VALUE(im_where2)      TYPE sxmsbody

                    VALUE(it_data_detail) TYPE gtt_data_detail_b
                  EXPORTING
                    VALUE(et_data_detail) TYPE gtt_data_detail_b
                  RAISING
                    cx_amdp_error,

      get_acdoca_b IMPORTING
                     VALUE(im_kind)   TYPE char20
                     VALUE(im_mandt)  TYPE sy-mandt
                     VALUE(im_rldnr)  TYPE acdoca-rldnr
                     VALUE(im_bukrs)  TYPE acdoca-rbukrs
                     VALUE(im_gjahr)  TYPE acdoca-gjahr

                     VALUE(im_poper)  TYPE acdoca-poper
                     VALUE(im_budat)  TYPE acdoca-budat
                     VALUE(im_augdt)  TYPE acdoca-augdt

*                     VALUE(im_where)  TYPE sxmsbody
*                     VALUE(im_where1) TYPE sxmsbody
*                     VALUE(im_where2) TYPE sxmsbody
*                     VALUE(im_where3) TYPE sxmsbody
*                     VALUE(im_where4) TYPE sxmsbody
*                     VALUE(im_where5) TYPE sxmsbody

                     VALUE(it_racct)  TYPE gtt_racct
                   EXPORTING
                     VALUE(et_acdoca) TYPE gtt_acdoca
                   RAISING
                     cx_amdp_error,

      get_acdoca_c IMPORTING
                     VALUE(im_kind)   TYPE char20
                     VALUE(im_mandt)  TYPE sy-mandt
                     VALUE(im_rldnr)  TYPE acdoca-rldnr
                     VALUE(im_bukrs)  TYPE acdoca-rbukrs
                     VALUE(im_gjahr)  TYPE acdoca-gjahr

                     VALUE(im_poper)  TYPE acdoca-poper
                     VALUE(im_budat)  TYPE acdoca-budat
                     VALUE(im_augdt)  TYPE acdoca-augdt

*                     VALUE(im_where)  TYPE sxmsbody
*                     VALUE(im_where1) TYPE sxmsbody
*                     VALUE(im_where2) TYPE sxmsbody
*                     VALUE(im_where3) TYPE sxmsbody
*                     VALUE(im_where4) TYPE sxmsbody
*                     VALUE(im_where5) TYPE sxmsbody

                     VALUE(it_racct)  TYPE gtt_racct
                   EXPORTING
                     VALUE(et_acdoca) TYPE gtt_acdoca_b
                   RAISING
                     cx_amdp_error,

      get_faglflext_b IMPORTING
                        VALUE(im_kind)      TYPE char20
                        VALUE(im_mandt)     TYPE sy-mandt
                        VALUE(im_rldnr)     TYPE acdoca-rldnr
                        VALUE(im_bukrs)     TYPE acdoca-rbukrs
                        VALUE(im_gjahr)     TYPE acdoca-gjahr

                        VALUE(im_poper)     TYPE acdoca-poper
*                      VALUE(im_budat)     TYPE acdoca-budat
*                      VALUE(im_augdt)     TYPE acdoca-augdt

*                        VALUE(im_where)     TYPE sxmsbody
*                        VALUE(im_where1)    TYPE sxmsbody
*                        VALUE(im_where2)    TYPE sxmsbody
*                        VALUE(im_where3)    TYPE sxmsbody
*                        VALUE(im_where4)    TYPE sxmsbody
*                        VALUE(im_where5)    TYPE sxmsbody

                        VALUE(it_racct)     TYPE gtt_racct
                      EXPORTING
                        VALUE(et_faglflext) TYPE gtt_faglflext
                      RAISING
                        cx_amdp_error,

      get_faglflext_c IMPORTING
                        VALUE(im_kind)      TYPE char20
                        VALUE(im_mandt)     TYPE sy-mandt
                        VALUE(im_rldnr)     TYPE acdoca-rldnr
                        VALUE(im_bukrs)     TYPE acdoca-rbukrs
                        VALUE(im_gjahr)     TYPE acdoca-gjahr

                        VALUE(im_poper)     TYPE acdoca-poper
*                      VALUE(im_budat)     TYPE acdoca-budat
*                      VALUE(im_augdt)     TYPE acdoca-augdt

                        VALUE(it_racct)     TYPE gtt_racct
                      EXPORTING
                        VALUE(et_faglflext) TYPE gtt_faglflext_b
                      RAISING
                        cx_amdp_error.

    "**********************************************************************

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zficl_amdp_013 IMPLEMENTATION.

  METHOD get_demo    BY DATABASE PROCEDURE FOR HDB
                           LANGUAGE SQLSCRIPT
                           OPTIONS READ-ONLY.

    et_zfidt00269 = select * from :it_zfidt00269;

  ENDMETHOD.

  METHOD get_zfidt00242_b    BY DATABASE PROCEDURE FOR HDB
                             LANGUAGE SQLSCRIPT
                             OPTIONS READ-ONLY
                             USING zfivt00092.

*    et_zfidt00242_temp = APPLY_FILTER (ZFIVT00092, :im_where);
*
*    et_zfidt00242_temp = APPLY_FILTER (:et_zfidt00242_temp, :im_where1);
*    et_zfidt00242_temp = APPLY_FILTER (:et_zfidt00242_temp, :im_where2);
*    et_zfidt00242_temp = APPLY_FILTER (:et_zfidt00242_temp, :im_where3);
*    et_zfidt00242_temp = APPLY_FILTER (:et_zfidt00242_temp, :im_where4);
*    et_zfidt00242_temp = APPLY_FILTER (:et_zfidt00242_temp, :im_where5);

    et_zfidt00242 = select
                     a.rclnt,

                     'ZFIDT00242' as tabname,
                     a.rldnr,
                     a.bukrs as rbukrs,
                     a.gjahr,
                     a.poper,
                     '' as belnr,
                     a.buzei,

                     '' as bktxt,

                     a.fstag,
                     a.zopenitem,
                     a.txt50,
*                     a.rtcur,

                     a.rhcur,
                     a.rhcur_skb1,
                     a.saknr as racct,
                     '' as racct_desc,

                     a.glaccount_type,
                     a.ktopl,

                     a.hsl,
*                     a.tsl,

                     '' as budat,

                     '' as xopvw,
                     '' as mitkz,

                     '' as augdt,

                     a.zzku,
                     a.zzcp,
                     a.zzpr,
                     a.zzch,
                     a.zzpo,
                     a.zzcc,
                     a.zz07,
                     a.zz08,
                     a.zz09,
                     a.zz10,

                     a.kostl,
                     a.prctr,
                     a.erdat,
                     a.erzeit,
                     a.ernam,

                     '0' as hslvt,
                     '0' as hsl01,
                     '0' as hsl02,
                     '0' as hsl03,
                     '0' as hsl04,
                     '0' as hsl05,
                     '0' as hsl06,
                     '0' as hsl07,
                     '0' as hsl08,
                     '0' as hsl09,
                     '0' as hsl10,
                     '0' as hsl11,
                     '0' as hsl12,
                     '0' as hsl13,
                     '0' as hsl14,
                     '0' as hsl15,
                     '0' as hsl16

*                     from :et_zfidt00242_temp as a
                     from zfivt00092 as a
                     inner join :it_racct as b on a.saknr = b.racct
                     where a.rclnt = :im_mandt and
                           a.rldnr = :im_rldnr and
                           a.bukrs = :im_bukrs and
                           a.gjahr < :im_gjahr and

                           a.glaccount_type = 'X';

  ENDMETHOD.


  METHOD get_zfidt00242_c    BY DATABASE PROCEDURE FOR HDB
                             LANGUAGE SQLSCRIPT
                             OPTIONS READ-ONLY
                             USING zfivt00098.

    et_zfidt00242 = select
                    a.rclnt,

                    'ZFIDT00242' as tabname,
                    a.rldnr,
                    a.bukrs as rbukrs,
                    a.gjahr,
                    a.poper,

                    a.saknr as racct,
                    '' as racct_desc,
                    a.glaccount_type,
                    a.zzku,
                    a.zzcp,

                    a.rhcur,
                    a.rhcur_skb1,

                    a.hsl,

                     '0' as hslvt,
                     '0' as hsl01,
                     '0' as hsl02,
                     '0' as hsl03,
                     '0' as hsl04,
                     '0' as hsl05,
                     '0' as hsl06,
                     '0' as hsl07,
                     '0' as hsl08,
                     '0' as hsl09,
                     '0' as hsl10,
                     '0' as hsl11,
                     '0' as hsl12,
                     '0' as hsl13,
                     '0' as hsl14,
                     '0' as hsl15,
                     '0' as hsl16

                     from ZFIVT00098 as a
                     inner join :it_racct as b on a.saknr = b.racct
                     where a.rclnt = :im_mandt and
                           a.rldnr = :im_rldnr and
                           a.bukrs = :im_bukrs and
                           a.gjahr < :im_gjahr and

                           a.glaccount_type = 'X';

  ENDMETHOD.


  METHOD get_zfidt00269_b    BY DATABASE PROCEDURE FOR HDB
                             LANGUAGE SQLSCRIPT
                             OPTIONS READ-ONLY
                             USING zfivt00093.

*    et_ZFIDT00269_temp = APPLY_FILTER (ZFIVT00093, :im_where);
*
*    et_ZFIDT00269_temp = APPLY_FILTER (:et_ZFIDT00269_temp, :im_where1);
*    et_ZFIDT00269_temp = APPLY_FILTER (:et_ZFIDT00269_temp, :im_where2);
*    et_ZFIDT00269_temp = APPLY_FILTER (:et_ZFIDT00269_temp, :im_where3);
*    et_ZFIDT00269_temp = APPLY_FILTER (:et_ZFIDT00269_temp, :im_where4);
*    et_ZFIDT00269_temp = APPLY_FILTER (:et_ZFIDT00269_temp, :im_where5);

    et_ZFIDT00269 = select
                     a.rclnt,

                     'ZFIDT00269' as tabname,
                     a.rldnr,
                     a.bukrs as rbukrs,
                     a.gjahr,
                     a.poper,
                     '' as belnr,
                     a.buzei,

                     '' as bktxt,

                     a.fstag,
                     a.zopenitem,
                     a.txt50,
*                     a.rtcur,

                     a.rhcur,
                     a.rhcur_skb1,
                     a.saknr as racct,
                     '' as racct_desc,

                     a.glaccount_type,
                     a.ktopl,

                     a.hsl,
*                     a.tsl,

                     '' as budat,

                     '' as xopvw,
                     '' as mitkz,

                     '' as augdt,

                     a.zzku,
                     a.zzcp,
                     a.zzpr,
                     a.zzch,
                     a.zzpo,
                     a.zzcc,
                     a.zz07,
                     a.zz08,
                     a.zz09,
                     a.zz10,

                     a.kostl,
                     a.prctr,
                     a.erdat,
                     a.erzeit,
                     a.ernam,

                     '0' as hslvt,
                     '0' as hsl01,
                     '0' as hsl02,
                     '0' as hsl03,
                     '0' as hsl04,
                     '0' as hsl05,
                     '0' as hsl06,
                     '0' as hsl07,
                     '0' as hsl08,
                     '0' as hsl09,
                     '0' as hsl10,
                     '0' as hsl11,
                     '0' as hsl12,
                     '0' as hsl13,
                     '0' as hsl14,
                     '0' as hsl15,
                     '0' as hsl16
*                     from :et_zfidt00269_temp as a
                     from zfivt00093 as a
                     inner join :it_racct as b on a.saknr = b.racct
                     where a.rclnt = :im_mandt and
                           a.rldnr = :im_rldnr and
                           a.bukrs = :im_bukrs and
                           a.gjahr = :im_gjahr and
                           a.poper < :im_poper and

                           a.glaccount_type = 'X';

  ENDMETHOD.

  METHOD get_zfidt00269_c    BY DATABASE PROCEDURE FOR HDB
                             LANGUAGE SQLSCRIPT
                             OPTIONS READ-ONLY
                             USING zfivt00099.

    et_ZFIDT00269 = select

                    a.rclnt,

                    'ZFIDT00269' as tabname,
                    a.rldnr,
                    a.bukrs as rbukrs,
                    a.gjahr,
                    a.poper,

                    a.saknr as racct,
                    '' as racct_desc,
                    a.glaccount_type,
                    a.zzku,
                    a.zzcp,

                    a.rhcur,
                    a.rhcur_skb1,

                    a.hsl,

                     '0' as hslvt,
                     '0' as hsl01,
                     '0' as hsl02,
                     '0' as hsl03,
                     '0' as hsl04,
                     '0' as hsl05,
                     '0' as hsl06,
                     '0' as hsl07,
                     '0' as hsl08,
                     '0' as hsl09,
                     '0' as hsl10,
                     '0' as hsl11,
                     '0' as hsl12,
                     '0' as hsl13,
                     '0' as hsl14,
                     '0' as hsl15,
                     '0' as hsl16

                     from zfivt00099 as a
                     inner join :it_racct as b on a.saknr = b.racct
                     where a.rclnt = :im_mandt and
                           a.rldnr = :im_rldnr and
                           a.bukrs = :im_bukrs and
                           a.gjahr = :im_gjahr and
                           a.poper < :im_poper and

                           a.glaccount_type = 'X';

  ENDMETHOD.

  METHOD get_summary    BY DATABASE PROCEDURE FOR HDB
                           LANGUAGE SQLSCRIPT
                           OPTIONS READ-ONLY.

    et_data_detail_temp = APPLY_FILTER (:it_data_detail, :im_where);

    et_data_detail_temp = APPLY_FILTER (:et_data_detail_temp, :im_where1);
    et_data_detail_temp = APPLY_FILTER (:et_data_detail_temp, :im_where2);
    et_data_detail_temp = APPLY_FILTER (:et_data_detail_temp, :im_where3);
    et_data_detail_temp = APPLY_FILTER (:et_data_detail_temp, :im_where4);
    et_data_detail_temp = APPLY_FILTER (:et_data_detail_temp, :im_where5);

    et_data_detail = select * from :et_data_detail_temp as a
                     where a.rclnt = :im_mandt and
                           a.rldnr = :im_rldnr and
                           a.rbukrs = :im_bukrs;
*                           and
*                           a.gjahr = :im_gjahr;
*                            and
*                           a.poper = :im_poper;

  ENDMETHOD.

  METHOD get_summary_b    BY DATABASE PROCEDURE FOR HDB
                           LANGUAGE SQLSCRIPT
                           OPTIONS READ-ONLY.

    et_data_detail_temp = APPLY_FILTER (:it_data_detail, :im_where);

    et_data_detail_temp = APPLY_FILTER (:et_data_detail_temp, :im_where1);
    et_data_detail_temp = APPLY_FILTER (:et_data_detail_temp, :im_where2);
*    et_data_detail_temp = APPLY_FILTER (:et_data_detail_temp, :im_where3);
*    et_data_detail_temp = APPLY_FILTER (:et_data_detail_temp, :im_where4);
*    et_data_detail_temp = APPLY_FILTER (:et_data_detail_temp, :im_where5);

    et_data_detail = select * from :et_data_detail_temp as a
                     where a.rclnt = :im_mandt and
                           a.rldnr = :im_rldnr and
                           a.rbukrs = :im_bukrs;
*                           and
*                           a.gjahr = :im_gjahr;
*                            and
*                           a.poper = :im_poper;

  ENDMETHOD.

  METHOD get_acdoca_b    BY DATABASE PROCEDURE FOR HDB
                             LANGUAGE SQLSCRIPT
                             OPTIONS READ-ONLY
                             USING zfivt00091.

*    et_acdoca_temp = APPLY_FILTER (zfivt00091, :im_where);
*
*    et_acdoca_temp = APPLY_FILTER (:et_acdoca_temp, :im_where1);
*    et_acdoca_temp = APPLY_FILTER (:et_acdoca_temp, :im_where2);
*    et_acdoca_temp = APPLY_FILTER (:et_acdoca_temp, :im_where3);
*    et_acdoca_temp = APPLY_FILTER (:et_acdoca_temp, :im_where4);
*    et_acdoca_temp = APPLY_FILTER (:et_acdoca_temp, :im_where5);


*==========

    if :im_kind = 'ACDOCA BS' then

        et_acdoca = select
                    a.rclnt,

                    'ACDOCA BS' as tabname,
                    a.rldnr,
                    a.rbukrs,
                    a.gjahr,
                    a.poper,
                    a.belnr,
                    a.buzei,

                    a.bktxt,

                    '' as fstag,
                    '' as zopenitem,
                    '' as txt50,
*                   '' as rtcur,

                    a.rhcur,
                    a.rhcur_skb1,
                    a.racct,
                    '' as racct_desc,

                    a.glaccount_type,
                    a.ktopl,

                    a.hsl,
*                   '' as tsl,

                    a.budat,

                    a.xopvw,
                    a.mitkz,

                    a.augdt,

                    a.zzku,
                    a.zzcp,
                    a.zzpr,
                    a.zzch,
                    a.zzpo,
                    a.zzcc,
                    a.zz07,
                    a.zz08,
                    a.zz09,
                    a.zz10,

                    '' as kostl,
                    '' as prctr,
                    '' as erdat,
                    '' as erzeit,
                    '' as ernam,

                    '0' as hslvt,
                    '0' as hsl01,
                    '0' as hsl02,
                    '0' as hsl03,
                    '0' as hsl04,
                    '0' as hsl05,
                    '0' as hsl06,
                    '0' as hsl07,
                    '0' as hsl08,
                    '0' as hsl09,
                    '0' as hsl10,
                    '0' as hsl11,
                    '0' as hsl12,
                    '0' as hsl13,
                    '0' as hsl14,
                    '0' as hsl15,
                    '0' as hsl16

*                        from :et_acdoca_temp as a
                        from zfivt00091 as a
                        inner join :it_racct as b on a.racct = b.racct
                        where a.rclnt = :im_mandt and
                              a.rldnr = :im_rldnr and
                              a.rbukrs = :im_bukrs and
                              a.gjahr = :im_gjahr and

                              a.glaccount_type = 'X' and
                              a.poper <= :im_poper;

    elseif :im_kind = 'ACDOCA PL' then

       et_acdoca = select
                    a.rclnt,

                    'ACDOCA PL' as tabname,
                    a.rldnr,
                    a.rbukrs,
                    a.gjahr,
                    a.poper,
                    a.belnr,
                    a.buzei,

                    a.bktxt,

                    '' as fstag,
                    '' as zopenitem,
                    '' as txt50,
*                   '' as rtcur,

                    a.rhcur,
                    a.rhcur_skb1,
                    a.racct,
                    '' as racct_desc,

                    a.glaccount_type,
                    a.ktopl,

                    a.hsl,
*                   '' as tsl,

                    a.budat,

                    a.xopvw,
                    a.mitkz,

                    a.augdt,

                    a.zzku,
                    a.zzcp,
                    a.zzpr,
                    a.zzch,
                    a.zzpo,
                    a.zzcc,
                    a.zz07,
                    a.zz08,
                    a.zz09,
                    a.zz10,

                    '' as kostl,
                    '' as prctr,
                    '' as erdat,
                    '' as erzeit,
                    '' as ernam,

                    '0' as hslvt,
                    '0' as hsl01,
                    '0' as hsl02,
                    '0' as hsl03,
                    '0' as hsl04,
                    '0' as hsl05,
                    '0' as hsl06,
                    '0' as hsl07,
                    '0' as hsl08,
                    '0' as hsl09,
                    '0' as hsl10,
                    '0' as hsl11,
                    '0' as hsl12,
                    '0' as hsl13,
                    '0' as hsl14,
                    '0' as hsl15,
                    '0' as hsl16

*                        from :et_acdoca_temp as a
                        from zfivt00091 as a
                        inner join :it_racct as b on a.racct = b.racct
                        where a.rclnt = :im_mandt and
                              a.rldnr = :im_rldnr and
                              a.rbukrs = :im_bukrs and
                              a.gjahr = :im_gjahr and

                              a.glaccount_type = 'P' and
                              a.poper <= :im_poper;
    END if;

  ENDMETHOD.

  METHOD get_acdoca_c    BY DATABASE PROCEDURE FOR HDB
                             LANGUAGE SQLSCRIPT
                             OPTIONS READ-ONLY
                             USING zfivt00097.

    if :im_kind = 'ACDOCA BS' then

        et_acdoca = select
                    a.rclnt,

                    'ACDOCA BS' as tabname,
                    a.rldnr,
                    a.rbukrs,
                    a.gjahr,
                    a.poper,

                    a.racct,
                    '' as racct_desc,
                    a.glaccount_type,
                    a.zzku,
                    a.zzcp,

                    a.rhcur,
                    a.rhcur_skb1,

                    a.hsl,

                     '0' as hslvt,
                     '0' as hsl01,
                     '0' as hsl02,
                     '0' as hsl03,
                     '0' as hsl04,
                     '0' as hsl05,
                     '0' as hsl06,
                     '0' as hsl07,
                     '0' as hsl08,
                     '0' as hsl09,
                     '0' as hsl10,
                     '0' as hsl11,
                     '0' as hsl12,
                     '0' as hsl13,
                     '0' as hsl14,
                     '0' as hsl15,
                     '0' as hsl16

                        from zfivt00097 as a
                        inner join :it_racct as b on a.racct = b.racct
                        where a.rclnt = :im_mandt and
                              a.rldnr = :im_rldnr and
                              a.rbukrs = :im_bukrs and
                              a.gjahr = :im_gjahr and

                              a.glaccount_type = 'X' and
                              a.poper <= :im_poper;

    elseif :im_kind = 'ACDOCA PL' then

       et_acdoca = select
                    a.rclnt,
                    'ACDOCA PL' as tabname,
                    a.rldnr,
                    a.rbukrs,
                    a.gjahr,
                    a.poper,

                    a.racct,
                    '' as racct_desc,
                    a.glaccount_type,
                    a.zzku,
                    a.zzcp,

                    a.rhcur,
                    a.rhcur_skb1,
                    a.hsl,

                     '0' as hslvt,
                     '0' as hsl01,
                     '0' as hsl02,
                     '0' as hsl03,
                     '0' as hsl04,
                     '0' as hsl05,
                     '0' as hsl06,
                     '0' as hsl07,
                     '0' as hsl08,
                     '0' as hsl09,
                     '0' as hsl10,
                     '0' as hsl11,
                     '0' as hsl12,
                     '0' as hsl13,
                     '0' as hsl14,
                     '0' as hsl15,
                     '0' as hsl16

                        from zfivt00097 as a
                        inner join :it_racct as b on a.racct = b.racct
                        where a.rclnt = :im_mandt and
                              a.rldnr = :im_rldnr and
                              a.rbukrs = :im_bukrs and
                              a.gjahr = :im_gjahr and

                              a.glaccount_type = 'P' and
                              a.poper <= :im_poper;
    END if;

  ENDMETHOD.

  METHOD get_faglflext_b   BY DATABASE PROCEDURE FOR HDB
                           LANGUAGE SQLSCRIPT
                           OPTIONS READ-ONLY
                           USING zfivt00094.

*    et_faglflext_temp = APPLY_FILTER (ZFIVT00094, :im_where);
*
*    et_faglflext_temp = APPLY_FILTER (:et_faglflext_temp, :im_where1);
*    et_faglflext_temp = APPLY_FILTER (:et_faglflext_temp, :im_where2);
*    et_faglflext_temp = APPLY_FILTER (:et_faglflext_temp, :im_where3);
*    et_faglflext_temp = APPLY_FILTER (:et_faglflext_temp, :im_where4);
*    et_faglflext_temp = APPLY_FILTER (:et_faglflext_temp, :im_where5);

    if :im_kind = 'FAGLFLEXT BS' then

        et_faglflext = select
                     a.rclnt,

                     'FAGLFLEXT BS' as tabname,
                     a.rldnr,
                     a.rbukrs,
                     a.gjahr,
                     a.poper,
                     a.belnr,
                     a.buzei,

                     a.bktxt,

                     '' as fstag,
                     '' as zopenitem,
                     '' as txt50,
*                     '' as rtcur,

                     a.rhcur,
                     a.rhcur_skb1,
                     a.racct,
                     a.racct_desc,

                     a.glaccount_type,
                     a.ktopl,

*                     a.hsl,

                    CASE :im_poper
                     WHEN '001'
                        then a.hsl01 + a.hslvt
                     when '002'
                        then a.hsl01 + a.hsl02 + a.hslvt
                     when '003'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hslvt
                     when '004'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hslvt
                     when '005'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hslvt
                     when '006'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 + a.hslvt
                     when '007'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hslvt
                     when '008'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hslvt
                     when '009'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hslvt
                     when '010'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10 + a.hslvt
                     when '011'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10 + a.hsl11 + a.hslvt
                     when '012'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10 + a.hsl11 + a.hsl12 + a.hslvt
                     when '013'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10 + a.hsl11 + a.hsl12 +
                             a.hsl13 + a.hslvt
                     when '014'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10 + a.hsl11 + a.hsl12 +
                             a.hsl13 + a.hsl14 + a.hslvt
                     when '015'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10 + a.hsl11 + a.hsl12 +
                             a.hsl13 + a.hsl14 + a.hsl15 + a.hslvt
                     when '016'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10 + a.hsl11 + a.hsl12 +
                             a.hsl13 + a.hsl14 + a.hsl15 + a.hsl16 + a.hslvt
                     end as hsl,

                     a.budat,

                     a.xopvw,
                     a.mitkz,

                     a.augdt,

                     a.zzku,
                     a.zzcp,
                     a.zzpr,
                     a.zzch,
                     a.zzpo,
                     a.zzcc,
                     a.zz07,
                     a.zz08,
                     a.zz09,
                     a.zz10,

                     '' as kostl,
                     '' as prctr,
                     '' as erdat,
                     '' as erzeit,
                     '' as ernam,

                     a.hslvt,
                     a.hsl01,
                     a.hsl02,
                     a.hsl03,
                     a.hsl04,
                     a.hsl05,
                     a.hsl06,
                     a.hsl07,
                     a.hsl08,
                     a.hsl09,
                     a.hsl10,
                     a.hsl11,
                     a.hsl12,
                     a.hsl13,
                     a.hsl14,
                     a.hsl15,
                     a.hsl16

*                         from :et_faglflext_temp as a
                         from zfivt00094 as a
                         left join :it_racct as b on a.racct = b.racct
                         where a.rclnt = :im_mandt and
                               a.rldnr = :im_rldnr and
                               a.rbukrs = :im_bukrs and
                               a.gjahr = :im_gjahr and

                               a.glaccount_type = 'X' and

                               b.racct is null;

    elseif :im_kind = 'FAGLFLEXT PL' then

        et_faglflext = select
                     a.rclnt,

                     'FAGLFLEXT PL' as tabname,
                     a.rldnr,
                     a.rbukrs,
                     a.gjahr,
                     a.poper,
                     a.belnr,
                     a.buzei,

                     a.bktxt,

                     '' as fstag,
                     '' as zopenitem,
                     '' as txt50,
*                     '' as rtcur,

                     a.rhcur,
                     a.rhcur_skb1,
                     a.racct,
                     a.racct_desc,

                     a.glaccount_type,
                     a.ktopl,

*                     a.hsl,

                    CASE :im_poper
                     WHEN '001'
                        then a.hsl01
                     when '002'
                        then a.hsl01 + a.hsl02
                     when '003'
                        then a.hsl01 + a.hsl02 + a.hsl03
                     when '004'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04
                     when '005'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05
                     when '006'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06
                     when '007'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07
                     when '008'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08
                     when '009'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09
                     when '010'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10
                     when '011'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10 + a.hsl11
                     when '012'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10 + a.hsl11 + a.hsl12
                     when '013'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10 + a.hsl11 + a.hsl12 +
                             a.hsl13
                     when '014'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10 + a.hsl11 + a.hsl12 +
                             a.hsl13 + a.hsl14
                     when '015'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10 + a.hsl11 + a.hsl12 +
                             a.hsl13 + a.hsl14 + a.hsl15
                     when '016'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10 + a.hsl11 + a.hsl12 +
                             a.hsl13 + a.hsl14 + a.hsl15 + a.hsl16
                     end as hsl,

                     a.budat,

                     a.xopvw,
                     a.mitkz,

                     a.augdt,

                     a.zzku,
                     a.zzcp,
                     a.zzpr,
                     a.zzch,
                     a.zzpo,
                     a.zzcc,
                     a.zz07,
                     a.zz08,
                     a.zz09,
                     a.zz10,

                     '' as kostl,
                     '' as prctr,
                     '' as erdat,
                     '' as erzeit,
                     '' as ernam,

                     a.hslvt,
                     a.hsl01,
                     a.hsl02,
                     a.hsl03,
                     a.hsl04,
                     a.hsl05,
                     a.hsl06,
                     a.hsl07,
                     a.hsl08,
                     a.hsl09,
                     a.hsl10,
                     a.hsl11,
                     a.hsl12,
                     a.hsl13,
                     a.hsl14,
                     a.hsl15,
                     a.hsl16
*                         from :et_faglflext_temp as a
                         from zfivt00094 as a
                         left join :it_racct as b on a.racct = b.racct
                         where a.rclnt = :im_mandt and
                               a.rldnr = :im_rldnr and
                               a.rbukrs = :im_bukrs and
                               a.gjahr = :im_gjahr and

                               a.glaccount_type = 'P' and

                               b.racct is null;

    END if;

  ENDMETHOD.

  METHOD get_faglflext_c    BY DATABASE PROCEDURE FOR HDB
                           LANGUAGE SQLSCRIPT
                           OPTIONS READ-ONLY
                           USING zfivt00094.

    if :im_kind = 'FAGLFLEXT BS' then

        et_faglflext = select
                     a.rclnt,

                     'FAGLFLEXT BS' as tabname,
                     a.rldnr,
                     a.rbukrs,
                     a.gjahr,
                     a.poper,

                     a.racct,
                     a.racct_desc,
                     a.glaccount_type,
                     a.zzku,
                     a.zzcp,

                     a.rhcur,
                     a.rhcur_skb1,

                    CASE :im_poper
                     WHEN '001'
                        then a.hsl01 + a.hslvt
                     when '002'
                        then a.hsl01 + a.hsl02 + a.hslvt
                     when '003'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hslvt
                     when '004'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hslvt
                     when '005'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hslvt
                     when '006'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 + a.hslvt
                     when '007'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hslvt
                     when '008'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hslvt
                     when '009'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hslvt
                     when '010'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10 + a.hslvt
                     when '011'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10 + a.hsl11 + a.hslvt
                     when '012'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10 + a.hsl11 + a.hsl12 + a.hslvt
                     when '013'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10 + a.hsl11 + a.hsl12 +
                             a.hsl13 + a.hslvt
                     when '014'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10 + a.hsl11 + a.hsl12 +
                             a.hsl13 + a.hsl14 + a.hslvt
                     when '015'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10 + a.hsl11 + a.hsl12 +
                             a.hsl13 + a.hsl14 + a.hsl15 + a.hslvt
                     when '016'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10 + a.hsl11 + a.hsl12 +
                             a.hsl13 + a.hsl14 + a.hsl15 + a.hsl16 + a.hslvt
                     end as hsl,

                     a.hslvt,
                     a.hsl01,
                     a.hsl02,
                     a.hsl03,
                     a.hsl04,
                     a.hsl05,
                     a.hsl06,
                     a.hsl07,
                     a.hsl08,
                     a.hsl09,
                     a.hsl10,
                     a.hsl11,
                     a.hsl12,
                     a.hsl13,
                     a.hsl14,
                     a.hsl15,
                     a.hsl16

                         from zfivt00094 as a
                         left join :it_racct as b on a.racct = b.racct
                         where a.rclnt = :im_mandt and
                               a.rldnr = :im_rldnr and
                               a.rbukrs = :im_bukrs and
                               a.gjahr = :im_gjahr and

                               a.glaccount_type = 'X' and

                               b.racct is null;

    elseif :im_kind = 'FAGLFLEXT PL' then

        et_faglflext = select
                     a.rclnt,

                     'FAGLFLEXT PL' as tabname,
                     a.rldnr,
                     a.rbukrs,
                     a.gjahr,
                     a.poper,

                     a.racct,
                     a.racct_desc,
                     a.glaccount_type,
                     a.zzku,
                     a.zzcp,

                     a.rhcur,
                     a.rhcur_skb1,

                    CASE :im_poper
                     WHEN '001'
                        then a.hsl01
                     when '002'
                        then a.hsl01 + a.hsl02
                     when '003'
                        then a.hsl01 + a.hsl02 + a.hsl03
                     when '004'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04
                     when '005'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05
                     when '006'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06
                     when '007'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07
                     when '008'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08
                     when '009'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09
                     when '010'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10
                     when '011'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10 + a.hsl11
                     when '012'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10 + a.hsl11 + a.hsl12
                     when '013'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10 + a.hsl11 + a.hsl12 +
                             a.hsl13
                     when '014'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10 + a.hsl11 + a.hsl12 +
                             a.hsl13 + a.hsl14
                     when '015'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10 + a.hsl11 + a.hsl12 +
                             a.hsl13 + a.hsl14 + a.hsl15
                     when '016'
                        then a.hsl01 + a.hsl02 + a.hsl03 + a.hsl04 + a.hsl05 + a.hsl06 +
                             a.hsl07 + a.hsl08 + a.hsl09 + a.hsl10 + a.hsl11 + a.hsl12 +
                             a.hsl13 + a.hsl14 + a.hsl15 + a.hsl16
                     end as hsl,

                     a.hslvt,
                     a.hsl01,
                     a.hsl02,
                     a.hsl03,
                     a.hsl04,
                     a.hsl05,
                     a.hsl06,
                     a.hsl07,
                     a.hsl08,
                     a.hsl09,
                     a.hsl10,
                     a.hsl11,
                     a.hsl12,
                     a.hsl13,
                     a.hsl14,
                     a.hsl15,
                     a.hsl16

                         from zfivt00094 as a
                         left join :it_racct as b on a.racct = b.racct
                         where a.rclnt = :im_mandt and
                               a.rldnr = :im_rldnr and
                               a.rbukrs = :im_bukrs and
                               a.gjahr = :im_gjahr and

                               a.glaccount_type = 'P' and

                               b.racct is null;

    END if;

  ENDMETHOD.

ENDCLASS.
