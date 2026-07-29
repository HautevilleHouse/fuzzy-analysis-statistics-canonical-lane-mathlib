import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyAnalysisStatisticsCanonicalLaneLean

structure NeymanPearsonPackage where
  hypothesisPair : Type u
  testFunction : Type v
  sizeFunction : Type w
  powerFunction : Type x
  mostPowerfulTest : Prop
  neymanPearsonLemma : Prop
  likelihoodRatioStructure : Prop

structure NeymanPearsonEvidence (N : NeymanPearsonPackage) where
  mostPowerfulTestClosed : N.mostPowerfulTest
  neymanPearsonLemmaClosed : N.neymanPearsonLemma
  likelihoodRatioStructureClosed : N.likelihoodRatioStructure

def NeymanPearsonClosed (N : NeymanPearsonPackage) : Prop :=
  N.mostPowerfulTest ∧ N.neymanPearsonLemma ∧ N.likelihoodRatioStructure

theorem neyman_pearson_closed_from_evidence (N : NeymanPearsonPackage)
    (Ev : NeymanPearsonEvidence N) : NeymanPearsonClosed N := by
  exact And.intro Ev.mostPowerfulTestClosed
    (And.intro Ev.neymanPearsonLemmaClosed Ev.likelihoodRatioStructureClosed)

end FuzzyAnalysisStatisticsCanonicalLaneLean
end HautevilleHouse