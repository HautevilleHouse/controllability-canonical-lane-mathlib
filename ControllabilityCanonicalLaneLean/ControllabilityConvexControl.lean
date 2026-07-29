import HautevilleHouse.ControllabilityCanonicalLaneLean.AdmissibleClass
import Mathlib.Analysis.Convex.Basic

namespace HautevilleHouse
namespace ControllabilityCanonicalLaneLean

structure ConvexControlPackage (stateSpace controlSpace : Type) [AddCommMonoid stateSpace] [AddCommMonoid controlSpace] [Module ℝ stateSpace] [Module ℝ controlSpace] where
  controlSet : Set controlSpace
  convex : Convex ℝ controlSet
  reachableSet : Set stateSpace
  convexReachable : Convex ℝ reachableSet

def ConvexControlClosed (stateSpace controlSpace : Type) [AddCommMonoid stateSpace] [AddCommMonoid controlSpace] [Module ℝ stateSpace] [Module ℝ controlSpace] (C : ConvexControlPackage stateSpace controlSpace) : Prop :=
  C.convex ∧ C.convexReachable

theorem convex_control_closed_from_evidence (stateSpace controlSpace : Type) [AddCommMonoid stateSpace] [AddCommMonoid controlSpace] [Module ℝ stateSpace] [Module ℝ controlSpace] (C : ConvexControlPackage stateSpace controlSpace) (E : C.convex) (F : C.convexReachable) : ConvexControlClosed stateSpace controlSpace C := by
  exact And.intro E F

end ControllabilityCanonicalLaneLean
end HautevilleHouse