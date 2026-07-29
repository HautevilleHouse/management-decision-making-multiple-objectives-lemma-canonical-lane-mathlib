import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean

structure ParetoOptimalityPackage where
  alternativeSet : Type u
  preferenceOrder : alternativeSet → alternativeSet → Prop
  nondominatedAlternative : alternativeSet → Prop
  paretoFrontier : Set alternativeSet
  dominatedAlternatives : Set alternativeSet

structure ParetoOptimalityEvidence (P : ParetoOptimalityPackage) where
  preferenceTransitive : ∀ (a b c : P.alternativeSet), P.preferenceOrder a b → P.preferenceOrder b c → P.preferenceOrder a c
  preferenceReflexive : ∀ (a : P.alternativeSet), P.preferenceOrder a a
  nondominatedDefinition : ∀ (a : P.alternativeSet), P.nondominatedAlternative a ↔ a ∈ P.paretoFrontier
  frontiorNonEmpty : Nonempty P.paretoFrontier

def ParetoOptimalityClosed (P : ParetoOptimalityPackage) : Prop :=
  (∀ (a b c : P.alternativeSet), P.preferenceOrder a b → P.preferenceOrder b c → P.preferenceOrder a c) ∧
  (∀ (a : P.alternativeSet), P.preferenceOrder a a) ∧
  (∀ (a : P.alternativeSet), P.nondominatedAlternative a ↔ a ∈ P.paretoFrontier) ∧
  Nonempty P.paretoFrontier

theorem pareto_optimality_closed_from_evidence (P : ParetoOptimalityPackage) (E : ParetoOptimalityEvidence P) :
    ParetoOptimalityClosed P := by
  exact And.intro E.preferenceTransitive (And.intro E.preferenceReflexive (And.intro E.nondominatedDefinition E.frontiorNonEmpty))

end HautevilleHouse
end ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean