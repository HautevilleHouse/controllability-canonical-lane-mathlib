import ControllabilityCanonicalLaneLean.ReachabilityDecomposition

/-!
# Stabilizability Package
-/

namespace HautevilleHouse
namespace ControllabilityCanonicalLaneLean

structure StabilizabilityPackage where
  uncontrolledEigenvalues : Set ℂ
  stableUncontrolledEigenvalues : Prop
  feedbackMatrixExists : Prop
  closedLoopStable : Prop

structure StabilizabilityEvidence (S : StabilizabilityPackage) where
  stableUncontrolledEigenvaluesClosed : S.stableUncontrolledEigenvalues
  feedbackMatrixExistsClosed : S.feedbackMatrixExists
  closedLoopStableClosed : S.closedLoopStable

def StabilizabilityClosed (S : StabilizabilityPackage) : Prop :=
  S.stableUncontrolledEigenvalues ∧ S.feedbackMatrixExists ∧ S.closedLoopStable

theorem stabilizability_closed_from_evidence (S : StabilizabilityPackage) (E : StabilizabilityEvidence S) :
    StabilizabilityClosed S := by
  exact And.intro E.stableUncontrolledEigenvaluesClosed (And.intro E.feedbackMatrixExistsClosed E.closedLoopStableClosed)

end ControllabilityCanonicalLaneLean
end HautevilleHouse
