import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControllabilityCanonicalLaneLean

structure KalmanRankCondition where
  system : LinearControlSystem
  controllabilityMatrix : Type u
  fullRankCondition : Prop
  rankComputed : Prop
  rankEqualsDimension : Prop

structure KalmanRankConditionEvidence (K : KalmanRankCondition) where
  fullRankConditionClosed : K.fullRankCondition
  rankComputedClosed : K.rankComputed
  rankEqualsDimensionClosed : K.rankEqualsDimension

def KalmanRankConditionClosed (K : KalmanRankCondition) : Prop :=
  K.fullRankCondition ∧ K.rankComputed ∧ K.rankEqualsDimension

theorem kalman_rank_condition_closed_from_evidence (K : KalmanRankCondition) (E : KalmanRankConditionEvidence K) :
    KalmanRankConditionClosed K := by
  exact And.intro E.fullRankConditionClosed (And.intro E.rankComputedClosed E.rankEqualsDimensionClosed)

end ControllabilityCanonicalLaneLean
end HautevilleHouse