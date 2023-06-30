@AbapCatalog.sqlViewName: 'ZFIVT00099'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@ObjectModel.usageType.serviceQuality: #B
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.sizeCategory: #XXL
@EndUserText.label: 'ZFIDT00269 for Prg. ZFI02R0033 - Summary of ZFICD_ZFIDT00269'
define view ZFICD_ZFIDT00269_B
  as select from zfivt00093 as a
{

  key a.rclnt,
  key a.rldnr,
  key a.bukrs,
  key a.gjahr,
  key a.poper,

      a.saknr,
      a.txt50,
      a.glaccount_type,
      a.zzku,
      a.zzcp,

      a.rhcur,
      a.rhcur_skb1,
      
      @Semantics: { amount : {currencyCode: 'rhcur'} }
      sum(a.hsl) as hsl
}
group by
  a.rclnt,
  a.rldnr,
  a.bukrs,
  a.gjahr,
  a.poper,

  a.saknr,
  a.txt50,
  a.glaccount_type,
  a.zzku,
  a.zzcp,

  a.rhcur,
  a.rhcur_skb1
