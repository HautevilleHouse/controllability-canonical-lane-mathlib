import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControllabilityCanonicalLaneLean

structure ControllabilityGramian where
  timeHorizon : ℝ
  gramianMatrix : Matrix (Fin stateDimension) (Fin stateDimension) ℝ
  gramianDefinite : Prop
  controllabilityIndex : Nat
  gramianDefiniteTerm : gramianDefinite

structure GramianEvidence (W : ControllabilityGramian) where
  timeHorizonPositive : W.timeHorizon > 0
  indexNonnegative : W.controllabilityIndex ≥ 0

def GramianClosed (W : ControllabilityGramian) : Prop :=
  W.gramianDefinite ∧ W.timeHorizon > 0 ∧ W.controllabilityIndex ≥ 0

theorem gramian_closed_from_evidence (W : ControllabilityGramian) (E : GramianEvidence W) : GramianClosed W := by
  exact And.intro W.gramianDefiniteTerm (And.intro E.timeHorizonPositive E.indexNonnegative)

end ControllabilityCanonicalLaneLean
end HautevilleHouse