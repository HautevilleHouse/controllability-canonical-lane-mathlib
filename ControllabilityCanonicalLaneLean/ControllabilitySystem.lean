import ControllabilityCanonicalLaneLean.ControllabilityAdmissibleClass

/-!
# Controllability System Package

This module defines the structure of a control system and its controllability
properties, framed as admissible-class evidence.
-/

namespace HautevilleHouse
namespace ControllabilityCanonicalLaneLean

structure ControlSystem where
  stateSpace : Type u
  inputSpace : Type v
  dynamics : stateSpace → inputSpace → stateSpace
  reachableSet : Set stateSpace

def reachable (sys : ControlSystem) (x : sys.stateSpace) : Prop :=
  x ∈ sys.reachableSet

structure ControllabilityEvidence (sys : ControlSystem) where
  reachableSetNonempty : reachable sys ≠ ∅
  constrainedDynamics : Prop

def ControllabilityClosed (sys : ControlSystem) : Prop :=
  reachable sys ≠ ∅

theorem controllability_closed_from_evidence (sys : ControlSystem)
    (E : ControllabilityEvidence sys) : ControllabilityClosed sys := by
  exact E.reachableSetNonempty

end ControllabilityCanonicalLaneLean
end HautevilleHouse