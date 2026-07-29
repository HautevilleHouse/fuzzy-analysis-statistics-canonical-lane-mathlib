import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyAnalysisStatisticsCanonicalLaneLean

structure SufficiencyPackage (U : Type u) where
  parameterSpace : Type v
  statistic : (U → ℝ) → ℝ
  factorizationCondition : Prop
  minimalSufficient : Prop

structure SufficiencyEvidence (U : Type u) (S : SufficiencyPackage U) where
  factorizationConditionClosed : S.factorizationCondition
  minimalSufficientClosed : S.minimalSufficient

structure SufficiencyClosed (U : Type u) (S : SufficiencyPackage U) : Prop where
  factorizationConditionClosed : S.factorizationCondition
  minimalSufficientClosed : S.minimalSufficient

theorem sufficiency_closed_from_evidence (U : Type u) (S : SufficiencyPackage U) (E : SufficiencyEvidence U S) : SufficiencyClosed U S := by
  exact { factorizationConditionClosed := E.factorizationConditionClosed, minimalSufficientClosed := E.minimalSufficientClosed }

end FuzzyAnalysisStatisticsCanonicalLaneLean
end HautevilleHouse
