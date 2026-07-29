import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean

structure InteractiveMethods where
  preferenceElicitation : Prop
  iterativeRefinement : Prop
  convergenceCriterion : Prop
  decisionMakerInteraction : Prop

def interactiveClosed (I : InteractiveMethods) : Prop :=
  I.preferenceElicitation ∧ I.iterativeRefinement ∧ I.convergenceCriterion ∧ I.decisionMakerInteraction

end ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean
end HautevilleHouse