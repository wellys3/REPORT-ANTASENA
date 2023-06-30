*&---------------------------------------------------------------------*
*& Report ZFI02R0033_HOME
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*


*&---------------------------------------------------------------------*
*& Description : Report Antasena - Home
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
*& *  Changelog: * Initial Release
*&---------------------------------------------------------------------*


REPORT zfi02r0033_home.


*----------------------------------------------------------------------*
* Includes                                                             *
*----------------------------------------------------------------------*
INCLUDE zfi02r0033_home_top. "Types, Data, Constant Declaration & Selection-Screen.
INCLUDE zfi02r0033_home_f00. "Other Function for whole this program
INCLUDE zfi02r0033_home_f01. "Get Data
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
  PERFORM f_check_auth CHANGING gd_subrc.

  CHECK gd_subrc EQ 0.

  PERFORM f_execute.

END-OF-SELECTION.
*----------------------------------------------------------------------*
* End - Start-of-Selection                                             *
