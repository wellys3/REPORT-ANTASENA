@AbapCatalog.sqlViewName: 'ZFIVT00097'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@ObjectModel.usageType.serviceQuality: #B
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.sizeCategory: #XXL
@EndUserText.label: 'ACDOCA for Program ZFI02R0033 - Summary of ZFICD_ACDOCA_2'
define view ZFICD_ACDOCA_2_B
  as select from zfivt00091 as a
{

  key a.rclnt,
  key a.rldnr,
  key a.rbukrs,
  key a.gjahr,
  key a.poper,

      a.racct,
      a.glaccount_type,
      a.zzku,
      a.zzcp,

      a.rhcur,
      a.rhcur_skb1,
      
      @Semantics: { amount : {currencyCode: 'rhcur'} }
      //a.hsl,
      sum(a.hsl) as hsl
}
group by
  a.rclnt,
  a.rldnr,
  a.rbukrs,
  a.gjahr,
  a.poper,

  a.racct,
  a.glaccount_type,
  a.zzku,
  a.zzcp,

  a.rhcur,
  a.rhcur_skb1
