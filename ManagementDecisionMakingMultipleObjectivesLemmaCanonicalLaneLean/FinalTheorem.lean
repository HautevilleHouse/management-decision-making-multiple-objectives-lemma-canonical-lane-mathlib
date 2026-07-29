import ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean.BridgeLemmas
import ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean.AHPANP

namespace HautevilleHouse
namespace ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean

def ConstrainedMultipleObjectivesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_multiple_objectives_endgame (A : AdmissibleClass) :
    ConstrainedMultipleObjectivesClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean
end HautevilleHouse