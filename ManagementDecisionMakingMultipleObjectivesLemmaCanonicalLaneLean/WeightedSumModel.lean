import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean

structure WeightedSumModelPackage (S : ObjectivesSpace) where
  weightVector : S.criteria → ℝ
  weightedScores : S.alternatives → ℝ
  optimalAlternative : Option S.alternatives
  weightNormalization : ∑ c : S.criteria, weightVector c = 1

def weightedScore (S : ObjectivesSpace) (w : S.criteria → ℝ) (a : S.alternatives) : ℝ :=
  ∑ c : S.criteria, w c * S.evaluationMatrix a c

structure WeightedSumModelEvidence (S : ObjectivesSpace) (W : WeightedSumModelPackage S) where
  weightedScoresDefined : ∀ (a : S.alternatives), W.weightedScores a = weightedScore S W.weightVector a
  optimalityCondition : (W.optimalAlternative).casesOn (by
    intro hNone; exact True)
    (fun aOpt => (W.weightedScores aOpt = max' (Finset.image W.weightedScores (Finset.filter S.feasibilityDomain (Finset.univ : Finset S.alternatives))).toFinset) ∧ S.feasibilityDomain aOpt)
  weightNormalizationClosed : W.weightNormalization

def WeightedSumModelClosed (S : ObjectivesSpace) (W : WeightedSumModelPackage S) : Prop :=
  (∀ (a : S.alternatives), W.weightedScores a = weightedScore S W.weightVector a) ∧
  (W.optimalAlternative).casesOn (by
    intro hNone; exact True)
    (fun aOpt => (W.weightedScores aOpt = max' (Finset.image W.weightedScores (Finset.filter S.feasibilityDomain (Finset.univ : Finset S.alternatives))).toFinset) ∧ S.feasibilityDomain aOpt) ∧
  W.weightNormalization

theorem weighted_sum_model_closed_from_evidence (S : ObjectivesSpace) (W : WeightedSumModelPackage S) (E : WeightedSumModelEvidence S W) :
    WeightedSumModelClosed S W := by
  exact And.intro E.weightedScoresDefined (And.intro E.optimalityCondition E.weightNormalizationClosed)

end HautevilleHouse
end ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean