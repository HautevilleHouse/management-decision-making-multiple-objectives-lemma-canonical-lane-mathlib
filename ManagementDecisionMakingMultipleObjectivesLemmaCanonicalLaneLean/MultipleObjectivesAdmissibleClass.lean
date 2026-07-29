import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean

structure MultipleObjectivesAdmittedObject where
  decisionSpace : Type
  objectiveFunctions : List (decisionSpace → ℝ)
  feasibleSet : Set decisionSpace
  paretoOptimalSet : Set decisionSpace
  conclusion : Prop

structure AdmissibleClass where
  object : MultipleObjectivesAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  MultipleObjectivesWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean
end HautevilleHouse