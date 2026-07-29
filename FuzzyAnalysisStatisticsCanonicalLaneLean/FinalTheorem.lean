import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyAnalysisStatisticsCanonicalLaneLean

def ConstrainedFuzzyAnalysisClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_fuzzy_analysis_endgame (A : AdmissibleClass) :
    ConstrainedFuzzyAnalysisClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FuzzyAnalysisStatisticsCanonicalLaneLean
end HautevilleHouse
