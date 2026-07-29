import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyAnalysisStatisticsCanonicalLaneLean

structure FuzzyClassifier (U : Type u) where
  decisionBoundary : ℝ
  misclassificationRate : ℝ

structure ClassifierEvidence (U : Type u) (C : FuzzyClassifier U) where
  decisionBoundaryFinite : C.decisionBoundary ≠ ∞

structure ClassifierClosed (U : Type u) (C : FuzzyClassifier U) : Prop where
  decisionBoundaryFinite : C.decisionBoundary ≠ ∞

theorem classifier_closed_from_evidence (U : Type u) (C : FuzzyClassifier U) (E : ClassifierEvidence U C) : ClassifierClosed U C := by
  exact { decisionBoundaryFinite := E.decisionBoundaryFinite }

end FuzzyAnalysisStatisticsCanonicalLaneLean
end HautevilleHouse
