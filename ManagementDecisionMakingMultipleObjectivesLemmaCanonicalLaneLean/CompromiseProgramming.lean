import ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean.MultipleObjectivesPackage

namespace HautevilleHouse
namespace ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean

structure CompromiseProgrammingPackage {M : MultipleObjectivesPackage} where
  idealPoint : M.alternatives
  antiIdealPoint : M.alternatives
  distanceMetric : M.alternatives -> M.alternatives -> ℝ
  compromiseSolution : M.alternatives
  idealPointDefined : Prop
  antiIdealPointDefined : Prop
  distanceMetricDefined : Prop
  compromiseSolutionValid : Prop

structure CompromiseProgrammingEvidence {M : MultipleObjectivesPackage}
    (C : CompromiseProgrammingPackage M) where
  idealPointDefinedClosed : C.idealPointDefined
  antiIdealPointDefinedClosed : C.antiIdealPointDefined
  distanceMetricDefinedClosed : C.distanceMetricDefined
  compromiseSolutionValidClosed : C.compromiseSolutionValid

def CompromiseProgrammingClosed {M : MultipleObjectivesPackage}
    (C : CompromiseProgrammingPackage M) : Prop :=
  C.idealPointDefined ∧ C.antiIdealPointDefined ∧
  C.distanceMetricDefined ∧ C.compromiseSolutionValid

theorem compromise_programming_closed_from_evidence
    {M : MultipleObjectivesPackage} (C : CompromiseProgrammingPackage M)
    (E : CompromiseProgrammingEvidence C) : CompromiseProgrammingClosed C := by
  exact And.intro E.idealPointDefinedClosed
    (And.intro E.antiIdealPointDefinedClosed
      (And.intro E.distanceMetricDefinedClosed E.compromiseSolutionValidClosed))

end ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean
end HautevilleHouse