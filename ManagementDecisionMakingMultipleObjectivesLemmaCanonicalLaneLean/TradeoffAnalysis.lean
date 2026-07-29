import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean

structure TradeoffAnalysis where
  marginalRates : Prop
  indifferenceCurves : Prop
  substitutionPossibilities : Prop
  conflictResolution : Prop

def tradeoffClosed (T : TradeoffAnalysis) : Prop :=
  T.marginalRates ∧ T.indifferenceCurves ∧ T.substitutionPossibilities ∧ T.conflictResolution

end ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean
end HautevilleHouse