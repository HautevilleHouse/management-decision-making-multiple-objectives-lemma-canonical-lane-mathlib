import ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean.ParetoOptimalityPackage

namespace HautevilleHouse
namespace ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean

structure GoalProgrammingPackage where
  targetGoals : List (MultipleObjectivesAdmittedObject → ℝ)
  deviations : List ℝ
  weightedSum : Prop
  lexicographicOrdering : Prop
  satisficingCondition : Prop

structure GoalProgrammingEvidence (G : GoalProgrammingPackage) where
  weightedSumClosed : G.weightedSum
  lexicographicOrderingClosed : G.lexicographicOrdering
  satisficingConditionClosed : G.satisficingCondition

def GoalProgrammingClosed (G : GoalProgrammingPackage) : Prop :=
  G.weightedSum ∧ G.lexicographicOrdering ∧ G.satisficingCondition

theorem goal_programming_closed_from_evidence (G : GoalProgrammingPackage) (E : GoalProgrammingEvidence G) :
    GoalProgrammingClosed G :=
  And.intro E.weightedSumClosed (And.intro E.lexicographicOrderingClosed E.satisficingConditionClosed)

end ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean
end HautevilleHouse