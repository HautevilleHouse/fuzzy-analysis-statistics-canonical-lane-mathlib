import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyAnalysisStatisticsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FuzzyStatisticsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end FuzzyAnalysisStatisticsCanonicalLaneLean
end HautevilleHouse