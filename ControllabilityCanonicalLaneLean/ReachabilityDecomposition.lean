import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControllabilityCanonicalLaneLean

structure ReachabilityDecomposition where
  controllableSubspaceDimension : Nat
  uncontrollableSubspaceDimension : Nat
  reachableSetCovered : Prop
  kalmanDecomposition : Prop
  reachableSetCoveredTerm : reachableSetCovered
  kalmanDecompositionTerm : kalmanDecomposition

structure DecompositionEvidence (R : ReachabilityDecomposition) where
  ctrlDimNonnegative : R.controllableSubspaceDimension ≥ 0
  unctrlDimNonnegative : R.uncontrollableSubspaceDimension ≥ 0

def DecompositionClosed (R : ReachabilityDecomposition) : Prop :=
  R.reachableSetCovered ∧ R.kalmanDecomposition ∧
  R.controllableSubspaceDimension ≥ 0 ∧ R.uncontrollableSubspaceDimension ≥ 0

theorem decomposition_closed_from_evidence (R : ReachabilityDecomposition) (E : DecompositionEvidence R) : DecompositionClosed R := by
  exact And.intro R.reachableSetCoveredTerm
    (And.intro R.kalmanDecompositionTerm
      (And.intro E.ctrlDimNonnegative E.unctrlDimNonnegative))

end ControllabilityCanonicalLaneLean
end HautevilleHouse