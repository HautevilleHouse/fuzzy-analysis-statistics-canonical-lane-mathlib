import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyAnalysisStatisticsCanonicalLaneLean

structure FuzzySetPackage where
  universe : Type u
  membershipFunction : universe → ℝ
  alphaCut (α : ℝ) : Set universe
  alphaCutProp (α : ℝ) : (∀ x, membershipFunction x ≥ α ↔ x ∈ alphaCut α)
  convex : Prop
  normal : Prop

structure FuzzySetEvidence (F : FuzzySetPackage) where
  alphaCutPropClosed : ∀ α, (∀ x, F.membershipFunction x ≥ α ↔ x ∈ F.alphaCut α)
  convexClosed : F.convex
  normalClosed : F.normal

def FuzzySetClosed (F : FuzzySetPackage) : Prop :=
  (∀ α, ∀ x, F.membershipFunction x ≥ α ↔ x ∈ F.alphaCut α) ∧ F.convex ∧ F.normal

theorem fuzzy_set_closed_from_evidence (F : FuzzySetPackage) (E : FuzzySetEvidence F) : FuzzySetClosed F :=
  by
    exact And.intro E.alphaCutPropClosed (And.intro E.convexClosed E.normalClosed)

end FuzzyAnalysisStatisticsCanonicalLaneLean
end HautevilleHouse