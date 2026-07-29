import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyAnalysisStatisticsCanonicalLaneLean

structure MaximumLikelihoodEstimation (U : Type u) where
  likelihoodFunction : (U → ℝ) → ℝ → ℝ
  parameterSpace : Set ℝ
  compactParameterSpace : parameterSpace.IsCompact

structure MLEEvidence (U : Type u) (M : MaximumLikelihoodEstimation U) where
  compactParameterSpaceClosed : M.compactParameterSpace

structure MLEClosed (U : Type u) (M : MaximumLikelihoodEstimation U) : Prop where
  compactParameterSpaceClosed : M.compactParameterSpace

theorem mle_closed_from_evidence (U : Type u) (M : MaximumLikelihoodEstimation U) (E : MLEEvidence U M) : MLEClosed U M := by
  exact { compactParameterSpaceClosed := E.compactParameterSpaceClosed }

end FuzzyAnalysisStatisticsCanonicalLaneLean
end HautevilleHouse
