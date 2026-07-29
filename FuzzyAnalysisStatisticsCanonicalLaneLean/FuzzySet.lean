import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyAnalysisStatisticsCanonicalLaneLean

structure FuzzySet (U : Type u) where
  membershipFunction : U → ℝ
  support : Set U
  supportFinite : support.Finite

structure FuzzySetEvidence (U : Type u) (A : FuzzySet U) where
  membershipFunctionDefined : A.membershipFunction = A.membershipFunction

structure FuzzySetClosed (U : Type u) (A : FuzzySet U) : Prop where
  membershipFunctionDefined : A.membershipFunction = A.membershipFunction

theorem fuzzy_set_closed_from_evidence (U : Type u) (A : FuzzySet U) (E : FuzzySetEvidence U A) : FuzzySetClosed U A := by
  exact { membershipFunctionDefined := E.membershipFunctionDefined }

end FuzzyAnalysisStatisticsCanonicalLaneLean
end HautevilleHouse
