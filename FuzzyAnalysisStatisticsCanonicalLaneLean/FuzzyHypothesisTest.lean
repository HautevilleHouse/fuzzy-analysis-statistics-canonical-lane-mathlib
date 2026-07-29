import HautevilleHouse.FuzzyAnalysisStatisticsCanonicalLaneLean.MLEConsistency

namespace HautevilleHouse
namespace FuzzyAnalysisStatisticsCanonicalLaneLean

structure FuzzyHypothesisTestPackage where
  fuzzyNull : Prop
  fuzzyAlternative : Prop
  testStatistic : Prop
  fuzzyDecisionRule : Prop
  fuzzyPower : Prop

structure FuzzyHypothesisTestEvidence (H : FuzzyHypothesisTestPackage) where
  fuzzyNullClosed : H.fuzzyNull
  fuzzyAlternativeClosed : H.fuzzyAlternative
  testStatisticClosed : H.testStatistic
  fuzzyDecisionRuleClosed : H.fuzzyDecisionRule
  fuzzyPowerClosed : H.fuzzyPower

def FuzzyHypothesisTestClosed (H : FuzzyHypothesisTestPackage) : Prop :=
  H.fuzzyNull ∧ H.fuzzyAlternative ∧ H.testStatistic ∧
  H.fuzzyDecisionRule ∧ H.fuzzyPower

theorem fuzzy_hypothesis_test_closed_from_evidence
    (H : FuzzyHypothesisTestPackage) (E : FuzzyHypothesisTestEvidence H) :
    FuzzyHypothesisTestClosed H := by
  exact And.intro E.fuzzyNullClosed
    (And.intro E.fuzzyAlternativeClosed
      (And.intro E.testStatisticClosed
        (And.intro E.fuzzyDecisionRuleClosed E.fuzzyPowerClosed)))

end FuzzyAnalysisStatisticsCanonicalLaneLean
end HautevilleHouse
