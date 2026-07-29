import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyAnalysisStatisticsCanonicalLaneLean.FuzzySetTheory
import HautevilleHouse.FuzzyAnalysisStatisticsCanonicalLaneLean.SufficiencyExponentialFamily
import HautevilleHouse.FuzzyAnalysisStatisticsCanonicalLaneLean.NeymanPearsonLemma
import HautevilleHouse.FuzzyAnalysisStatisticsCanonicalLaneLean.MLEConsistency

namespace HautevilleHouse
namespace FuzzyAnalysisStatisticsCanonicalLaneLean

structure FuzzyStatisticalInferencePackage where
  fuzzyData : FuzzySetPackage
  exponentialFamily : ExponentialFamilyPackage (Ω := fuzzyData.universe)
  test : NeymanPearsonPackage
  estimation : MLEPackage
  compatibility : Prop

structure FuzzyStatisticalInferenceEvidence (I : FuzzyStatisticalInferencePackage) where
  fuzzyDataClosed : FuzzySetClosed I.fuzzyData
  exponentialFamilyClosed : ExponentialFamilyClosed I.exponentialFamily
  testClosed : NeymanPearsonClosed I.test
  estimationClosed : MLEClosed I.estimation
  compatibilityClosed : I.compatibility

def FuzzyStatisticalInferenceClosed (I : FuzzyStatisticalInferencePackage) : Prop :=
  FuzzySetClosed I.fuzzyData ∧
  ExponentialFamilyClosed I.exponentialFamily ∧
  NeymanPearsonClosed I.test ∧
  MLEClosed I.estimation ∧
  I.compatibility

theorem fuzzy_statistical_inference_closed (I : FuzzyStatisticalInferencePackage) (E : FuzzyStatisticalInferenceEvidence I) : FuzzyStatisticalInferenceClosed I :=
  by
    exact And.intro E.fuzzyDataClosed
      (And.intro E.exponentialFamilyClosed
        (And.intro E.testClosed
          (And.intro E.estimationClosed E.compatibilityClosed)))

end FuzzyAnalysisStatisticsCanonicalLaneLean
end HautevilleHouse