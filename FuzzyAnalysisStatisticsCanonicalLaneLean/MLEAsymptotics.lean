import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyAnalysisStatisticsCanonicalLaneLean

structure MLEAsymptoticsPackage where
  logLikelihood : Type u
  scoreFunction : Type v
  fisherInformation : Type w
  consistencyTheorem : Prop
  asymptoticNormality : Prop
  efficiencyBound : Prop

structure MLEAsymptoticsEvidence (M : MLEAsymptoticsPackage) where
  consistencyTheoremClosed : M.consistencyTheorem
  asymptoticNormalityClosed : M.asymptoticNormality
  efficiencyBoundClosed : M.efficiencyBound

def MLEAsymptoticsClosed (M : MLEAsymptoticsPackage) : Prop :=
  M.consistencyTheorem ∧ M.asymptoticNormality ∧ M.efficiencyBound

theorem mle_asymptotics_closed_from_evidence (M : MLEAsymptoticsPackage)
    (Ev : MLEAsymptoticsEvidence M) : MLEAsymptoticsClosed M := by
  exact And.intro Ev.consistencyTheoremClosed
    (And.intro Ev.asymptoticNormalityClosed Ev.efficiencyBoundClosed)

end FuzzyAnalysisStatisticsCanonicalLaneLean
end HautevilleHouse