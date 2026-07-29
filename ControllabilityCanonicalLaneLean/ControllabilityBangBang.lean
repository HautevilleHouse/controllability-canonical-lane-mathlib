import HautevilleHouse.ControllabilityCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ControllabilityCanonicalLaneLean

structure BangBangControl (stateSpace controlSpace : Type) [AddCommMonoid stateSpace] [AddCommMonoid controlSpace] [Module ℝ stateSpace] [Module ℝ controlSpace] where
  timeHorizon : ℝ
  controlBounds : Set controlSpace
  extremalControls : controlSpace → Prop
  bangBangPrincipleHolds : Prop

def BangBangClosed (stateSpace controlSpace : Type) [AddCommMonoid stateSpace] [AddCommMonoid controlSpace] [Module ℝ stateSpace] [Module ℝ controlSpace] (B : BangBangControl stateSpace controlSpace) : Prop :=
  B.bangBangPrincipleHolds

theorem bang_bang_closed_from_evidence (stateSpace controlSpace : Type) [AddCommMonoid stateSpace] [AddCommMonoid controlSpace] [Module ℝ stateSpace] [Module ℝ controlSpace] (B : BangBangControl stateSpace controlSpace) (E : B.bangBangPrincipleHolds) : BangBangClosed stateSpace controlSpace B := by
  exact E

end ControllabilityCanonicalLaneLean
end HautevilleHouse