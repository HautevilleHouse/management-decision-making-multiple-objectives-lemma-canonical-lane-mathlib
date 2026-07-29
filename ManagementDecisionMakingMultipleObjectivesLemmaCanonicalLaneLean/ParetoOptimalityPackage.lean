import ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean.MultipleObjectivesAdmissibleClass

namespace HautevilleHouse
namespace ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean

structure ParetoOptimalityPackage where
  objectives : List (MultipleObjectivesAdmittedObject → ℝ)
  feasibleSet : Set MultipleObjectivesAdmittedObject
  paretoFrontier : Set MultipleObjectivesAdmittedObject
  efficiencyCondition : Prop
  tradeOffAnalysis : Prop
  nondominatedCondition : Prop

structure ParetoOptimalityEvidence (P : ParetoOptimalityPackage) where
  efficiencyConditionClosed : P.efficiencyCondition
  tradeOffAnalysisClosed : P.tradeOffAnalysis
  nondominatedConditionClosed : P.nondominatedCondition

def ParetoOptimalityClosed (P : ParetoOptimalityPackage) : Prop :=
  P.efficiencyCondition ∧ P.tradeOffAnalysis ∧ P.nondominatedCondition

theorem pareto_optimality_closed_from_evidence (P : ParetoOptimalityPackage) (E : ParetoOptimalityEvidence P) :
    ParetoOptimalityClosed P :=
  And.intro E.efficiencyConditionClosed (And.intro E.tradeOffAnalysisClosed E.nondominatedConditionClosed)

end ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean
end HautevilleHouse