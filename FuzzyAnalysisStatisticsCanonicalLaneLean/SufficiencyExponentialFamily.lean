import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyAnalysisStatisticsCanonicalLaneLean

structure SufficiencyExponentialFamilyPackage where
  sufficientStatistic : Prop
  exponentialFamilyForm : Prop
  likelihoodFactorization : Prop
  completenessUnderFuzzy : Prop

structure SufficiencyExponentialFamilyEvidence (P : SufficiencyExponentialFamilyPackage) where
  sufficientStatisticClosed : P.sufficientStatistic
  exponentialFamilyFormClosed : P.exponentialFamilyForm
  likelihoodFactorizationClosed : P.likelihoodFactorization
  completenessUnderFuzzyClosed : P.completenessUnderFuzzy

def SufficiencyExponentialFamilyClosed (P : SufficiencyExponentialFamilyPackage) : Prop :=
  P.sufficientStatistic ∧ P.exponentialFamilyForm ∧
  P.likelihoodFactorization ∧ P.completenessUnderFuzzy

theorem sufficiency_exponential_family_closed_from_evidence
    (P : SufficiencyExponentialFamilyPackage)
    (E : SufficiencyExponentialFamilyEvidence P) :
    SufficiencyExponentialFamilyClosed P := by
  exact And.intro E.sufficientStatisticClosed
    (And.intro E.exponentialFamilyFormClosed
      (And.intro E.likelihoodFactorizationClosed E.completenessUnderFuzzyClosed))

end FuzzyAnalysisStatisticsCanonicalLaneLean
end HautevilleHouse
