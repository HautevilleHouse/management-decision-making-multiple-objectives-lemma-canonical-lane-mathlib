import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean

structure ObjectivesSpace where
  alternatives : Type u
  criteria : Type v
  evaluationMatrix : alternatives → criteria → ℝ
  weights : criteria → ℝ
  objectiveFunctions : List (alternatives → ℝ)
  feasibilityDomain : alternatives → Prop

structure ObjectivesSpaceEvidence (S : ObjectivesSpace) where
  evaluationMatrixDefined : S.evaluationMatrix = S.evaluationMatrix
  weightsPositive : ∀ (c : S.criteria), S.weights c > 0
  weightsSumOne : (∑ c : S.criteria, S.weights c) = 1
  objectiveFunctionsDefined : S.objectiveFunctions.length > 0
  feasibilityDomainNonEmpty : ∃ (a : S.alternatives), S.feasibilityDomain a

def ObjectivesSpaceClosed (S : ObjectivesSpace) : Prop :=
  ∀ (c : S.criteria), S.weights c > 0 ∧ (∑ c' : S.criteria, S.weights c') = 1 ∧
  (S.objectiveFunctions.length > 0) ∧ (∃ (a : S.alternatives), S.feasibilityDomain a)

theorem objectives_space_closed_from_evidence (S : ObjectivesSpace) (E : ObjectivesSpaceEvidence S) :
    ObjectivesSpaceClosed S := by
  refine λ c => And.intro (E.weightsPositive c) ?_
  refine And.intro E.weightsSumOne (And.intro E.objectiveFunctionsDefined E.feasibilityDomainNonEmpty)

end HautevilleHouse
end ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean