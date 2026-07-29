import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean

structure WeightingMethodEvidencePackage (M : MultipleObjectivesLemmaPackage) where
  ratioWeightAssignments : Prop
  eigenvectorConsistency : Prop
  utilityAggregation : Prop
  sensitivityAnalysis : Prop

structure WeightingMethodEvidence {M : MultipleObjectivesLemmaPackage}
    (W : WeightingMethodEvidencePackage M) where
  ratioWeightAssignmentsClosed : W.ratioWeightAssignments
  eigenvectorConsistencyClosed : W.eigenvectorConsistency
  utilityAggregationClosed : W.utilityAggregation
  sensitivityAnalysisClosed : W.sensitivityAnalysis

def WeightingMethodClosed {M : MultipleObjectivesLemmaPackage}
    (W : WeightingMethodEvidencePackage M) : Prop :=
  W.ratioWeightAssignments ∧ W.eigenvectorConsistency ∧ W.utilityAggregation ∧ W.sensitivityAnalysis

theorem weighting_method_closed_from_evidence {M : MultipleObjectivesLemmaPackage}
    (W : WeightingMethodEvidencePackage M) (E : WeightingMethodEvidence W) :
    WeightingMethodClosed W := by
  exact And.intro E.ratioWeightAssignmentsClosed
    (And.intro E.eigenvectorConsistencyClosed (And.intro E.utilityAggregationClosed E.sensitivityAnalysisClosed))

end HautevilleHouse
end ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean