import ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean.EquityEfficiencyTradeoff

namespace HautevilleHouse
namespace ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean

structure MultiCriteriaDecisionAnalysisPackage {M : MultipleObjectivesPackage}
    {C : CompromiseProgrammingPackage M} {G : GoalProgrammingPackage M}
    {W : MOORWeightingPackage M} {T : EquityEfficiencyTradeoffPackage M} where
  decisionRule : M.alternatives -> Prop
  ranking : List M.alternatives
  sensitivityAnalysis : Prop
  robustnessCheck : Prop
  decisionRuleDefined : Prop
  rankingComplete : Prop
  sensitivityAnalysed : Prop
  robustnessValid : Prop

structure MultiCriteriaDecisionAnalysisEvidence {M : MultipleObjectivesPackage}
    {C : CompromiseProgrammingPackage M} {G : GoalProgrammingPackage M}
    {W : MOORWeightingPackage M} {T : EquityEfficiencyTradeoffPackage M}
    (D : MultiCriteriaDecisionAnalysisPackage M C G W T) where
  decisionRuleDefinedClosed : D.decisionRuleDefined
  rankingCompleteClosed : D.rankingComplete
  sensitivityAnalysedClosed : D.sensitivityAnalysed
  robustnessValidClosed : D.robustnessValid

def MultiCriteriaDecisionAnalysisClosed {M : MultipleObjectivesPackage}
    {C : CompromiseProgrammingPackage M} {G : GoalProgrammingPackage M}
    {W : MOORWeightingPackage M} {T : EquityEfficiencyTradeoffPackage M}
    (D : MultiCriteriaDecisionAnalysisPackage M C G W T) : Prop :=
  D.decisionRuleDefined ∧ D.rankingComplete ∧
  D.sensitivityAnalysed ∧ D.robustnessValid

theorem multi_criteria_decision_analysis_closed_from_evidence
    {M : MultipleObjectivesPackage} {C : CompromiseProgrammingPackage M}
    {G : GoalProgrammingPackage M} {W : MOORWeightingPackage M}
    {T : EquityEfficiencyTradeoffPackage M}
    (D : MultiCriteriaDecisionAnalysisPackage M C G W T)
    (E : MultiCriteriaDecisionAnalysisEvidence D) :
    MultiCriteriaDecisionAnalysisClosed D := by
  exact And.intro E.decisionRuleDefinedClosed
    (And.intro E.rankingCompleteClosed
      (And.intro E.sensitivityAnalysedClosed E.robustnessValidClosed))

end ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean
end HautevilleHouse