import ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean.MultipleObjectivesPackage

namespace HautevilleHouse
namespace ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean

structure EquityEfficiencyTradeoffPackage {M : MultipleObjectivesPackage} where
  equityMeasure : M.alternatives -> ℝ
  efficiencyMeasure : M.alternatives -> ℝ
  tradeoffParetoFrontier : Set (ℝ × ℝ)
  equityDefined : Prop
  efficiencyDefined : Prop
  frontierNonempty : Prop
  tradeoffIdentified : Prop

structure EquityEfficiencyTradeoffEvidence {M : MultipleObjectivesPackage}
    (T : EquityEfficiencyTradeoffPackage M) where
  equityDefinedClosed : T.equityDefined
  efficiencyDefinedClosed : T.efficiencyDefined
  frontierNonemptyClosed : T.frontierNonempty
  tradeoffIdentifiedClosed : T.tradeoffIdentified

def EquityEfficiencyTradeoffClosed {M : MultipleObjectivesPackage}
    (T : EquityEfficiencyTradeoffPackage M) : Prop :=
  T.equityDefined ∧ T.efficiencyDefined ∧
  T.frontierNonempty ∧ T.tradeoffIdentified

theorem equity_efficiency_tradeoff_closed_from_evidence
    {M : MultipleObjectivesPackage} (T : EquityEfficiencyTradeoffPackage M)
    (E : EquityEfficiencyTradeoffEvidence T) : EquityEfficiencyTradeoffClosed T := by
  exact And.intro E.equityDefinedClosed
    (And.intro E.efficiencyDefinedClosed
      (And.intro E.frontierNonemptyClosed E.tradeoffIdentifiedClosed))

end ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean
end HautevilleHouse