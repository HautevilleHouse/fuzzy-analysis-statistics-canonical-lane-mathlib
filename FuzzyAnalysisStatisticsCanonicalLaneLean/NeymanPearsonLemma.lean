import canonicalLaneMathlib.AdmissibleClass
import Mathlib.MeasureTheory.Integral.Bochner

namespace HautevilleHouse
namespace FuzzyAnalysisStatisticsCanonicalLaneLean

/-- Hypothesis testing package: H0 vs H1 with given significance level α. -/
structure HypothesisTestingPackage (Ω : Type u) [MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω) where
  nullHypothesis : Set (Ω → ℝ)
  alternativeHypothesis : Set (Ω → ℝ)
  significanceLevel : ℝ
  testFunction : Ω → ℝ
  powerFunction : ℝ → ℝ
  mostPowerfulCondition : Prop
  neymanPearsonLemma : Prop

structure HypothesisTestingEvidence (H : HypothesisTestingPackage Ω μ) where
  mostPowerfulConditionClosed : H.mostPowerfulCondition
  neymanPearsonLemmaClosed : H.neymanPearsonLemma

def HypothesisTestingClosed (H : HypothesisTestingPackage Ω μ) : Prop :=
  H.mostPowerfulCondition ∧ H.neymanPearsonLemma

theorem hypothesis_testing_closed_from_evidence (H : HypothesisTestingPackage Ω μ)
    (E : HypothesisTestingEvidence H) : HypothesisTestingClosed H := by
  exact And.intro E.mostPowerfulConditionClosed E.neymanPearsonLemmaClosed

/-- Likelihood ratio test: Λ(x) = sup_{θ∈Θ0} L(θ|x) / sup_{θ∈Θ} L(θ|x) -/
structure LikelihoodRatioTestPackage (Ω : Type u) [MeasurableSpace Ω] (Θ : Type v) (X : Ω → ℝ) where
  likelihoodFunction : (Θ → (Ω → ℝ)) → Ω → ℝ
  supremumOverNull : ℝ
  supremumOverAll : ℝ
  testStatistic : Ω → ℝ
  rejectionRegion : Set Ω
  levelAlpha : ℝ
  lrtCondition : Prop

end HautevilleHouse
end FuzzyAnalysisStatisticsCanonicalLaneLean
