import ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean.AdmissibleClass

/-!
# Multiple Objectives Framework Package
-/

namespace HautevilleHouse
namespace ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean

structure MultipleObjectivesFrameworkPackage where
  decisionSpace : Type u
  objectiveSet : Type v
  preferenceRelation : Type w
  paretoFrontierCharacterized : Prop
  tradeoffAnalysisConducted : Prop
  compromiseSolutionIdentified : Prop
  sensitivityAnalysisPerformed : Prop

structure MultipleObjectivesFrameworkEvidence (F : MultipleObjectivesFrameworkPackage) where
  paretoFrontierCharacterizedClosed : F.paretoFrontierCharacterized
  tradeoffAnalysisConductedClosed : F.tradeoffAnalysisConducted
  compromiseSolutionIdentifiedClosed : F.compromiseSolutionIdentified
  sensitivityAnalysisPerformedClosed : F.sensitivityAnalysisPerformed

def MultipleObjectivesFrameworkClosed (F : MultipleObjectivesFrameworkPackage) : Prop :=
  F.paretoFrontierCharacterized ∧ F.tradeoffAnalysisConducted ∧
  F.compromiseSolutionIdentified ∧ F.sensitivityAnalysisPerformed

theorem multiple_objectives_framework_closed_from_evidence
    (F : MultipleObjectivesFrameworkPackage) (E : MultipleObjectivesFrameworkEvidence F) :
    MultipleObjectivesFrameworkClosed F := by
  exact And.intro E.paretoFrontierCharacterizedClosed
    (And.intro E.tradeoffAnalysisConductedClosed
      (And.intro E.compromiseSolutionIdentifiedClosed E.sensitivityAnalysisPerformedClosed))

end ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean
end HautevilleHouse