import ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean.MultipleObjectivesPackage

namespace HautevilleHouse
namespace ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean

structure MOORWeightingPackage {M : MultipleObjectivesPackage} where
  referenceAlternatives : List M.alternatives
  pairwiseComparisons : M.alternatives -> M.alternatives -> ℝ
  consistencyRatio : ℝ
  derivedWeights : M.objectives -> ℝ
  referenceSelected : Prop
  pairwiseConsistent : Prop
  consistencyRatioAcceptable : Prop
  derivedWeightsPositive : Prop

structure MOORWeightingEvidence {M : MultipleObjectivesPackage}
    (W : MOORWeightingPackage M) where
  referenceSelectedClosed : W.referenceSelected
  pairwiseConsistentClosed : W.pairwiseConsistent
  consistencyRatioAcceptableClosed : W.consistencyRatioAcceptable
  derivedWeightsPositiveClosed : W.derivedWeightsPositive

def MOORWeightingClosed {M : MultipleObjectivesPackage}
    (W : MOORWeightingPackage M) : Prop :=
  W.referenceSelected ∧ W.pairwiseConsistent ∧
  W.consistencyRatioAcceptable ∧ W.derivedWeightsPositive

theorem moor_weighting_closed_from_evidence
    {M : MultipleObjectivesPackage} (W : MOORWeightingPackage M)
    (E : MOORWeightingEvidence W) : MOORWeightingClosed W := by
  exact And.intro E.referenceSelectedClosed
    (And.intro E.pairwiseConsistentClosed
      (And.intro E.consistencyRatioAcceptableClosed E.derivedWeightsPositiveClosed))

end ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean
end HautevilleHouse