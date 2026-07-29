import ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean.MultipleObjectivesFramework

/-!
# Goal Programming Package
-/

namespace HautevilleHouse
namespace ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean

structure GoalProgrammingPackage {F : MultipleObjectivesFrameworkPackage} (G : F) where
  aspirationLevelsSet : Prop
  deviationVariablesDefined : Prop
  weightedAchievementFunction : Prop
  solutionComputed : Prop

structure GoalProgrammingEvidence {F : MultipleObjectivesFrameworkPackage} {G : GoalProgrammingPackage F} (H : G) where
  aspirationLevelsSetClosed : H.aspirationLevelsSet
  deviationVariablesDefinedClosed : H.deviationVariablesDefined
  weightedAchievementFunctionClosed : H.weightedAchievementFunction
  solutionComputedClosed : H.solutionComputed

def GoalProgrammingClosed {F : MultipleObjectivesFrameworkPackage} {G : GoalProgrammingPackage F} (H : G) : Prop :=
  H.aspirationLevelsSet ∧ H.deviationVariablesDefined ∧
  H.weightedAchievementFunction ∧ H.solutionComputed

theorem goal_programming_closed_from_evidence
    {F : MultipleObjectivesFrameworkPackage} {G : GoalProgrammingPackage F}
    (H : G) (E : GoalProgrammingEvidence H) : GoalProgrammingClosed H := by
  exact And.intro E.aspirationLevelsSetClosed
    (And.intro E.deviationVariablesDefinedClosed
      (And.intro E.weightedAchievementFunctionClosed E.solutionComputedClosed))

end ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean
end HautevilleHouse