import HautevilleHouse.ControllabilityCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ControllabilityCanonicalLaneLean

structure KalmanRankCondition {n m : Nat} (sys : LinearControlSystem n m) where
  controllabilityMatrix : Matrix (Fin (n*m)) (Fin n) ℝ
  fullRowRank : Prop
  kalmanCondition : Prop
  rankConditionImpliesControllable : fullRowRank → kalmanCondition

def KalmanRankClosed {n m : Nat} {sys : LinearControlSystem n m} (K : KalmanRankCondition sys) : Prop :=
  K.fullRowRank ∧ K.kalmanCondition

theorem kalman_rank_closed_from_evidence {n m : Nat} {sys : LinearControlSystem n m} (K : KalmanRankCondition sys) (E : K.fullRowRank) : KalmanRankClosed K := by
  exact And.intro E (K.rankConditionImpliesControllable E)

end ControllabilityCanonicalLaneLean
end HautevilleHouse