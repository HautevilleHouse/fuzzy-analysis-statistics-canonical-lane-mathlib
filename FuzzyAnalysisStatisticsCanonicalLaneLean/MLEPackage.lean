import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Analysis.Calculus.MeanInequalities

namespace HautevilleHouse
namespace FuzzyAnalysisStatisticsCanonicalLaneLean

/-- Maximum Likelihood Estimation package. -/
structure MLEPackage (Ω : Type u) [MeasurableSpace Ω] (Θ : Type v) [TopologicalSpace Θ] (X : Ω → ℝ) where
  likelihoodFunction : Θ → (Ω → ℝ) → ℝ
  logLikelihoodFunction : Θ → (Ω → ℝ) → ℝ
  scoreFunction : Θ → Ω → ℝ
  observedInformation : Θ → ℝ
  consistencyCondition : Prop
  asymptoticNormalityCondition : Prop
  efficiencyCondition : Prop

structure MLEEvidence (M : MLEPackage Ω Θ X) where
  consistencyConditionClosed : M.consistencyCondition
  asymptoticNormalityConditionClosed : M.asymptoticNormalityCondition
  efficiencyConditionClosed : M.efficiencyCondition

def MLEClosed (M : MLEPackage Ω Θ X) : Prop :=
  M.consistencyCondition ∧ M.asymptoticNormalityCondition ∧ M.efficiencyCondition

theorem mle_closed_from_evidence (M : MLEPackage Ω Θ X) (E : MLEEvidence M) : MLEClosed M := by
  exact And.intro E.consistencyConditionClosed
    (And.intro E.asymptoticNormalityConditionClosed E.efficiencyConditionClosed)

/-- Regularity conditions for MLE consistency. -/
structure MLERegularityPackage (Ω : Type u) [MeasurableSpace Ω] (Θ : Type v) [TopologicalSpace Θ] (X : Ω → ℝ) where
  identifiabilityCondition : Prop
  compactParameterSpace : Prop
  continuityInTheta : Prop
  dominanceCondition : Prop
  uniformLawLargeNumbers : Prop

structure MLERegularityEvidence (R : MLERegularityPackage Ω Θ X) where
  identifiabilityConditionClosed : R.identifiabilityCondition
  compactParameterSpaceClosed : R.compactParameterSpace
  continuityInThetaClosed : R.continuityInTheta
  dominanceConditionClosed : R.dominanceCondition
  uniformLawLargeNumbersClosed : R.uniformLawLargeNumbers

def MLERegularityClosed (R : MLERegularityPackage Ω Θ X) : Prop :=
  R.identifiabilityCondition ∧ R.compactParameterSpace ∧ R.continuityInTheta ∧
  R.dominanceCondition ∧ R.uniformLawLargeNumbers

theorem mle_regularity_closed_from_evidence (R : MLERegularityPackage Ω Θ X)
    (E : MLERegularityEvidence R) : MLERegularityClosed R := by
  exact And.intro E.identifiabilityConditionClosed
    (And.intro E.compactParameterSpaceClosed
      (And.intro E.continuityInThetaClosed
        (And.intro E.dominanceConditionClosed E.uniformLawLargeNumbersClosed)))

end HautevilleHouse
end FuzzyAnalysisStatisticsCanonicalLaneLean
