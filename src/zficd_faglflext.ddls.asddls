@AbapCatalog.sqlViewName: 'ZFIVT00094'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@ObjectModel.usageType.serviceQuality: #B
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.sizeCategory: #XXL
@EndUserText.label: 'FAGLFLEXT for Program ZFI02R0033'
define view ZFICD_FAGLFLEXT
  as select from    faglflext as a
//    left outer join bkpf   as b on  a.rbukrs = b.bukrs
//                                and a.belnr  = b.belnr
//                                and a.gjahr  = b.gjahr
//    left outer join skb1   as c on  a.rbukrs = c.bukrs
//                                and a.racct  = c.saknr
    left outer join ska1   as b on  a.rbukrs = b.ktopl
                                and a.racct  = b.saknr
                                
    left outer join skat   as c on  c.spras = 'i'
                                and a.rbukrs = c.ktopl
                                and a.racct  = c.saknr
    left outer join skb1   as d on  a.rbukrs = d.bukrs
                                and a.racct  = d.saknr
{

  key a.rclnt,
  key a.rldnr,
  key a.rbukrs,
  key a.ryear as gjahr,
  key '' as belnr,
//  key '' as docln,
      
      cast ( lpad ( '', 10, '0'
                  ) as abap.numc(10)
           ) as buzei,
      
      '' as bktxt,
      
      cast ('IDR' as abap.cuky) as rhcur,
      d.waers as rhcur_skb1,
      
      a.racct,
      c.txt50 as racct_desc,
      
      b.glaccount_type, //'' as glaccount_type,
      '' as ktopl,
      
      @Semantics: { amount : {currencyCode: 'rhcur'} }
      cast ('0' as abap.curr( 23, 2 )) as hsl,

      '' as poper,
      '' as budat,
      '' as xopvw,

      '' as mitkz,
    
      '' as augdt,

      '' as zzku,
      '' as zzcp,
      '' as zzpr,
      '' as zzch,
      '' as zzpo,
      '' as zzcc,
      '' as zz07,
      '' as zz08,
      '' as zz09,
      '' as zz10,
      
      @Semantics: { amount : {currencyCode: 'rhcur'} }
      a.hslvt,
      
      @Semantics: { amount : {currencyCode: 'rhcur'} }
      a.hsl01,
      
      @Semantics: { amount : {currencyCode: 'rhcur'} }
      a.hsl02,
      
      @Semantics: { amount : {currencyCode: 'rhcur'} }
      a.hsl03,
      
      @Semantics: { amount : {currencyCode: 'rhcur'} }
      a.hsl04,
      
      @Semantics: { amount : {currencyCode: 'rhcur'} }
      a.hsl05,
      
      @Semantics: { amount : {currencyCode: 'rhcur'} }
      a.hsl06,
      
      @Semantics: { amount : {currencyCode: 'rhcur'} }
      a.hsl07,
      
      @Semantics: { amount : {currencyCode: 'rhcur'} }
      a.hsl08,
      
      @Semantics: { amount : {currencyCode: 'rhcur'} }
      a.hsl09,
      
      @Semantics: { amount : {currencyCode: 'rhcur'} }
      a.hsl10,
      
      @Semantics: { amount : {currencyCode: 'rhcur'} }
      a.hsl11,
      
      @Semantics: { amount : {currencyCode: 'rhcur'} }
      a.hsl12,
      
      @Semantics: { amount : {currencyCode: 'rhcur'} }
      a.hsl13,
      
      @Semantics: { amount : {currencyCode: 'rhcur'} }
      a.hsl14,
      
      @Semantics: { amount : {currencyCode: 'rhcur'} }
      a.hsl15,
      
      @Semantics: { amount : {currencyCode: 'rhcur'} }
      a.hsl16
}
