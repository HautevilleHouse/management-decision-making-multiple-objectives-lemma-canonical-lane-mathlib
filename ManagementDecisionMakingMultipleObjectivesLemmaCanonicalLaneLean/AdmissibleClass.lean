import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean

structure AdmittedDecisionObject where
  problemSpace : Type u
  decisionModel : Prop
  conclusion : decisionModel

def AdmittedDecisionWitnessClosed (O : AdmittedDecisionObject) : Prop :=
  O.decisionModel

structure AdmissibleClass where
  object : AdmittedDecisionObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  AdmittedDecisionWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end HautevilleHouse
end ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean