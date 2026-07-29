import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Probability.Density
import Mathlib.MeasureTheory.Integral.Bochner

namespace HautevilleHouse
namespace FuzzyAnalysisStatisticsCanonicalLaneLean

/-- Sufficiency package: A statistic T is sufficient for a parameter θ if the conditional distribution of the data given T does not depend on θ. -/
structure SufficiencyPackage (Ω : Type u) [MeasurableSpace Ω] (Θ : Type v) (X : Ω → ℝ) where
  statistic : Ω → ℝ
  conditionalDistributionIndependence : Prop
  factorizationCriterion : Prop
  /-- The Neyman-Fisher factorization: f(x|θ) = g(T(x),θ) * h(x) -/
  factorizationTheorem : Prop

structure SufficiencyEvidence {Ω : Type u} [MeasurableSpace Ω] {Θ : Type v} {X : Ω → ℝ}
    (S : SufficiencyPackage Ω Θ X) where
  conditionalDistributionIndependenceClosed : S.conditionalDistributionIndependence
  factorizationCriterionClosed : S.factorizationCriterion
  factorizationTheoremClosed : S.factorizationTheorem

def SufficiencyClosed {Ω : Type u} [MeasurableSpace Ω] {Θ : Type v} {X : Ω → ℝ}
    (S : SufficiencyPackage Ω Θ X) : Prop :=
  S.conditionalDistributionIndependence ∧ S.factorizationCriterion ∧ S.factorizationTheorem

theorem sufficiency_closed_from_evidence {Ω : Type u} [MeasurableSpace Ω] {Θ : Type v} {X : Ω → ℝ}
    (S : SufficiencyPackage Ω Θ X) (E : SufficiencyEvidence S) : SufficiencyClosed S := by
  exact And.intro E.conditionalDistributionIndependenceClosed
    (And.intro E.factorizationCriterionClosed E.factorizationTheoremClosed)

/-- Exponential Family: f(x|θ) = h(x) * exp(η(θ)^T T(x) - A(η(θ))) -/
structure ExponentialFamilyPackage (Ω : Type u) [MeasurableSpace Ω] (Θ : Type v) (X : Ω → ℝ) where
  naturalParameter : Θ → ℝ
  sufficientStatistic : Ω → ℝ
  logPartition : ℝ
  baseMeasure : Ω → ℝ
  densityForm : Prop
  carrier : Set ℝ

def densityClosed {Ω : Type u} [MeasurableSpace Ω] {Θ : Type v} {X : Ω → ℝ}
    (E : ExponentialFamilyPackage Ω Θ X) : Prop :=
  E.densityForm

/-- Minimal sufficient statistic: T is minimal sufficient if it is a function of any other sufficient statistic. -/
structure MinimalSufficiencyPackage {Ω : Type u} [MeasurableSpace Ω] {Θ : Type v} {X : Ω → ℝ}
    (S : SufficiencyPackage Ω Θ X) where
  minimalStatistic : Ω → ℝ
  minimalityCondition : Prop
  equivalenceToSufficient : Prop

structure MinimalSufficiencyEvidence {Ω : Type u} [MeasurableSpace Ω] {Θ : Type v} {X : Ω → ℝ}
    {S : SufficiencyPackage Ω Θ X} (M : MinimalSufficiencyPackage S) where
  minimalityConditionClosed : M.minimalityCondition
  equivalenceToSufficientClosed : M.equivalenceToSufficient

def MinimalSufficiencyClosed {Ω : Type u} [MeasurableSpace Ω] {Θ : Type v} {X : Ω → ℝ}
    {S : SufficiencyPackage Ω Θ X} (M : MinimalSufficiencyPackage S) : Prop :=
  M.minimalityCondition ∧ M.equivalenceToSufficient

theorem minimal_sufficiency_closed_from_evidence {Ω : Type u} [MeasurableSpace Ω] {Θ : Type v} {X : Ω → ℝ}
    {S : SufficiencyPackage Ω Θ X} (M : MinimalSufficiencyPackage S)
    (E : MinimalSufficiencyEvidence M) : MinimalSufficiencyClosed M := by
  exact And.intro E.minimalityConditionClosed E.equivalenceToSufficientClosed

end HautevilleHouse
end FuzzyAnalysisStatisticsCanonicalLaneLean
