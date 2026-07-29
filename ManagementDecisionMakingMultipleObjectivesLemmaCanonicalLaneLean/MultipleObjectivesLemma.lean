import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean

structure MultipleObjectivesLemmaPackage where
  alternatives : Type u
  objectives : Type v
  criteriaWeights : Alternatives → Objectives → ℝ
  objectiveFunctions : List (Objectives → ℝ)
  paretoOptimalityCondition : Prop
  weightedSumCondition : Prop
  tradeoffResolution : Prop
  decisionRule : Prop

structure MultipleObjectivesLemmaEvidence (M : MultipleObjectivesLemmaPackage) where
  paretoOptimalityConditionClosed : M.paretoOptimalityCondition
  weightedSumConditionClosed : M.weightedSumCondition
  tradeoffResolutionClosed : M.tradeoffResolution
  decisionRuleClosed : M.decisionRule

def MultipleObjectivesLemmaClosed (M : MultipleObjectivesLemmaPackage) : Prop :=
  M.paretoOptimalityCondition ∧ M.weightedSumCondition ∧ M.tradeoffResolution ∧ M.decisionRule

theorem multiple_objectives_lemma_closed_from_evidence (M : MultipleObjectivesLemmaPackage)
    (E : MultipleObjectivesLemmaEvidence M) : MultipleObjectivesLemmaClosed M := by
  exact And.intro E.paretoOptimalityConditionClosed
    (And.intro E.weightedSumConditionClosed (And.intro E.tradeoffResolutionClosed E.decisionRuleClosed))

end HautevilleHouse
end ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean