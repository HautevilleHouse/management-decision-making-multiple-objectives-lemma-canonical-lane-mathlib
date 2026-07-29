import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean

structure LinguisticZNumber where
  restriction : Prop
  reliability : ℝ
  term : String

structure LinguisticZNumbersPackage where
  alternativeJudgments : ∀ (a : ObjectivesSpace.alternatives), List LinguisticZNumber
  aggregationOperator : List LinguisticZNumber → ℝ
  defuzzification : ℝ → ℝ
  aggregatedScores : ∀ (a : ObjectivesSpace.alternatives), ℝ
  ranking : List (ObjectivesSpace.alternatives × ℝ)

structure LinguisticZNumbersEvidence (L : LinguisticZNumbersPackage) where
  aggregationOperatorDefined : ∀ (js : List LinguisticZNumber), L.aggregationOperator js = (∑ z ∈ js, z.reliability) / (js.length + 1)
  defuzzificationDefinition : ∀ (x : ℝ), L.defuzzification x = x / (x + 1)
  aggregatedScoresDefined : ∀ (a : ObjectivesSpace.alternatives), L.aggregatedScores a = L.defuzzification (L.aggregationOperator (L.alternativeJudgments a))
  rankingSorted : ∀ (a b : ObjectivesSpace.alternatives), (L.ranking.filter (λ p => p.1 = a)).length = 1 ∧ (∀ (p q : ObjectivesSpace.alternatives × ℝ), p ∈ L.ranking → q ∈ L.ranking → p.2 ≥ q.2)

def LinguisticZNumbersClosed (L : LinguisticZNumbersPackage) : Prop :=
  (∀ (js : List LinguisticZNumber), L.aggregationOperator js = (∑ z ∈ js, z.reliability) / (js.length + 1)) ∧
  (∀ (x : ℝ), L.defuzzification x = x / (x + 1)) ∧
  (∀ (a : ObjectivesSpace.alternatives), L.aggregatedScores a = L.defuzzification (L.aggregationOperator (L.alternativeJudgments a))) ∧
  (∀ (a b : ObjectivesSpace.alternatives), (L.ranking.filter (λ p => p.1 = a)).length = 1 ∧ (∀ (p q : ObjectivesSpace.alternatives × ℝ), p ∈ L.ranking → q ∈ L.ranking → p.2 ≥ q.2))

theorem linguistic_z_numbers_closed_from_evidence (L : LinguisticZNumbersPackage) (E : LinguisticZNumbersEvidence L) :
    LinguisticZNumbersClosed L := by
  refine And.intro E.aggregationOperatorDefined (And.intro E.defuzzificationDefinition (And.intro E.aggregatedScoresDefined E.rankingSorted))

end HautevilleHouse
end ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean