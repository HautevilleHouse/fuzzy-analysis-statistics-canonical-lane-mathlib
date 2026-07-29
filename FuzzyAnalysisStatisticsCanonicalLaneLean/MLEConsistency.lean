import HautevilleHouse.FuzzyAnalysisStatisticsCanonicalLaneLean.NeymanPearsonLemma

namespace HautevilleHouse
namespace FuzzyAnalysisStatisticsCanonicalLaneLean

structure MLEConsistencyPackage where
  likelihoodFunction : Prop
  parameterSpace : Prop
  mleExistence : Prop
  consistencyUnderFuzzy : Prop
  asymptoticNormality : Prop

structure MLEConsistencyEvidence (M : MLEConsistencyPackage) where
  likelihoodFunctionClosed : M.likelihoodFunction
  parameterSpaceClosed : M.parameterSpace
  mleExistenceClosed : M.mleExistence
  consistencyUnderFuzzyClosed : M.consistencyUnderFuzzy
  asymptoticNormalityClosed : M.asymptoticNormality

def MLEConsistencyClosed (M : MLEConsistencyPackage) : Prop :=
  M.likelihoodFunction ∧ M.parameterSpace ∧
  M.mleExistence ∧ M.consistencyUnderFuzzy ∧ M.asymptoticNormality

theorem mle_consistency_closed_from_evidence
    (M : MLEConsistencyPackage) (E : MLEConsistencyEvidence M) :
    MLEConsistencyClosed M := by
  exact And.intro E.likelihoodFunctionClosed
    (And.intro E.parameterSpaceClosed
      (And.intro E.mleExistenceClosed
        (And.intro E.consistencyUnderFuzzyClosed E.asymptoticNormalityClosed)))

end FuzzyAnalysisStatisticsCanonicalLaneLean
end HautevilleHouse
