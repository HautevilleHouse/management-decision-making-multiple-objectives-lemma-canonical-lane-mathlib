import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean

structure WeightedSumObjectives where
  weights : Vector ℝ objectiveCount
  weightedFunctions : alternativeSet -> ℝ
  scalarizationValid : Prop
  tradeoffAnalysis : Prop

def weightedSumClosed (W : WeightedSumObjectives) : Prop :=
  W.scalarizationValid ∧ W.tradeoffAnalysis

end ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean
end HautevilleHouse