import ControllabilityCanonicalLaneLean.ControllabilityObservability

/-!
# Robust Controllability Package

This module introduces robust controllability under uncertainties,
framed as an admissible-class closure.
-/

namespace HautevilleHouse
namespace ControllabilityCanonicalLaneLean

structure UncertainControlSystem extends ControlSystem where
  disturbanceSet : Set inputSpace

def robustReachable (sys : UncertainControlSystem) : Set sys.stateSpace :=
  { x | ∃ u : sys.inputSpace, u ∈ sys.disturbanceSet ∧ x = sys.dynamics x u }

structure RobustControllabilityEvidence (sys : UncertainControlSystem) where
  robustReachableNonempty : robustReachable sys ≠ ∅
  robustBridgeClosed : bridgeClosed (AdmissibleClass.mk
    ({
      reachableSet := robustReachable sys
      constrainedDynamics := True
      endpointSatisfied := robustReachable sys ≠ ∅
      remainderRecorded := False
      gateWitness := Or.inl (by trivial)
    } : ControlAdmittedObject) _ _)

theorem robust_controllability_closed (sys : UncertainControlSystem)
    (E : RobustControllabilityEvidence sys) :
    bridgeClosed (AdmissibleClass.mk
      ({
        reachableSet := robustReachable sys
        constrainedDynamics := True
        endpointSatisfied := robustReachable sys ≠ ∅
        remainderRecorded := False
        gateWitness := Or.inl (by trivial)
      } : ControlAdmittedObject)
      (by rfl) (by rfl)) := by
  exact E.robustBridgeClosed

end ControllabilityCanonicalLaneLean
end HautevilleHouse