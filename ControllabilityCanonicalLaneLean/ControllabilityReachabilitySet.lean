import HautevilleHouse.ControllabilityCanonicalLaneLean.AdmissibleClass
import Mathlib.Analysis.Convex.Basic

namespace HautevilleHouse
namespace ControllabilityCanonicalLaneLean

structure ReachabilitySetPackage {n m : Nat} (sys : LinearControlSystem n m) where
  reachableSet : Set (Fin n → ℝ)
  linearSubspace : Submodule ℝ (Fin n → ℝ)
  reachableSetEqualsSubspace : reachableSet = linearSubspace
  reachableSubspaceClosed : Submodule.ClosedUnderLinearCombination linearSubspace

def ReachabilitySetClosed {n m : Nat} {sys : LinearControlSystem n m} (R : ReachabilitySetPackage sys) : Prop :=
  R.reachableSet = R.linearSubspace ∧ R.reachableSubspaceClosed

theorem reachability_set_closed_from_evidence {n m : Nat} {sys : LinearControlSystem n m} (R : ReachabilitySetPackage sys) (E : ReachabilitySetClosed R) : R.reachableSetEqualsSubspace ∧ R.reachableSubspaceClosed := by
  exact E

end ControllabilityCanonicalLaneLean
end HautevilleHouse