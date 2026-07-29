import ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ManagementWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean
end HautevilleHouse