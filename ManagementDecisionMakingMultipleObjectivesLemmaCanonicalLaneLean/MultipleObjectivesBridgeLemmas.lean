import ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean.MultipleObjectivesAdmissibleClass

namespace HautevilleHouse
namespace ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MultipleObjectivesWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A :=
  A.object.conclusion

end ManagementDecisionMakingMultipleObjectivesLemmaCanonicalLaneLean
end HautevilleHouse