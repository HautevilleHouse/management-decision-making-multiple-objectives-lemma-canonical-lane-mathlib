import ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean

structure MultipleObjectivesPackage where
  alternatives : Type u
  objectives : Type v
  criteriaWeights : alternatives -> objectives -> ℝ
  dominanceRelation : alternatives -> alternatives -> Prop
  paretoEfficiency : Prop
  weightedSumModel : Prop
  preferenceConsistency : Prop

structure MultipleObjectivesEvidence (M : MultipleObjectivesPackage) where
  paretoEfficiencyClosed : M.paretoEfficiency
  weightedSumModelClosed : M.weightedSumModel
  preferenceConsistencyClosed : M.preferenceConsistency

def MultipleObjectivesClosed (M : MultipleObjectivesPackage) : Prop :=
  M.paretoEfficiency ∧ M.weightedSumModel ∧ M.preferenceConsistency

theorem multiple_objectives_closed_from_evidence (M : MultipleObjectivesPackage)
    (E : MultipleObjectivesEvidence M) : MultipleObjectivesClosed M := by
  exact And.intro E.paretoEfficiencyClosed
    (And.intro E.weightedSumModelClosed E.preferenceConsistencyClosed)

end ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean
end HautevilleHouse