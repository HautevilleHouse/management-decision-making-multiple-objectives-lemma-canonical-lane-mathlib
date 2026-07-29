import ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean.GoalProgramming

/-!
# Analytic Hierarchy Process and Analytic Network Process Package
-/

namespace HautevilleHouse
namespace ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean

structure AHPANPPackage {F : MultipleObjectivesFrameworkPackage} (G : F) where
  pairwiseComparisonMatrices : Prop
  eigenvaluesComputed : Prop
  consistencyRatioSatisfied : Prop
  supermatrixFormed : Prop
  limitingPrioritiesCalculated : Prop

structure AHPANPEvidence {F : MultipleObjectivesFrameworkPackage} {G : AHPANPPackage F} (H : G) where
  pairwiseComparisonMatricesClosed : H.pairwiseComparisonMatrices
  eigenvaluesComputedClosed : H.eigenvaluesComputed
  consistencyRatioSatisfiedClosed : H.consistencyRatioSatisfied
  supermatrixFormedClosed : H.supermatrixFormed
  limitingPrioritiesCalculatedClosed : H.limitingPrioritiesCalculated

def AHPANPClosed {F : MultipleObjectivesFrameworkPackage} {G : AHPANPPackage F} (H : G) : Prop :=
  H.pairwiseComparisonMatrices ∧ H.eigenvaluesComputed ∧
  H.consistencyRatioSatisfied ∧ H.supermatrixFormed ∧ H.limitingPrioritiesCalculated

theorem ahp_anp_closed_from_evidence
    {F : MultipleObjectivesFrameworkPackage} {G : AHPANPPackage F}
    (H : G) (E : AHPANPEvidence H) : AHPANPClosed H := by
  exact And.intro E.pairwiseComparisonMatricesClosed
    (And.intro E.eigenvaluesComputedClosed
      (And.intro E.consistencyRatioSatisfiedClosed
        (And.intro E.supermatrixFormedClosed E.limitingPrioritiesCalculatedClosed)))

end ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean
end HautevilleHouse