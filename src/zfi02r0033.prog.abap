*&---------------------------------------------------------------------*
*& Report ZFI02R0033
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*


*&---------------------------------------------------------------------*
*& Description : Report Antasena
*&
*& Module      : Financial Accounting
*& Functional  : - Yeremia Khristian Suherman (yeremia.suherman@equine.co.id)
*& FSD Loc.    : - SO2_MIME_REPOSITORY --> SAP --> PUBLIC --> ZFSD
*& FSD         : - 0018. SIGNED-ADMF-EQG.P2207.0047_FSD_FI-CR7-Report Antasena_v1.4_30082022.pdf
*& Developer   : Welly Sugiarto (welly.sugiarto@equine.co.id)
*& Date        : October 7th, 2022
*& Copyright   : © 2022 PT Equine Global
*&               © 2022 PT Adira Dinamika Multi Finance
*&
*& Transport Request History (Any changes of TR will be updated here future):
*& *  A4DK908164 SAPABAP EG-AB-FI CR7 - Report Antasena WSU YKS #1
*&    Changelog: * Initial Release
*& *  A4DK908464 SAPABAP EG-AB-FI CR7 - Report Antasena WSU YKS #2
*&    Changelog: * Tuning
*& *  A4DK908478 SAPABAP EG-AB-FI CR7 - Report Antasena WSU YKS #3
*&    Changelog: * Tuning
*& *  A4DK908509 SAPABAP EG-AB-FI CR7 - Report Antasena WSU YKS #4
*&    Changelog: * Add Currency Dummy
*& *  A4DK908716 SAPABAP EG-AB-FI CR7 - Report Antasena WSU YKS #5
*&    Changelog: #1 Add header title in .TXT file
*&               #2 Pada .TXT di save di local pc, field CDE_CURR (lwa_data_sum_final-currency_valas)
*&                  jika amount 0, ada yg kosong
*&                  seharusnya ambil lwa_data_sum_final-currency_dummy
*&---------------------------------------------------------------------*


REPORT zfi02r0033.


*----------------------------------------------------------------------*
* Includes                                                             *
*----------------------------------------------------------------------*
INCLUDE zfi02r0033_top. "Types, Data, Constant Declaration & Selection-Screen.
INCLUDE zfi02r0033_f00. "Other Function for whole this program
INCLUDE zfi02r0033_f01. "Get Data
INCLUDE zfi02r0033_f02. "Display Data
*----------------------------------------------------------------------*
* End - Includes                                                       *
*----------------------------------------------------------------------*


*----------------------------------------------------------------------*
* Initialization                                                       *
*----------------------------------------------------------------------*
INITIALIZATION.
  PERFORM f_initialization.
*----------------------------------------------------------------------*
* End - Initialization                                                 *
*----------------------------------------------------------------------*


*----------------------------------------------------------------------*
* Start-of-Selection                                                   *
*----------------------------------------------------------------------*
START-OF-SELECTION.

  CLEAR gd_subrc.
  PERFORM f_pre_execute CHANGING gd_subrc.

  CHECK gd_subrc EQ 0.
  PERFORM f_execute.

END-OF-SELECTION.
*----------------------------------------------------------------------*
* End - Start-of-Selection                                             *
*----------------------------------------------------------------------*


*----------------------------------------------------------------------*
* At-Selection-Screen                                                  *
*----------------------------------------------------------------------*
AT SELECTION-SCREEN.
*  PERFORM f_download_template.
  PERFORM f_mandatory_validation.
*
AT SELECTION-SCREEN OUTPUT.
  PERFORM f_modify_screen.
*
*AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_file.
*  PERFORM f_get_file_dir CHANGING p_file.
*----------------------------------------------------------------------*
* End - At-Selection-Screen                                            *
*----------------------------------------------------------------------*
