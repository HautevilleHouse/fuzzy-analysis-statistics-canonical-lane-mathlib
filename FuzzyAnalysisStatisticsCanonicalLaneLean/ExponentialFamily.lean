import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyAnalysisStatisticsCanonicalLaneLean

structure ExponentialFamily (U : Type u) where
  sampleSpace : Type u
  naturalParameter : Type v
  sufficientStatistic : (U → ℝ)
  logPartitionFunction : ℝ → ℝ
  baseMeasure : Set U
  baseMeasureNonempty : baseMeasure.Nonempty

structure ExponentialFamilyEvidence (U : Type u) (E : ExponentialFamily U) where
  logPartitionFunctionDefined : True
  baseMeasureNonemptyClosed : E.baseMeasureNonempty

structure ExponentialFamilyClosed (U : Type u) (E : ExponentialFamily U) : Prop where
  logPartitionFunctionDefined : True
  baseMeasureNonemptyClosed : E.baseMeasureNonempty

theorem exponential_family_closed_from_evidence (U : Type u) (E : ExponentialFamily U) (Ev : ExponentialFamilyEvidence U E) : ExponentialFamilyClosed U E := by
  exact { logPartitionFunctionDefined := Ev.logPartitionFunctionDefined, baseMeasureNonemptyClosed := Ev.baseMeasureNonemptyClosed }

end FuzzyAnalysisStatisticsCanonicalLaneLean
end HautevilleHouse
